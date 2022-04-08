import { Prop, Provide, Emit, Model } from 'vue-property-decorator';
import { Subject, Subscription } from 'rxjs';
import { UIActionTool, Util, ViewTool } from '@/utils';
import { Watch, GridControlBase } from '@/studio-core';
import ProductSumService from '@/service/product-sum/product-sum-service';
import ProductBugTypeSumFormService from './product-bug-type-sum-form-grid-service';
import ProductSumUIService from '@/uiservice/product-sum/product-sum-ui-service';
import { FormItemModel } from '@/model/form-detail';

/**
 * grid部件基类
 *
 * @export
 * @class GridControlBase
 * @extends {ProductBugTypeSumFormGridBase}
 */
export class ProductBugTypeSumFormGridBase extends GridControlBase {
    /**
     * 获取部件类型
     *
     * @protected
     * @type {string}
     * @memberof ProductBugTypeSumFormGridBase
     */
    protected controlType: string = 'GRID';

    /**
     * 建构部件服务对象
     *
     * @type {ProductBugTypeSumFormService}
     * @memberof ProductBugTypeSumFormGridBase
     */
    public service: ProductBugTypeSumFormService = new ProductBugTypeSumFormService({ $store: this.$store });

    /**
     * 实体服务对象
     *
     * @type {ProductSumService}
     * @memberof ProductBugTypeSumFormGridBase
     */
    public appEntityService: ProductSumService = new ProductSumService({ $store: this.$store });

    /**
     * 应用实体名称
     *
     * @protected
     * @type {string}
     * @memberof ProductBugTypeSumFormGridBase
     */
    protected appDeName: string = 'productsum';

    /**
     * 应用实体中文名称
     *
     * @protected
     * @type {string}
     * @memberof ProductBugTypeSumFormGridBase
     */
    protected appDeLogicName: string = '产品汇总表';

    /**
     * 界面UI服务对象
     *
     * @type {ProductSumUIService}
     * @memberof ProductBugTypeSumFormBase
     */  
    public appUIService: ProductSumUIService = new ProductSumUIService(this.$store);


    /**
     * 界面行为模型
     *
     * @type {*}
     * @memberof ProductBugTypeSumFormBase
     */  
    public ActionModel: any = {
    };

    /**
     * 主信息表格列
     *
     * @type {string}
     * @memberof ProductBugTypeSumFormBase
     */  
    public majorInfoColName:string = "name";


    /**
     * 本地缓存标识
     *
     * @protected
     * @type {string}
     * @memberof ProductBugTypeSumFormBase
     */
    protected localStorageTag: string = 'ibz_productsum_productbugtypesumform_grid';

    /**
     * 是否支持分页
     *
     * @type {boolean}
     * @memberof ProductBugTypeSumFormGridBase
     */
    public isEnablePagingBar: boolean = false;

    /**
     * 是否禁用排序
     *
     * @type {boolean}
     * @memberof ProductBugTypeSumFormGridBase
     */
    public isNoSort: boolean = true;

    /**
     * 分页条数
     *
     * @type {number}
     * @memberof ProductBugTypeSumFormGridBase
     */
    public limit: number = 1000;

