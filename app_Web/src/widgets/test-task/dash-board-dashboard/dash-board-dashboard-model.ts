/**
 * Dashboard 部件模型
 *
 * @export
 * @class DashboardModel
 */
export default class DashboardModel {

  /**
    * 获取数据项集合
    *
    * @returns {any[]}
    * @memberof DashboardModel
    */
  public getDataItems(): any[] {
    return [
      {
        name: 'end',
      },
      {
        name: 'begin',
      },
      {
        name: 'ownerpk',
      },
      {
        name: 'mailto',
      },
      {
        name: 'casecnt',
      },
      {
        name: 'mailtopk',
      },
      {
        name: 'pri',
      },
      {
        name: 'comment',
      },
      {
        name: 'substatus',
      },
      {
        name: 'report',
      },
      {
        name: 'desc',
      },
      {
        name: 'testtask',
        prop: 'id',
      },
      {
        name: 'status',
      },
      {
        name: 'mailtoconact',
      },
      {
        name: 'owner',
      },
      {
        name: 'deleted',
      },
      {
        name: 'auto',
      },
      {
        name: 'name',
      },
      {
        name: 'buildname',
      },
      {
        name: 'productname',
      },
      {
        name: 'projecttname',
      },
      {
        name: 'product',
      },
      {
        name: 'build',
      },
      {
        name: 'project',
      },
    ]
  }


}