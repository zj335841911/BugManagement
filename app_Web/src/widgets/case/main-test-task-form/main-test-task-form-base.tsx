import { Prop, Provide, Emit, Model } from 'vue-property-decorator';
import { Subject, Subscription } from 'rxjs';
import { UIActionTool, Util, ViewTool } from '@/utils';
import { Watch, EditFormControlBase } from '@/studio-core';
import CaseService from '@/service/case/case-service';
import MainTestTaskService from './main-test-task-form-service';
import CaseUIService from '@/uiservice/case/case-ui-service';
import {
    FormButtonModel,
    FormPageModel,
    FormItemModel,
    FormDRUIPartModel,
    FormPartModel,
    FormGroupPanelModel,
    FormIFrameModel,
    FormRowItemModel,
    FormTabPageModel,
    FormTabPanelModel,
    FormUserControlModel,
} from '@/model/form-detail';

/**
 * form部件基类
 *
 * @export
 * @class EditFormControlBase
 * @extends {MainTestTaskEditFormBase}
 */
export class MainTestTaskEditFormBase extends EditFormControlBase {
    /**
     * 获取部件类型
     *
     * @protected
     * @type {string}
     * @memberof MainTestTaskEditFormBase
     */
    protected controlType: string = 'FORM';

    /**
     * 建构部件服务对象
     *
     * @type {MainTestTaskService}
     * @memberof MainTestTaskEditFormBase
     */
    public service: MainTestTaskService = new MainTestTaskService({ $store: this.$store });

    /**
     * 实体服务对象
     *
     * @type {CaseService}
     * @memberof MainTestTaskEditFormBase
     */
    public appEntityService: CaseService = new CaseService({ $store: this.$store });

    /**
     * 应用实体名称
     *
     * @protected
     * @type {string}
     * @memberof MainTestTaskEditFormBase
     */
    protected appDeName: string = 'case';

    /**
     * 应用实体中文名称
     *
     * @protected
     * @type {string}
     * @memberof MainTestTaskEditFormBase
     */
    protected appDeLogicName: string = '测试用例';

    /**
     * 界面UI服务对象
     *
     * @type {CaseUIService}
     * @memberof MainTestTaskBase
     */  
    public appUIService: CaseUIService = new CaseUIService(this.$store);


    /**
     * 关系界面数量
     *
     * @protected
     * @type {number}
     * @memberof MainTestTaskEditFormBase
     */
    protected drCount: number = 2;
    /**
     * 表单数据对象
     *
     * @type {*}
     * @memberof MainTestTaskEditFormBase
     */
    public data: any = {
        srfupdatedate: null,
        srforikey: null,
        srfkey: null,
        srfmajortext: null,
        srftempmode: null,
        srfuf: null,
        srfdeid: null,
        srfsourcekey: null,
        version: null,
        precondition: null,
        resultcnt: null,
        resultfalicnt: null,
        task: null,
        id: null,
        case: null,
    };

    /**
     * 主信息属性映射表单项名称
     *
     * @type {*}
     * @memberof MainTestTaskEditFormBase
     */
    public majorMessageField: string = '';

    /**
     * 属性值规则
     *
     * @type {*}
     * @memberof MainTestTaskEditFormBase
     */
    public rules(): any{
        return {
        }
    }

    /**
     * 属性值规则
     *
     * @type {*}
     * @memberof MainTestTaskBase
     */
    public deRules:any = {
    };

