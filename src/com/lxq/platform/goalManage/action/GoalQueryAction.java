package com.lxq.platform.goalManage.action;

import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.lxq.platform.action.BaseAction;
import com.lxq.platform.util.DataConvert;
import com.lxq.platform.util.ServletUtil;

@SuppressWarnings("serial")
public class GoalQueryAction extends BaseAction {
	
	/**目标类型 dept:机构目标,person:个人目标*/
	private String goalType;
	
	public void jsonPage() {

		List<Map<String,String>> header = getHeader(fields);
		String queryString = getQueryString(header);
		
		if(queryClause == null || queryClause.equals("")){
			queryClause = "1=2";
		}
		String Sql = " from performance_goal where "+queryClause+" " +
				" and goalType.value='"+goalType+"' and endStatus.value='pass'" +
				(!ServletUtil.getCurUser().hasRole("102")?" and (ownerDept.parentDept.uid = "+ServletUtil.getCurDept().getUid()+" or ownerDept.uid = "+ServletUtil.getCurDept().getUid()+")":" and (ownerDept.level.value='2')");
		int totalCount = baseService.getCount("select count(*)"+Sql);
		
		List<?> objects = baseService.findBySql(null,"select "+queryString+Sql+"order by "+sort+" "+dir, start, limit);
		JSONArray topics = new JSONArray();

		for(int i = 0 ; i < objects.size() ; i++){
			Object[] object = (Object[]) objects.get(i);
			
			JSONObject topic = new JSONObject();
			
			for(int j = 0 ; j < header.size() ; j ++){
				topic.put(header.get(j).get("name"), DataConvert.toString(object[j]));
			}
			
			topics.add(topic);
			
		}
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("totalCount", totalCount);
		jsonObject.put("topics", topics);
		
		String str_json = jsonObject.toString();
		
		ServletUtil.responseText(str_json);
		
	}

	public String getGoalType() {
		return goalType;
	}

	public void setGoalType(String goalType) {
		this.goalType = goalType;
	}
}