    /**
     * 所有列成员
     *
     * @type {any[]}
     * @memberof ProductBugTypeSumFormGridBase
     */
    public allColumns: any[] = [
        {
            name: 'name',
            label: '产品名称',
            langtag: 'entities.productsum.productbugtypesumform_grid.columns.name',
            show: true,
            unit: 'STAR',
            isEnableRowEdit: false,
            enableCond: 3 ,
        },
        {
            name: 'codeerror',
            label: '代码错误',
            langtag: 'entities.productsum.productbugtypesumform_grid.columns.codeerror',
            show: true,
            unit: 'PX',
            isEnableRowEdit: false,
            enableCond: 3 ,
        },
        {
            name: 'config',
            label: '配置相关',
            langtag: 'entities.productsum.productbugtypesumform_grid.columns.config',
            show: true,
            unit: 'PX',
            isEnableRowEdit: false,
            enableCond: 3 ,
        },
        {
            name: 'install',
            label: '安装部署',
            langtag: 'entities.productsum.productbugtypesumform_grid.columns.install',
            show: true,
            unit: 'PX',
            isEnableRowEdit: false,
            enableCond: 3 ,
        },
        {
            name: 'security',
            label: '安全相关',
            langtag: 'entities.productsum.productbugtypesumform_grid.columns.security',
            show: true,
            unit: 'PX',
            isEnableRowEdit: false,
            enableCond: 3 ,
        },
        {
            name: 'performance',
            label: '性能问题',
            langtag: 'entities.productsum.productbugtypesumform_grid.columns.performance',
            show: true,
            unit: 'PX',
            isEnableRowEdit: false,
            enableCond: 3 ,
        },
        {
            name: 'standard',
            label: '标准规范',
            langtag: 'entities.productsum.productbugtypesumform_grid.columns.standard',
            show: true,
            unit: 'PX',
            isEnableRowEdit: false,
            enableCond: 3 ,
        },
        {
            name: 'automation',
            label: '测试脚本',
            langtag: 'entities.productsum.productbugtypesumform_grid.columns.automation',
            show: true,
            unit: 'PX',
            isEnableRowEdit: false,
            enableCond: 3 ,
        },
        {
            name: 'designdefect',
            label: '设计缺陷',
            langtag: 'entities.productsum.productbugtypesumform_grid.columns.designdefect',
            show: true,
            unit: 'PX',
            isEnableRowEdit: false,
            enableCond: 3 ,
        },
        {
            name: 'others',
            label: '其他',
            langtag: 'entities.productsum.productbugtypesumform_grid.columns.others',
            show: true,
            unit: 'PX',
            isEnableRowEdit: false,
            enableCond: 3 ,
        },
        {
            name: 'bugsum',
            label: 'bug总计',
            langtag: 'entities.productsum.productbugtypesumform_grid.columns.bugsum',
            show: true,
            unit: 'PX',
            isEnableRowEdit: false,
            enableCond: 3 ,
        },
    ]

    /**
     * 获取表格行模型
     *
     * @type {*}
     * @memberof ProductBugTypeSumFormGridBase
     */
    public getGridRowModel(){
        return {
          srfkey: new FormItemModel(),
        }
    }

    /**
     * 是否启用分组
     *
     * @type {boolean}
     * @memberof ProductBugTypeSumFormBase
     */
    public isEnableGroup:boolean = false;

    /**
     * 分组属性
     *
     * @type {string}
     * @memberof ProductBugTypeSumFormBase
     */
    public groupAppField:string ="";

    /**
     * 分组属性代码表标识
     *
     * @type {string}
     * @memberof ProductBugTypeSumFormBase
     */
    public groupAppFieldCodelistTag:string ="";

    /**
     * 分组属性代码表类型
     * 
     * @type {string}
     * @memberof ProductBugTypeSumFormBase
     */
    public groupAppFieldCodelistType: string = "";

    /**
     * 分组模式
     *
     * @type {string}
     * @memberof ProductBugTypeSumFormBase
     */
    public groupMode:string ="NONE";

    /**
     * 分组代码表标识
     * 
     * @type {string}
     * @memberof ProductBugTypeSumFormBase
     */
    public codelistTag: string = "";

    /**
     * 分组代码表类型
     * 
     * @type {string}
     * @memberof ProductBugTypeSumFormBase
     */
    public codelistType: string = "";

    /**
     * 属性值规则
     *
     * @type {*}
     * @memberof ProductBugTypeSumFormGridBase
     */
    public rules() {
        return {
        srfkey: [
            { required: false, validator: (rule:any, value:any, callback:any) => { return (rule.required && (value === null || value === undefined || value === "")) ? false : true;}, message: '主键标识 值不能为空', trigger: 'change' },
            { required: false, validator: (rule:any, value:any, callback:any) => { return (rule.required && (value === null || value === undefined || value === "")) ? false : true;}, message: '主键标识 值不能为空', trigger: 'blur' },
        ],
    }
    }

    /**
     * 属性值规则
     *
     * @type {*}
     * @memberof ProductBugTypeSumFormBase
     */
    public deRules:any = {
    };

    /**
     * 获取对应列class
     *
     * @type {*}
     * @memberof ProductBugTypeSumFormBase
     */
    public hasRowEdit: any = {
        'name':false,
        'codeerror':false,
        'config':false,
        'install':false,
        'security':false,
        'performance':false,
        'standard':false,
        'automation':false,
        'designdefect':false,
        'others':false,
        'bugsum':false,
    };