    /**
     * 详情模型集合
     *
     * @type {*}
     * @memberof MainTestTaskEditFormBase
     */
    public detailsModel: any = {
        grouppanel4: new FormGroupPanelModel({ caption: '分组面板', detailType: 'GROUPPANEL', name: 'grouppanel4', visible: true, isShowCaption: false, form: this, showMoreMode: 0, uiActionGroup: { caption: '', langbase: 'entities.case.maintesttask_form', extractMode: 'ITEM', details: [] } }),

        druipart1: new FormDRUIPartModel({ caption: '用例步骤', detailType: 'DRUIPART', name: 'druipart1', visible: true, isShowCaption: true, form: this, showMoreMode: 0 }),

        rawitem1: new FormRowItemModel({ caption: '', detailType: 'RAWITEM', name: 'rawitem1', visible: true, isShowCaption: true, form: this, showMoreMode: 0 }),

        rawitem3: new FormRowItemModel({ caption: '', detailType: 'RAWITEM', name: 'rawitem3', visible: false, isShowCaption: true, form: this, showMoreMode: 0 }),

        grouppanel1: new FormGroupPanelModel({ caption: '分组面板', detailType: 'GROUPPANEL', name: 'grouppanel1', visible: true, isShowCaption: false, form: this, showMoreMode: 0, uiActionGroup: { caption: '', langbase: 'entities.case.maintesttask_form', extractMode: 'ITEM', details: [] } }),

        druipart2: new FormDRUIPartModel({ caption: '', detailType: 'DRUIPART', name: 'druipart2', visible: true, isShowCaption: true, form: this, showMoreMode: 0 }),

        grouppanel2: new FormGroupPanelModel({ caption: '分组面板', detailType: 'GROUPPANEL', name: 'grouppanel2', visible: true, isShowCaption: false, form: this, showMoreMode: 0, uiActionGroup: { caption: '', langbase: 'entities.case.maintesttask_form', extractMode: 'ITEM', details: [] } }),

        grouppanel3: new FormGroupPanelModel({ caption: '分组面板', detailType: 'GROUPPANEL', name: 'grouppanel3', visible: true, isShowCaption: false, form: this, showMoreMode: 0, uiActionGroup: { caption: '', langbase: 'entities.case.maintesttask_form', extractMode: 'ITEM', details: [] } }),

        group1: new FormGroupPanelModel({ caption: '测试用例基本信息', detailType: 'GROUPPANEL', name: 'group1', visible: true, isShowCaption: false, form: this, showMoreMode: 0, uiActionGroup: { caption: '', langbase: 'entities.case.maintesttask_form', extractMode: 'ITEM', details: [] } }),

        formpage1: new FormPageModel({ caption: '基本信息', detailType: 'FORMPAGE', name: 'formpage1', visible: true, isShowCaption: true, form: this, showMoreMode: 0 }),

        srfupdatedate: new FormItemModel({
    caption: '修改日期', detailType: 'FORMITEM', name: 'srfupdatedate', visible: true, isShowCaption: true, form: this, showMoreMode: 0,
    required:false,
    disabled: false,
    enableCond: 0,
}),

        srforikey: new FormItemModel({
    caption: '', detailType: 'FORMITEM', name: 'srforikey', visible: true, isShowCaption: true, form: this, showMoreMode: 0,
    required:false,
    disabled: false,
    enableCond: 3,
}),

        srfkey: new FormItemModel({
    caption: '用例编号', detailType: 'FORMITEM', name: 'srfkey', visible: true, isShowCaption: true, form: this, showMoreMode: 0,
    required:false,
    disabled: false,
    enableCond: 0,
}),

        srfmajortext: new FormItemModel({
    caption: '用例标题', detailType: 'FORMITEM', name: 'srfmajortext', visible: true, isShowCaption: true, form: this, showMoreMode: 0,
    required:false,
    disabled: false,
    enableCond: 3,
}),

        srftempmode: new FormItemModel({
    caption: '', detailType: 'FORMITEM', name: 'srftempmode', visible: true, isShowCaption: true, form: this, showMoreMode: 0,
    required:false,
    disabled: false,
    enableCond: 3,
}),

        srfuf: new FormItemModel({
    caption: '', detailType: 'FORMITEM', name: 'srfuf', visible: true, isShowCaption: true, form: this, showMoreMode: 0,
    required:false,
    disabled: false,
    enableCond: 3,
}),

        srfdeid: new FormItemModel({
    caption: '', detailType: 'FORMITEM', name: 'srfdeid', visible: true, isShowCaption: true, form: this, showMoreMode: 0,
    required:false,
    disabled: false,
    enableCond: 3,
}),

        srfsourcekey: new FormItemModel({
    caption: '', detailType: 'FORMITEM', name: 'srfsourcekey', visible: true, isShowCaption: true, form: this, showMoreMode: 0,
    required:false,
    disabled: false,
    enableCond: 3,
}),

        version: new FormItemModel({
    caption: '版本#', detailType: 'FORMITEM', name: 'version', visible: true, isShowCaption: true, form: this, showMoreMode: 0,
    required:false,
    disabled: false,
    enableCond: 3,
}),

        precondition: new FormItemModel({
    caption: '前置条件', detailType: 'FORMITEM', name: 'precondition', visible: false, isShowCaption: true, form: this, showMoreMode: 0,
    required:false,
    disabled: false,
    enableCond: 3,
}),

        resultcnt: new FormItemModel({
    caption: '共执行', detailType: 'FORMITEM', name: 'resultcnt', visible: true, isShowCaption: true, form: this, showMoreMode: 0,
    required:false,
    disabled: false,
    enableCond: 3,
}),

        resultfalicnt: new FormItemModel({
    caption: '失败', detailType: 'FORMITEM', name: 'resultfalicnt', visible: false, isShowCaption: true, form: this, showMoreMode: 0,
    required:false,
    disabled: false,
    enableCond: 3,
}),

        task: new FormItemModel({
    caption: '属性', detailType: 'FORMITEM', name: 'task', visible: true, isShowCaption: true, form: this, showMoreMode: 0,
    required:false,
    disabled: false,
    enableCond: 3,
}),

        id: new FormItemModel({
    caption: '用例编号', detailType: 'FORMITEM', name: 'id', visible: true, isShowCaption: true, form: this, showMoreMode: 0,
    required:false,
    disabled: false,
    enableCond: 0,
}),

    };

