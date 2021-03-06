import MDViewEngine from './md-view-engine';

/**
 * 视图引擎基础
 *
 * @export
 * @class DataViewEngine
 * @extends {MDViewEngine}
 */
export default class DataViewEngine extends MDViewEngine {
    /**
     * 表格部件
     *
     * @type {*}
     * @memberof DataViewEngine
     */
    protected dataView: any;

    /**
     * Creates an instance of DataViewEngine.
     * @memberof DataViewEngine
     */
    constructor() {
        super();
    }

    /**
     * 引擎初始化
     *
     * @param {*} [options={}]
     * @memberof DataViewEngine
     */
    public init(options: any = {}): void {
        this.dataView = options.dataview;
        super.init(options);
    }

    /**
     * 部件事件
     *
     * @param {string} ctrlName
     * @param {string} eventName
     * @param {*} args
     * @memberof DataViewEngine
     */
    public onCtrlEvent(ctrlName: string, eventName: string, args: any): void {
        if (Object.is(ctrlName, 'dataview')) {
            this.MDCtrlEvent(eventName, args);
        }
        super.onCtrlEvent(ctrlName, eventName, args);
    }

    /**
     * 获取多数据部件
     *
     * @returns {*}
     * @memberof DataViewEngine
     */
    public getMDCtrl(): any {
        return this.dataView;
    }

    /**
     * 删除操作
     *
     * @returns {void}
     * @memberof DataViewEngine
     */
    public doRemove(): void {
        let selectedData = this.getMDCtrl() && this.getMDCtrl().getSelection();
        if (!selectedData || selectedData == null || selectedData.length === 0) {
            return;
        }
        let dataInfo = '';
        selectedData.forEach((record: any, index: number) => {
            let srfmajortext = record.srfmajortext;
            if (index < 5) {
                if (!Object.is(dataInfo, '')) {
                    dataInfo += '、';
                }
                dataInfo += srfmajortext;
            } else {
                return false;
            }
        });
        if (selectedData.length < 5) {
            dataInfo = dataInfo + '共' + selectedData.length + '条数据';
        } else {
            dataInfo = dataInfo + '...' + '共' + selectedData.length + '条数据';
        }
        dataInfo = dataInfo
            .replace(/[null]/g, '')
            .replace(/[undefined]/g, '')
            .replace(/[ ]/g, '');
        // 询问框
        this.view.$Modal.confirm({
            title: '警告',
            content: '确认要删除 ' + dataInfo + '，删除操作将不可恢复？',
            onOk: () => {
                this.removeData(null);
            },
            onCancel: () => {},
        });
    }

    /**
     * 删除
     *
     * @param {*} [arg={}]
     * @returns {void}
     * @memberof DataViewEngine
     */
    public removeData(arg: any = {}): void {
        if (!arg) {
            arg = {};
        }
        if (!arg.srfkeys) {
            // 获取要删除的数据集合
            const selectedData: Array<any> = this.getMDCtrl() && this.getMDCtrl().getSelection();
            if (!selectedData || selectedData == null || selectedData.length === 0) {
                return;
            }

            let keys = '';
            selectedData.forEach((record) => {
                let key = record.srfkey;
                if (!Object.is(keys, '')) {
                    keys += ';';
                }
                keys += key;
            });
            arg.srfkeys = keys;
        }

        const grid: any = this.getMDCtrl();
        if (grid) {
            grid.remove(arg);
        }
    }
}
