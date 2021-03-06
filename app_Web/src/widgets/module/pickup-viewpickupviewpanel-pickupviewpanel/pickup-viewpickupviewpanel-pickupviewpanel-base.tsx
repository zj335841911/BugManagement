import { Prop, Provide, Emit, Model } from 'vue-property-decorator';
import { Subject, Subscription } from 'rxjs';
import { UIActionTool, Util, ViewTool } from '@/utils';
import { Watch, MainControlBase } from '@/studio-core';
import ModuleService from '@/service/module/module-service';
import PickupViewpickupviewpanelService from './pickup-viewpickupviewpanel-pickupviewpanel-service';
import ModuleUIService from '@/uiservice/module/module-ui-service';
import PickupViewpickupviewpanelModel from './pickup-viewpickupviewpanel-pickupviewpanel-model';

/**
 * pickupviewpanel部件基类
 *
 * @export
 * @class MainControlBase
 * @extends {PickupViewpickupviewpanelPickupviewpanelBase}
 */
export class PickupViewpickupviewpanelPickupviewpanelBase extends MainControlBase {
    /**
     * 获取部件类型
     *
     * @protected
     * @type {string}
     * @memberof PickupViewpickupviewpanelPickupviewpanelBase
     */
    protected controlType: string = 'PICKUPVIEWPANEL';

    /**
     * 建构部件服务对象
     *
     * @type {PickupViewpickupviewpanelService}
     * @memberof PickupViewpickupviewpanelPickupviewpanelBase
     */
    public service: PickupViewpickupviewpanelService = new PickupViewpickupviewpanelService({ $store: this.$store });

    /**
     * 实体服务对象
     *
     * @type {ModuleService}
     * @memberof PickupViewpickupviewpanelPickupviewpanelBase
     */
    public appEntityService: ModuleService = new ModuleService({ $store: this.$store });

    /**
     * 应用实体名称
     *
     * @protected
     * @type {string}
     * @memberof PickupViewpickupviewpanelPickupviewpanelBase
     */
    protected appDeName: string = 'module';

    /**
     * 应用实体中文名称
     *
     * @protected
     * @type {string}
     * @memberof PickupViewpickupviewpanelPickupviewpanelBase
     */
    protected appDeLogicName: string = '模块';

    /**
     * 界面UI服务对象
     *
     * @type {ModuleUIService}
     * @memberof PickupViewpickupviewpanelBase
     */  
    public appUIService: ModuleUIService = new ModuleUIService(this.$store);



    /**
     * 选中数据字符串
     *
     * @type {string}
     * @memberof PickupViewpickupviewpanel
     */
    @Prop() public selectedData?: string;

    /**
     * 获取多项数据
     *
     * @returns {any[]}
     * @memberof PickupViewpickupviewpanel
     */
    public getDatas(): any[] {
        return [];
    }

    /**
     * 获取单项树
     *
     * @returns {*}
     * @memberof PickupViewpickupviewpanel
     */
    public getData(): any {
        return {};
    }

    /**
     * 视图名称
     *
     * @type {*}
     * @memberof PickupViewpickupviewpanel
     */
    public view: any = {
        viewname: 'module-pickup-grid-view',
        data: {},
    }

    /**
     * 局部上下文
     *
     * @type {*}
     * @memberof PickupViewpickupviewpanel
     */
    public localContext: any = null;

    /**
     * 局部视图参数
     *
     * @type {*}
     * @memberof PickupViewpickupviewpanel
     */
    public localViewParam: any = null;

    /**
     * 视图数据
     *
     * @type {*}
     * @memberof PickupViewpickupviewpanel
     */
    public viewdata: string  = JSON.stringify(this.context);

    /**
     * 视图参数
     *
     * @type {*}
     * @memberof PickupViewpickupviewpanel
     */
    public viewparam: string  = JSON.stringify(this.viewparams);

    /**
     * 是否显示按钮
     *
     * @type {boolean}
     * @memberof PickupViewpickupviewpanel
     */
    @Prop({default: true}) public isShowButton!: boolean;

    /**
     * 是否单选
     *
     * @type {boolean}
     * @memberof PickupViewpickupviewpanel
     */
    @Prop() public isSingleSelect?: boolean;

    /**
     * 初始化完成
     *
     * @type {boolean}
     * @memberof PickupViewpickupviewpanel
     */
    public inited: boolean = false;

    /**
     * 视图数据变化
     *
     * @param {*} $event
     * @memberof PickupViewpickupviewpanel
     */
    public onViewDatasChange($event: any): void {
        if($event.length>0){
          $event.forEach((item:any,index:any) => {
              let srfmajortext = item['name'];
              if(srfmajortext){
                Object.assign($event[index],{srfmajortext: srfmajortext});
              }
          });
        }
        this.$emit('selectionchange', $event);
    }

    /**
     * 视图数据被激活
     *
     * @param {*} $event
     * @memberof PickupViewpickupviewpanel
     */
    public viewDatasActivated($event: any): void {
        this.$emit('activated', $event);
    }

    /**
     * 视图加载完成
     *
     * @param {*} $event
     * @memberof PickupViewpickupviewpanel
     */
    public onViewLoad($event: any): void {
        this.$emit('load', $event);
    }

    /**
     * vue 生命周期
     *
     * @memberof PickupViewpickupviewpanel
     */
    public created() {
        this.afterCreated();
    }

    /**
     * 执行created后的逻辑
     *
     *  @memberof PickupViewpickupviewpanel
     */    
    public afterCreated(){
        this.initNavParam();
        if (this.viewState) {
            this.viewStateEvent = this.viewState.subscribe(({ tag, action, data }) => {
                if (!Object.is(tag, this.name)) {
                    return;
                }
                if (Object.is('load', action)) {
                    this.viewdata = JSON.stringify(this.context);
                    this.viewparam = JSON.stringify(Object.assign(data, this.viewparams));
                    this.inited = true;
                }
            });
        }
    }

    /**
     * 初始化导航参数
     *
     *  @memberof PickupViewpickupviewpanel
     */  
    public initNavParam(){
        if(this.localContext && Object.keys(this.localContext).length >0){
            let _context:any = this.$util.computedNavData({},this.context,this.viewparams,this.localContext);
            Object.assign(this.context,_context);
        }
        if(this.localViewParam && Object.keys(this.localViewParam).length >0){
            let _param:any = this.$util.computedNavData({},this.context,this.viewparams,this.localViewParam);
            Object.assign(this.viewparams,_param);
        }
        this.viewdata = JSON.stringify(this.context);
        this.viewparam = JSON.stringify(this.viewparams);
    }


    /**
     * vue 生命周期
     *
     * @memberof PickupViewpickupviewpanel
     */
    public destroyed() {
        this.afterDestroy();
    }

    /**
     * 执行destroyed后的逻辑
     *
     * @memberof PickupViewpickupviewpanel
     */
    public afterDestroy() {
        if (this.viewStateEvent) {
            this.viewStateEvent.unsubscribe();
        }
    }

}