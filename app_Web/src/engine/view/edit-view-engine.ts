import ViewEngine from './view-engine';

/**
 * 编辑视图引擎
 *
 * @export
 * @class EditViewEngine
 * @extends {ViewEngine}
 */
export default class EditViewEngine extends ViewEngine {
    /**
     * 表单部件
     *
     * @protected
     * @type {*}
     * @memberof EditViewEngine
     */
    protected form: any;

    /**
     * 父健为当前健
     *
     * @protected
     * @type {string}
     * @memberof EditViewEngine
     */
    protected p2k: string = '';

    /**
     * 初始化编辑视图引擎
     *
     * @param {*} [options={}]
     * @memberof EditViewEngine
     */
    public init(options: any = {}): void {
        this.form = options.form;
        this.p2k = options.p2k;
        super.init(options);
    }

    /**
     * 引擎加载
     *
     * @param {*} [opts={}]
     * @memberof EditViewEngine
     */
    public load(opts: any = {}): void {
        super.load(opts);
        if (this.getForm() && this.isLoadDefault) {
            const tag = this.getForm().name;
            let action: string = '';
            if (
                this.keyPSDEField &&
                this.view.context[this.keyPSDEField] &&
                !Object.is(this.view.context[this.keyPSDEField], '')
            ) {
                action = 'load';
            } else {
                action = 'loaddraft';
            }
            this.setViewState2({ tag: tag, action: action, viewdata: this.view.viewparams });
        }
        this.isLoadDefault = true;
    }

    /**
     * 部件事件机制
     *
     * @param {string} ctrlName
     * @param {string} eventName
     * @param {*} args
     * @memberof EditViewEngine
     */
    public onCtrlEvent(ctrlName: string, eventName: string, args: any): void {
        super.onCtrlEvent(ctrlName, eventName, args);
        if (Object.is(ctrlName, 'form')) {
            this.formEvent(eventName, args);
        }
    }

    /**
     * 表单事件
     *
     * @param {string} eventName
     * @param {*} args
     * @memberof EditViewEngine
     */
    public formEvent(eventName: string, args: any): void {
        if (Object.is(eventName, 'load')) {
            this.onFormLoad(args);
        }
        if (Object.is(eventName, 'save')) {
            this.onFormSave(args);
        }
        if (Object.is(eventName, 'remove')) {
            this.onFormRemove(args);
        }
    }

    /**
     * 表单加载完成
     *
     * @param {*} args
     * @memberof EditViewEngine
     */
    public onFormLoad(arg: any): void {
        this.view.model.dataInfo = Object.is(arg.srfuf, '1')
            ? this.majorPSDEField
                ? arg[this.majorPSDEField]
                : arg.srfmajortext
            : this.view.$t('app.local.new');

        this.setTabCaption(this.view.model.dataInfo, Object.is(arg.srfuf, '0'));
        const newdata: boolean = !Object.is(arg.srfuf, '1');
        this.calcToolbarItemState(newdata);
        this.calcToolbarItemAuthState(this.transformData(arg));
    }

    /**
     * 表单保存完成
     *
     * @param {*} args
     * @memberof EditViewEngine
     */
    public onFormSave(arg: any): void {
        this.view.model.dataInfo = Object.is(arg.srfuf, '1')
            ? this.majorPSDEField
                ? arg[this.majorPSDEField]
                : arg.srfmajortext
            : this.view.$t('app.local.new');

        this.setTabCaption(this.view.model.dataInfo, Object.is(arg.srfuf, '0'));
        const newdata: boolean = !Object.is(arg.srfuf, '1');
        this.calcToolbarItemState(newdata);
        this.calcToolbarItemAuthState(this.transformData(arg));
        this.view.$emit('save', arg);
        this.view.$emit('viewdataschange', JSON.stringify({ action: 'save', status: 'success', data: arg }));
    }

    /**
     * 表单删除完成
     *
     * @param {*} args
     * @memberof EditViewEngine
     */
    public onFormRemove(arg: any): void {
        this.view.$emit('remove', arg);
        this.view.$emit('viewdataschange', JSON.stringify({ action: 'remove', status: 'success', data: arg }));
    }

    /**
     * 处理实体界面行为
     *
     * @param {string} tag
     * @param {string} [actionmode]
     * @returns {void}
     * @memberof EditViewEngine
     */
    public doSysUIAction(tag: string, actionmode?: string): void {
        if (Object.is(tag, 'Save')) {
            this.doSave();
            return;
        }
        super.doSysUIAction(tag, actionmode);
    }

    /**
     * 编辑界面_保存操作
     *
     * @memberof IBizEditViewController
     */
    public doSave(): void {
        // this.afterformsaveaction = '';
        this.saveData({});
    }

    /**
     * 保存视图数据
     *
     * @param {*} [arg={}]
     * @memberof EditViewEngine
     */
    public saveData(arg: any = {}): void {
        if (this.getForm()) {
            const tag = this.getForm().name;
            this.setViewState2({ tag: tag, action: 'save', viewdata: arg });
        }
    }

    /**
     * 获取表单对象
     *
     * @returns {*}
     * @memberof EditViewEngine
     */
    public getForm(): any {
        return this.form;
    }

    /**
     * 设置分页标题
     *
     * @param {string} info
     * @param {boolean} isNew
     * @memberof EditViewEngine
     */
    public setTabCaption(info: string, isNew: boolean): void {
        let viewdata: any = this.view.model;
        if (viewdata && info && !Object.is(info, '')) {
            // if (this.view.$route) {
            //     this.view.$route.meta.info = info;
            // }
            this.view.$emit('viewModelChange', this.view.viewCaption);
            if (this.view.viewUsage === 1 || this.view.viewUsage === 7) {
                this.view.$appService.navHistory.setCaption({ tag: this.view.viewtag, info: viewdata.dataInfo });
            }
        }
    }

    /**
     * 转化数据
     *
     * @memberof EditViewEngine
     */
    public transformData(arg: any) {
        if (!this.getForm() || !(this.getForm().transformData instanceof Function)) {
            return null;
        }
        return this.getForm().transformData(arg);
    }
}
