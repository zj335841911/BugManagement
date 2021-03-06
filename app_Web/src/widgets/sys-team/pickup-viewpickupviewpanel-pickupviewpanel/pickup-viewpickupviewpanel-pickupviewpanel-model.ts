/**
 * PickupViewpickupviewpanel 部件模型
 *
 * @export
 * @class PickupViewpickupviewpanelModel
 */
export default class PickupViewpickupviewpanelModel {

  /**
    * 获取数据项集合
    *
    * @returns {any[]}
    * @memberof PickupViewpickupviewpanelModel
    */
  public getDataItems(): any[] {
    return [
      {
        name: 'systeam',
        prop: 'teamid',
      },
      {
        name: 'teamname',
      },
      {
        name: 'memo',
      },
      {
        name: 'domains',
      },
    ]
  }


}