    /**
     * 获取对应列class
     *
     * @param {*} $args row 行数据，column 列数据，rowIndex 行索引，列索引
     * @returns {void}
     * @memberof ProductBugTypeSumFormBase
     */
    public getCellClassName(args: {row: any, column: any, rowIndex: number, columnIndex: number}): any {
        let className: string = '';
        if(args.column.property){
          let col = this.allColumns.find((item:any)=>{
              return Object.is(args.column.property,item.name);
          })
          if(col !== undefined){
              if(col.isEnableRowEdit && this.actualIsOpenEdit ){
                className += 'edit-cell ';
              }
          } else {
              className += 'info-cell';
          }
        }
        if(this.groupAppField && args.columnIndex === 0 && !this.isSingleSelect) {
            if(args.row.children && args.row.children.length > 0) {
                className += this.computeGroupRow(args.row.children, args.row);
            }
        }
        return className;
    }
    
    /**
     * 计算分组行checkbox选中样式
     *
     * @param {*} rows 当前分组行下的所有数据
     * @returns {*} currentRow 当前分组行
     * @memberof MainBase
     */
    public computeGroupRow(rows: any[], currentRow: any) {
        let count: number = 0;
        this.selections.forEach((select: any) => {
            rows.forEach((row: any) => {
                if(row.groupById === select.groupById) {
                    count++;
                }
            })
        })
        if(count === rows.length) {
            (this.$refs.multipleTable as any).toggleRowSelection(currentRow, true);
            return 'cell-select-all ';
        } else if(count !== 0 && count < rows.length) {
            return 'cell-indeterminate '
        } else if(count === 0) {
            (this.$refs.multipleTable as any).toggleRowSelection(currentRow, false);
            return '';
        }
    }

    /**
     * 导出数据格式化
     *
     * @param {*} filterVal
     * @param {*} jsonData
     * @param {any[]} [codelistColumns=[]]
     * @returns {Promise<any>}
     * @memberof ProductBugTypeSumFormGridBase
     */
    public async formatExcelData(filterVal: any, jsonData: any, codelistColumns?: any[]): Promise<any> {
        return super.formatExcelData(filterVal, jsonData, [
        ]);
    }

    /**
     * 合计行绘制
     *
     * @param {any} param
     * @memberof ProductBugTypeSumFormGridBase
     */
    public getSummaries(param:any){
        const { columns, data } = param;
        const sums:Array<any> = [];
        columns.forEach((column:any, index:number) => {
          if (index === 0) {
            sums[index] = (this.$t('app.gridpage.sum') as string);
            return;
          }
          const values = data.map((item:any) => Number(item[column.property]));
          if (!values.every((value:any) => isNaN(value))) {
                if(Object.is(column.property,'codeerror')){
                    let tempData = values.reduce((prev:any, curr:any) => {
                        const value = Number(curr);
                        if (!isNaN(value)) {
                            return prev + curr;
                        } else {
                            return prev;
                        }
                    }, 0);
                    sums[index] = tempData;
                }
                if(Object.is(column.property,'config')){
                    let tempData = values.reduce((prev:any, curr:any) => {
                        const value = Number(curr);
                        if (!isNaN(value)) {
                            return prev + curr;
                        } else {
                            return prev;
                        }
                    }, 0);
                    sums[index] = tempData;
                }
                if(Object.is(column.property,'install')){
                    let tempData = values.reduce((prev:any, curr:any) => {
                        const value = Number(curr);
                        if (!isNaN(value)) {
                            return prev + curr;
                        } else {
                            return prev;
                        }
                    }, 0);
                    sums[index] = tempData;
                }
                if(Object.is(column.property,'security')){
                    let tempData = values.reduce((prev:any, curr:any) => {
                        const value = Number(curr);
                        if (!isNaN(value)) {
                            return prev + curr;
                        } else {
                            return prev;
                        }
                    }, 0);
                    sums[index] = tempData;
                }
                if(Object.is(column.property,'performance')){
                    let tempData = values.reduce((prev:any, curr:any) => {
                        const value = Number(curr);
                        if (!isNaN(value)) {
                            return prev + curr;
                        } else {
                            return prev;
                        }
                    }, 0);
                    sums[index] = tempData;
                }
                if(Object.is(column.property,'standard')){
                    let tempData = values.reduce((prev:any, curr:any) => {
                        const value = Number(curr);
                        if (!isNaN(value)) {
                            return prev + curr;
                        } else {
                            return prev;
                        }
                    }, 0);
                    sums[index] = tempData;
                }
                if(Object.is(column.property,'automation')){
                    let tempData = values.reduce((prev:any, curr:any) => {
                        const value = Number(curr);
                        if (!isNaN(value)) {
                            return prev + curr;
                        } else {
                            return prev;
                        }
                    }, 0);
                    sums[index] = tempData;
                }
                if(Object.is(column.property,'designdefect')){
                    let tempData = values.reduce((prev:any, curr:any) => {
                        const value = Number(curr);
                        if (!isNaN(value)) {
                            return prev + curr;
                        } else {
                            return prev;
                        }
                    }, 0);
                    sums[index] = tempData;
                }
                if(Object.is(column.property,'others')){
                    let tempData = values.reduce((prev:any, curr:any) => {
                        const value = Number(curr);
                        if (!isNaN(value)) {
                            return prev + curr;
                        } else {
                            return prev;
                        }
                    }, 0);
                    sums[index] = tempData;
                }
                if(Object.is(column.property,'bugsum')){
                    let tempData = values.reduce((prev:any, curr:any) => {
                        const value = Number(curr);
                        if (!isNaN(value)) {
                            return prev + curr;
                        } else {
                            return prev;
                        }
                    }, 0);
                    sums[index] = tempData;
                }
          } else {
            sums[index] = 'N/A';
          }
        });
        return sums;
      }


