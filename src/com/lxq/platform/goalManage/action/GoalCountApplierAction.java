package com.lxq.platform.goalManage.action;

import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.lxq.platform.action.BaseAction;
import com.lxq.platform.userManage.pojo.Department;
import com.lxq.platform.util.DataConvert;
import com.lxq.platform.util.ServletUtil;
import com.opensymphony.xwork2.ActionContext;

@SuppressWarnings("serial")
public class GoalCountApplierAction extends BaseAction {
	
	/**申请类型*/
	private String applyType;

	/**目标类型*/
	private String goalType;
	
	/**审批状态*/
	private String finishStatus;
	
	  /**
     * 获取json格式的分页数据
     * @return json格式的分页数据。
     *     例：{callback:"callback1001",totalCount:2,topics:[{"admin","系统管理员"},{"test","测试用户"}]}
     */
	public void jsonPage() {
		if(queryClause == null || queryClause.equals("")){
			queryClause = "1=1";
		}

		Map<String, Object> session = ActionContext.getContext().getSession();
		Department curDept = (Department) session.get("curDept");

		String tmep_Sql = 
			" from performance_goal" +
			//查询条件
			" where "+queryClause+
			//是期次初或者期次末状态
			" and (getDateBatchStatus(dateBatch,'begin')=true or getDateBatchStatus(dateBatch,'end')=true)"+
			//父机构，或所属机构是当前机构
			" and (getParentDept(ownerDept) = "+curDept.getUid()+" or ownerDept= "+curDept.getUid()+")"+
			//目标类型
			" and getItemValue(goalType) = '"+goalType+"'"+
			//审批通过阶段
			(applyType.contains("setup")?" and getItemValue(beginStatus)='pass'":" and getItemValue(endStatus)='pass'");

		String Sql = tmep_Sql +
			" group by dateBatch,ownerPerson ";//按期次和执行人分组
		
		List<?> objects = baseService.findBySql(null,
			" select dateBatch as dateBatchUid," +
			" getDateBatch(dateBatch) as dateBatch,"+
			" getUserBelongDept(ownerPerson) as ownerDeptUid," +
			" getDeptName(getUserBelongDept(ownerPerson)) as ownerDeptName," +
			" ownerPerson as ownerPersonUid," +
			" getUserName(ownerPerson) as ownerPersonName" +
			Sql+
			" order by "+sort+" "+dir, start, limit);

		int totalCount = objects.size();
		
		JSONArray topics = new JSONArray();

		for(int i = 0 ; i < objects.size() ; i++){
			Map<?,?> object = (Map<?,?>) objects.get(i);
			
			JSONObject topic = new JSONObject();
			
			topic.put("dateBatchUid", DataConvert.toString(object.get("dateBatchUid")));
			topic.put("dateBatch", DataConvert.toString(object.get("dateBatch")));
			topic.put("ownerDeptUid", DataConvert.toString(object.get("ownerDeptUid")));
			topic.put("ownerDeptName", DataConvert.toString(object.get("ownerDeptName")));
			topic.put("ownerPersonUid", DataConvert.toString(object.get("ownerPersonUid")));
			topic.put("ownerPersonName", DataConvert.toString(object.get("ownerPersonName")));
			
			String goalCountSql = 
				"select count(*) "+ tmep_Sql + 
				" and dateBatch ="+DataConvert.toString(object.get("dateBatchUid"))+
				" and ownerPerson="+DataConvert.toString(object.get("ownerPersonUid"));

			String majorGoalCountSql = 
				"select count(*) "+ tmep_Sql + 
				" and dateBatch ="+DataConvert.toString(object.get("dateBatchUid"))+
				" and ownerPerson="+DataConvert.toString(object.get("ownerPersonUid"))+
				" and getItemValue(isMajor) = 'true'" ;

			topic.put("goalCount", baseService.getCount(goalCountSql));
			topic.put("majorGoalCount", baseService.getCount(majorGoalCountSql));
			
			topics.add(topic);
			
		}
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("totalCount", totalCount);
		jsonObject.put("topics", topics);
		
		String str_json = jsonObject.toString();
		
		ServletUtil.responseText(str_json);
		
	}

	public String getApplyType() {
		return applyType;
	}

	public void setApplyType(String applyType) {
		this.applyType = applyType;
	}

	public String getGoalType() {
		return goalType;
	}

	public void setGoalType(String goalType) {
		this.goalType = goalType;
	}

	public String getFinishStatus() {
		return finishStatus;
	}

	public void setFinishStatus(String finishStatus) {
		this.finishStatus = finishStatus;
	}

}