    /**
     * 表单项逻辑
     *
     * @param {{ name: string, newVal: any, oldVal: any }} { name, newVal, oldVal }
     * @returns {Promise<void>}
     * @memberof MainTestTaskEditFormBase
     */
    public async formLogic({ name, newVal, oldVal }: { name: string; newVal: any; oldVal: any }): Promise<void> {
                



        if (Object.is(name, '') || Object.is(name, 'resultcnt') || Object.is(name, 'resultfalicnt')) {
            let ret = false;
            const _resultcnt = this.data.resultcnt;
            const _resultfalicnt = this.data.resultfalicnt;
            if (this.$verify.testCond(_resultfalicnt, 'EQ', '0') && this.$verify.testCond(_resultcnt, 'GT', '0')) {
                ret = true;
            }
            this.detailsModel.rawitem3.setVisible(ret);
        }
















        if (Object.is(name, '') || Object.is(name, 'precondition')) {
            let ret = false;
            const _precondition = this.data.precondition;
            if (this.$verify.testCond(_precondition, 'ISNOTNULL', '')) {
                ret = true;
            }
            this.detailsModel.precondition.setVisible(ret);
        }


        if (Object.is(name, '') || Object.is(name, 'resultfalicnt')) {
            let ret = false;
            const _resultfalicnt = this.data.resultfalicnt;
            if (this.$verify.testCond(_resultfalicnt, 'GT', '0')) {
                ret = true;
            }
            this.detailsModel.resultfalicnt.setVisible(ret);
        }



    }

    /**
     * 更新默认值
     * @memberof MainTestTaskEditFormBase
     */
    public updateDefault() {                    
        if (this.data.hasOwnProperty('task') && !this.data.task) {
            this.data['task'] = this.viewparams['task'];
        }
    }

    /**
     * 面板数据变化处理事件
     * @param {any} item 当前数据
     * @param {any} $event 面板事件数据
     *
     * @memberof MainTestTaskBase
     */
    public onPanelDataChange(item:any,$event:any) {
        Object.assign(item, $event, {rowDataState:'update'});
    }
}