    /**
     * 更新默认值
     * @param {*}  row 行数据
     * @memberof ProductBugTypeSumFormBase
     */
    public updateDefault(row: any){                    
    }

    /**
    * 合并分组行
    * 
    * @memberof ProductBugTypeSumFormBase
    */
    public arraySpanMethod({row, column, rowIndex, columnIndex} : any) {
        let allColumns:Array<any> = ['name','codeerror','config','install','security','performance','standard','automation','designdefect','others','bugsum'];
        if(row && row.children) {
            if(columnIndex == (this.isSingleSelect ? 0:1)) {
                return [1, allColumns.length+1];
            } else if(columnIndex > (this.isSingleSelect ? 0:1)) {
                return [0,0];
            }
        }
    }

	/**
     * 分组方法
     * 
     * @memberof ProductBugTypeSumFormBase
     */
    public group(){
        if(Object.is(this.groupMode,"AUTO")){
            this.drawGroup();
        }else if(Object.is(this.groupMode,"CODELIST")){
            this.drawCodelistGroup();
        }
    }

    /**
     * 获取表格分组相关代码表
     * 
     * @param {string}  codelistType 代码表类型
     * @param {string}  codelistTag 代码表标识
     * @memberof ProductBugTypeSumFormBase
     */
    public async getGroupCodelist(codelistType: string,codelistTag:string){
        let codelist: Array<any> = [];
        // 动态代码表
        if (Object.is(codelistType, "DYNAMIC")) {
             codelist = await this.codeListService.getItems(codelistTag);
        // 静态代码表
        } else if(Object.is(codelistType, "STATIC")){
            codelist = this.$store.getters.getCodeListItems(codelistTag);
        }
        return codelist;
    }

    /**
     * 根据分组代码表绘制分组列表
     * 
     * @memberof ProductBugTypeSumFormBase
     */
    public async drawCodelistGroup(){
        if(!this.isEnableGroup) return;
        // 分组
        let allGroup: Array<any> = [];
        let allGroupField: Array<any> =[];
        let groupTree:Array<any> = [];
        allGroup = await this.getGroupCodelist(this.codelistType,this.codelistTag);
        allGroupField = await this.getGroupCodelist(this.groupAppFieldCodelistType,this.groupAppFieldCodelistTag);
        if(allGroup.length == 0){
            console.warn("分组数据无效");
        }
        allGroup.forEach((group: any,i: number)=>{
            let children:Array<any> = [];
            this.items.forEach((item: any,j: number)=>{
                if(allGroupField && allGroupField.length > 0){
                    const arr:Array<any> = allGroupField.filter((field:any)=>{return field.value == item[this.groupAppField]});
                    if(arr && arr.length>0) {
                        if(Object.is(group.value,arr[0].value)){
                            item.groupById = Number((i+1) * 100 + (j+1) * 1);
                            item.group = '';
                            children.push(item);
                        }
                    }
                }else if(Object.is(group.value,item[this.groupAppField])){
                    item.groupById = Number((i+1) * 100 + (j+1) * 1);
                    item.group = '';
                    children.push(item);
                }
            });
            const tree: any ={
                groupById: Number((i+1)*100),
                group: group.label,
                name:'',
                codeerror:'',
                config:'',
                install:'',
                security:'',
                performance:'',
                standard:'',
                automation:'',
                designdefect:'',
                others:'',
                bugsum:'',
                children: children
            }
            groupTree.push(tree);
        });
        let child:Array<any> = [];
        this.items.forEach((item: any,index: number)=>{
            let i: number = 0;
            if(allGroupField && allGroupField.length > 0){
                const arr:Array<any> = allGroupField.filter((field:any)=>{return field.value == item[this.groupAppField]});
                if(arr && arr.length>0) {
                    i = allGroup.findIndex((group: any)=>Object.is(group.value,arr[0].value));
                }
            }else{
                i = allGroup.findIndex((group: any)=>Object.is(group.value,item[this.groupAppField]));
            }
            if(i < 0){
                item.groupById = Number((allGroup.length+1) * 100 + (index+1) * 1);
                item.group = '';
                child.push(item);
            }
        })
        const Tree: any = {
            groupById: Number((allGroup.length+1)*100),
            group: '其他',
            name:'',
            codeerror:'',
            config:'',
            install:'',
            security:'',
            performance:'',
            standard:'',
            automation:'',
            designdefect:'',
            others:'',
            bugsum:'',
            children: child
        }
        if(child && child.length > 0){
            groupTree.push(Tree);
        }
        this.items = groupTree;
        if(this.actualIsOpenEdit) {
            for(let i = 0; i < this.items.length; i++) {
                this.gridItemsModel.push(this.getGridRowModel());
            }
        }
    }

