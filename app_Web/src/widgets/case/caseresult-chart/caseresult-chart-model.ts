/**
 * Caseresult 部件模型
 *
 * @export
 * @class CaseresultModel
 */
export default class CaseresultModel {

	/**
	 * 获取数据项集合
	 *
	 * @returns {any[]}
	 * @memberof CaseresultDashboard_sysportlet1_chartMode
	 */
	public getDataItems(): any[] {
		return [
			{
			name:'size',
			prop:'size'
			},
			{
			name:'query',
			prop:'query'
			},
			{
			name:'page',
			prop:'page'
			},
			{
			name:'sort',
			prop:'sort'
			}
		]
	}

}