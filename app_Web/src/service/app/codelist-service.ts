import store from '@/store';
import EntityService from '../entity-service';

/**
 * 动态代码表服务类
 *
 * @export
 * @class CodeListService
 */
export default class CodeListService {
    /**
     * Vue 状态管理器
     *
     * @private
     * @type {(any | null)}
     * @memberof CodeListService
     */
    private $store: any;

    constructor(opts: any = {}) {
        this.$store = store;
    }

    /**
     * 获取状态管理器
     *
     * @returns {(any | null)}
     * @memberof CodeListService
     */
    public getStore(): any {
        return this.$store;
    }

    /**
     * 动态代码表缓存(加载中)
     *
     * @type {Map<string,any>}
     * @memberof CodeListService
     */
    public static codelistCache: Map<string, any> = new Map();

    /**
     * 动态代码表缓存(已完成)
     *
     * @type {Map<string,any>}
     * @memberof CodeListService
     */
    public static codelistCached: Map<string, any> = new Map();

    /**
     * 数据服务基类
     *
     * @type {Minorentity}
     * @memberof CodeListService
     */
    public entityService: EntityService = new EntityService();

    /**
     * 获取代码表服务
     *
     * @protected
     * @param {string} name 实体名称
     * @returns {Promise<any>}
     * @memberof EntityService
     */
    public getService(name: string): Promise<any> {
        return (window as any)['codeListRegister'].getService(name);
    }
    
    /**
     * 获取代码表数据
     *
     * @param {string} tag 代码表标识
     * @param {*} context 
     * @param {*} data
     * @param {boolean} isloading
     * @returns {Promise<any[]>}
     * @memberof CodeListService
     */
    public async getDataItems(codelist:any,context?:any, data?: any, isloading?: boolean){
        let dataItems:Array<any> = [];
        try{
            if(codelist.tag && Object.is(codelist.type,"STATIC")){
                dataItems = await this.getStaticItems(codelist.tag);
            }else{
                dataItems = await this.getItems(codelist.tag,codelist.context,codelist.viewparam,codelist.isloading);
            }
        }catch(error:any){
            console.warn("代码表加载异常" + error);
        }
        return dataItems;
    }

    /**
     * 获取静态代码表
     *
     * @param {string} tag 代码表标识
     * @returns {Promise<any[]>}
     * @memberof CodeListService
     */
    public getStaticItems(tag: string): Promise<any[]> {
        return new Promise((resolve: any, reject: any) => {
            const codelist = this.$store.getters.getCodeList(tag);
            if (codelist) {
                let items: Array<any> = [...JSON.parse(JSON.stringify(codelist.items))];
                resolve(items);
            }
        });
    }

    /**
     * 获取预定义代码表
     *
     * @param {string} tag 代码表标识
     * @returns {Promise<any[]>}
     * @memberof CodeListService
     */
    public getPredefinedItems(tag: string, data?: any, isloading?: boolean): Promise<any[]> {
        return new Promise((resolve: any, reject: any) => {
            if (CodeListService.codelistCached.get(`${tag}`)) {
                let items: any = CodeListService.codelistCached.get(`${tag}`).items;
                if (items.length > 0) resolve(items);
            }
            const callback: Function = (tag: string, promise: Promise<any>) => {
                promise
                    .then((res: any) => {
                        let result: any = res.data;
                        if (result.items && result.items.length > 0) {
                            CodeListService.codelistCached.set(`${tag}`, { items: result.items });
                            return resolve(result.items);
                        } else {
                            return resolve([]);
                        }
                    })
                    .catch((result: any) => {
                        return reject(result);
                    });
            };
            // 加载中，UI又需要数据，解决连续加载同一代码表问题
            if (CodeListService.codelistCache.get(`${tag}`)) {
                callback(tag, CodeListService.codelistCache.get(`${tag}`));
            } else {
                let result: Promise<any> = this.entityService.getPredefinedCodelist(tag);
                CodeListService.codelistCache.set(`${tag}`, result);
                callback(tag, result);
            }
        });
    }

    /**
     * 获取动态代码表
     *
     * @param {string} tag 代码表标识
     * @param {string} context
     * @returns {Promise<any[]>}
     * @memberof CodeListService
     */
    public getItems(tag: string, context: any = {}, data?: any, isloading?: boolean): Promise<any[]> {
        let _this: any = this;
        if (context && context.srfsessionid) {
            delete context.srfsessionid;
        }
        return new Promise((resolve: any, reject: any) => {
            this.getService(tag)
                .then((codelist: any) => {
                    if (Object.is(codelist.predefinedType, 'RUNTIME')) {
                        this.getPredefinedItems(tag).then((res: any) => {
                            resolve(res);
                        });
                        return;
                    }
                    let isEnableCache: boolean = codelist.isEnableCache;
                    let cacheTimeout: any = codelist.cacheTimeout;
                    // 启用缓存
                    if (isEnableCache) {
                        const callback: Function = (
                            context: any = {},
                            data: any = {},
                            tag: string,
                            promise: Promise<any>
                        ) => {
                            const callbackKey: string = `${JSON.stringify(context)}-${JSON.stringify(data)}-${tag}`;
                            promise
                                .then((result: any) => {
                                    if (result.length > 0) {
                                        CodeListService.codelistCached.set(callbackKey, { items: result });
                                        CodeListService.codelistCache.delete(callbackKey);
                                        return resolve(result);
                                    } else {
                                        return resolve([]);
                                    }
                                })
                                .catch((result: any) => {
                                    return reject(result);
                                });
                        };
                        // 加载完成,从本地缓存获取
                        const key: string = `${JSON.stringify(context)}-${JSON.stringify(data)}-${tag}`;
                        if (CodeListService.codelistCached.get(key)) {
                            let items: any = CodeListService.codelistCached.get(key).items;
                            if (items.length > 0) {
                                if (new Date().getTime() <= codelist.getExpirationTime()) {
                                    return resolve(items);
                                }
                            }
                        }
                        if (codelist) {
                            // 加载中，UI又需要数据，解决连续加载同一代码表问题
                            if (CodeListService.codelistCache.get(key)) {
                                callback(context, data, tag, CodeListService.codelistCache.get(key));
                            } else {
                                let result: Promise<any> = codelist.getItems(context, data, isloading);
                                CodeListService.codelistCache.set(key, result);
                                codelist.setExpirationTime(new Date().getTime() + cacheTimeout);
                                callback(context, data, tag, result);
                            }
                        }
                    } else {
                        if (codelist) {
                            codelist
                                .getItems(context, data, isloading)
                                .then((result: any) => {
                                    resolve(result);
                                })
                                .catch((error: any) => {
                                    Promise.reject([]);
                                });
                        } else {
                            return Promise.reject([]);
                        }
                    }
                })
                .catch((error: any) => {
                    console.warn('获取代码表异常');
                    return Promise.reject([]);
                });
        });
    }
}