    /**
     * 绘制分组
     * 
     * @memberof ProductBugTypeSumFormBase
     */
    public async drawGroup(){
        if(!this.isEnableGroup) return;
        // 分组
        let allGroup: Array<any> = [];
        let allGroupField: Array<any> =[];
        allGroupField = await this.getGroupCodelist(this.groupAppFieldCodelistType,this.groupAppFieldCodelistTag);
        this.items.forEach((item: any)=>{
            if(item.hasOwnProperty(this.groupAppField)){
                if(allGroupField && allGroupField.length > 0){
                    const arr:Array<any> = allGroupField.filter((field:any)=>{return field.value == item[this.groupAppField]});
                    allGroup.push(arr[0].label);
                }else{
                    allGroup.push(item[this.groupAppField]);
                }
            }
        });
        let groupTree:Array<any> = [];
        allGroup = [...new Set(allGroup)];
        if(allGroup.length == 0){
            console.warn("分组数据无效");
        }
        // 组装数据
        allGroup.forEach((group: any, groupIndex: number)=>{
            let children:Array<any> = [];
            this.items.forEach((item: any,itemIndex: number)=>{
                if(allGroupField && allGroupField.length > 0){
                    const arr:Array<any> = allGroupField.filter((field:any)=>{return field.value == item[this.groupAppField]});
                    if(Object.is(group,arr[0].label)){
                        item.groupById = Number((groupIndex+1) * 100 + (itemIndex+1) * 1);
                        item.group = '';
                        children.push(item);
                    }
                }else if(Object.is(group,item[this.groupAppField])){
                    item.groupById = Number((groupIndex+1) * 100 + (itemIndex+1) * 1);
                    item.group = '';
                    children.push(item);
                }
            });
            group = group ? group : '其他';
            const tree: any ={
                groupById: Number((groupIndex+1)*100),
                group: group,
                name:'',
                codeerror:'',
                config:'',
                install:'',
                security:'',
                performance:'',
                standard:'',
                automation:'',
                designdefect:'',
                others:'',
                bugsum:'',
                children: children,
            }
            groupTree.push(tree);
        });
        this.items = groupTree;
        if(this.actualIsOpenEdit) {
            for(let i = 0; i < this.items.length; i++) {
                this.gridItemsModel.push(this.getGridRowModel());
            }
        }
    }

    /**
     * 计算数据对象类型的默认值
     * @param {string}  action 行为
     * @param {string}  param 默认值参数
     * @param {*}  data 当前行数据
     * @memberof ProductBugTypeSumFormBase
     */
    public computeDefaultValueWithParam(action:string,param:string,data:any){
        if(Object.is(action,"UPDATE")){
            const nativeData:any = this.service.getCopynativeData();
            if(nativeData && (nativeData instanceof Array) && nativeData.length >0){
                let targetData:any = nativeData.find((item:any) =>{
                    return item.id === data.srfkey;
                })
                if(targetData){
                    return targetData[param]?targetData[param]:null;
                }else{
                    return null;
                }
            }else{
                return null;
            }
        }else{
           return this.service.getRemoteCopyData()[param]?this.service.getRemoteCopyData()[param]:null;
        }
    }


}