package com.lxq.platform.goalManage.action;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

import org.apache.commons.beanutils.BeanUtils;

import com.lxq.platform.action.BaseAction;
import com.lxq.platform.exception.PrivilegeException;
import com.lxq.platform.goalManage.pojo.ApprovePostil;
import com.lxq.platform.goalManage.pojo.DateBatch;
import com.lxq.platform.goalManage.pojo.PerformanceGoal;
import com.lxq.platform.goalManage.service.intef.IGoalService;
import com.lxq.platform.systemManage.pojo.CodeLibrary;
import com.lxq.platform.userManage.pojo.Department;
import com.lxq.platform.userManage.pojo.TreeNode;
import com.lxq.platform.userManage.pojo.User;
import com.lxq.platform.util.DataConvert;
import com.lxq.platform.util.DateUtil;
import com.lxq.platform.util.ReflectUtil;
import com.lxq.platform.util.ServletUtil;
import com.opensymphony.xwork2.ActionContext;

@SuppressWarnings("serial")
public class GoalApplyAction extends BaseAction {
	
	/**目标服务类*/
	private IGoalService goalService;
	
	/**目标主键*/
	private String uid;
	
	/**目标意见主键*/
	private String opinionUid;
	
	/**申请类型*/
	private String applyType;
	
	/**目标类型*/
	private String goalType;
	
	/**提交动作*/
	private String action;
	
	/**是否申请加分*/
	private String isAddScore;
	
	/**加分理由*/
	private String addScoreReason;
	
	/**意见*/
	private String opinion;
	
	/**制定申请状态*/
	private String beginStatus;
	
	/**自评申请状态*/
	private String endStatus;
	
	/**完成状态*/
	private String finishStatus;

	/**期次主键*/
	private String dateBatchUid;
	
	/**
	 * 获取申请树
	 * @return
	 */
	public void getApplyNodes() {
		
		TreeNode[] treeNodes = new TreeNode[3];
		treeNodes[0] = new TreeNode();
		treeNodes[1] = new TreeNode();
		
		treeNodes[0].setId(goalType+"_item1");
		treeNodes[0].setText("目标制定");
		treeNodes[0].setCls("folder");
		treeNodes[0].setLeaf(false);
		treeNodes[0].setUrl("");
		
		treeNodes[1].setId(goalType+"_item3");
		treeNodes[1].setText("目标自评");
		treeNodes[1].setCls("folder");
		treeNodes[1].setLeaf(false);
		treeNodes[1].setUrl("");
		
		List<?> codeLibrarys0 = baseService.findBySql(null," select value,text" +
			" from basic_code_catalog,basic_code_library " +
			" where basic_code_catalog.uid = basic_code_library.codeCatalog" +
			" and getCodeNo(codeCatalog)='ApplyStatus1' " +
			" order by basic_code_library.uid");
		TreeNode[] childTreeNodes0 = new TreeNode[codeLibrarys0.size()];
		for(int i = 0 ; i < codeLibrarys0.size() ; i ++){
			Map<?,?> codeLibrary =  (Map<?,?>) codeLibrarys0.get(i);		
			
			int taskNum = baseService.getCount("select count(*) " +
				" from performance_goal " +
				" where ownerPerson = " +ServletUtil.getCurUser().getUid()+
				" and getItemValue(beginStatus) = '"+codeLibrary.get("value")+"'"+
				(!codeLibrary.get("value").equals("exprire")?" and getDateBatchStatus(dateBatch,'begin')= true":"")
			);
	
			childTreeNodes0[i] = new TreeNode();
			childTreeNodes0[i].setId("cycle_set-out_"+String.valueOf(codeLibrary.get("value")));
			childTreeNodes0[i].setText(codeLibrary.get("text")+"&nbsp;&nbsp;&nbsp;&nbsp;"+taskNum+"件");
			childTreeNodes0[i].setCls("file");
			childTreeNodes0[i].setLeaf(true);
			childTreeNodes0[i].setUrl("/apply/setupGoalApply.jsp");
			childTreeNodes0[i].setJsonObject("{beginStatus:\""+String.valueOf(codeLibrary.get("value"))+"\",goalType:\""+goalType+"\",applyType:\"cycle_setup\"}");
		}
		
		List<?> codeLibrarys1 = baseService.findBySql(null,"select value,text" +
				" from basic_code_catalog,basic_code_library " +
				" where basic_code_catalog.uid = basic_code_library.codeCatalog" +
				" and getCodeNo(codeCatalog)='ApplyStatus2' " +
				" order by basic_code_library.uid");
		TreeNode[] childTreeNodes1 = new TreeNode[codeLibrarys1.size()];
		for(int i = 0 ; i < codeLibrarys1.size() ; i ++){
			
			Map<?,?> codeLibrary =  (Map<?,?>) codeLibrarys1.get(i);
			
			int taskNum = baseService.getCount("select count(*) " +
				" from performance_goal " +
				" where ownerPerson = " +ServletUtil.getCurUser().getUid()+
				" and getItemValue(beginStatus)='pass'"+
				" and getItemValue(endStatus)='"+codeLibrary.get("value")+"'"+
				(!codeLibrary.get("value").equals("exprire")?" and getDateBatchStatus(dateBatch,'end') = true":"")
			);
			
			childTreeNodes1[i] = new TreeNode();
			
			childTreeNodes1[i].setId("self-eva_"+String.valueOf(codeLibrary.get("value")));
			childTreeNodes1[i].setText(codeLibrary.get("text")+"&nbsp;&nbsp;&nbsp;&nbsp;"+taskNum+"件");
			childTreeNodes1[i].setCls("file");
			childTreeNodes1[i].setLeaf(true);
			childTreeNodes1[i].setUrl("/apply/selfEvaGoalApply.jsp");
			childTreeNodes1[i].setJsonObject("{endStatus:\""+String.valueOf(codeLibrary.get("value"))+"\",goalType:\""+goalType+"\",applyType:\"selfEva\"}");
		}

		treeNodes[0].setChildren(childTreeNodes0);
		
		treeNodes[1].setChildren(childTreeNodes1);
		
		JSONArray jsonArray = JSONArray.fromObject(treeNodes);
		
		String str_json = jsonArray.toString();
		
		ServletUtil.responseText(str_json);
	}
	
	/**
	 * 保存json格式的实体对象
	 * @return
	 * @throws ClassNotFoundException 
	 * @throws PrivilegeException 
	 * @throws Exception 
	 * @throws IOException response获取输出流失败
	 */
	public void save() throws ClassNotFoundException, PrivilegeException {
		
		User curUser = ServletUtil.getCurUser();
		Department curDept = (Department)(ActionContext.getContext().getSession().get("curDept"));
		
		JSONObject jb = JSONObject.fromObject(jsonObject);
		
		PerformanceGoal goal = (PerformanceGoal) JSONObject.toBean(jb, Class.forName(entityName));

		goal.setCreateDept(curDept);
		goal.setCreatePerson(curUser);
		goal.setCreateTime(DateUtil.getNowTime("yyyy-MM-dd HH:mm:ss"));
		goal.setOwnerDept(curDept);
		goal.setOwnerPerson(curUser);
		goal.setFinishStatus((CodeLibrary) baseService.findUniqueBySql(CodeLibrary.class,
			"select * from basic_code_library where getCodeNo(codeCatalog)='FinishStatus' and value='no'"));
		
		// 保存对象
		baseService.add(goal,"json:"+jsonObject);
		
		String str_json = "{'success':true,'msg':'保存成功'}";
		
		ServletUtil.responseText(str_json);
	}
	
	/**
	 * 更新json格式的实体对象
	 * @return
	 * @throws ClassNotFoundException 
	 * @throws InvocationTargetException 
	 * @throws IllegalAccessException 
	 * @throws NoSuchMethodException 
	 * @throws SecurityException 
	 * @throws IllegalArgumentException 
	 * @throws PrivilegeException 
	 * @throws Exception 
	 * @throws IOException response获取输出流失败
	 */
	public void update() throws ClassNotFoundException, IllegalAccessException, InvocationTargetException, IllegalArgumentException, SecurityException, NoSuchMethodException, PrivilegeException {
		
		JSONObject jb = JSONObject.fromObject(jsonObject);
		
		PerformanceGoal entity = (PerformanceGoal) baseService.findByObject(Class.forName(entityName), jb);
		
		Iterator<?> keys = jb.keys();//获取json对象的keys
		
		StringBuffer message = new StringBuffer();
		
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setIgnoreDefaultExcludes(false);
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);  
		
		message.append(JSONObject.fromObject(entity,jsonConfig).toString()+"->"+jb.toString());
		
		CodeLibrary beginStatus = entity.getBeginStatus();
		CodeLibrary endStatus = entity.getEndStatus();
		
		String beginStatusValue = beginStatus == null ? "":beginStatus.getValue();
		String endStatusValue = endStatus == null ? "":endStatus.getValue();
		
		if(beginStatusValue.equals("submit") || beginStatusValue.equals("goback") || (endStatusValue.equals("submit") && beginStatusValue.equals("submit"))){
		
			while(keys.hasNext()){
				
				String key = (String)keys.next();//获取json对象属性名称
				
				Object value = jb.get(key);//获取json对象属性
				
				if(value.toString().startsWith("{")){//如果属性值是json对象格式，则解析成对象
					
					Class<?> fieldType = ReflectUtil.getPropertyType(Class.forName(entityName),key);
					value = JSONObject.toBean((JSONObject)value,fieldType);
					BeanUtils.setProperty(entity, key, value);
				}
				//替换属性
				BeanUtils.setProperty(entity, key, value);
			}
			// 更新对象
			baseService.update(entity,"json:{"+message+"}");
			
			ServletUtil.responseText("{'success':true,'msg':'保存成功'}");
			
		} else {
			ServletUtil.responseText("{'success':false,'msg':'已提交的目标不能更新'}");
		}
	}
	
	
	/**
	 * 删除签署的意见和目标记录
	 * @throws PrivilegeException 
	 * @throws ClassNotFoundException 
	 * @throws Exception 
	 */
	public void delete() throws PrivilegeException, ClassNotFoundException{
		
		JSONObject jb = JSONObject.fromObject(jsonObject);
		PerformanceGoal goal = (PerformanceGoal) baseService.findByObject(Class.forName(entityName), jb);
		
		CodeLibrary beginStatus = goal.getBeginStatus();
		
		String beginStatusValue = beginStatus == null ? "":beginStatus.getValue();

		User user = ServletUtil.getCurUser();
		
		List<?> approvePostils = (List<?>) baseService.findBySql(ApprovePostil.class,"select * from approve_postil where goal="+goal.getUid());
		
		if(goal.getCreatePerson().getUid() != user.getUid()){//创建人是当前用户
			
			ServletUtil.responseText("{'success':false,'msg':'上级分发的目标不能删除'}");
		}
		//待申请阶段的待提交、退回、否决的申请，或者没有批复则可以删除。
		else if(beginStatusValue.equals("submit") || beginStatusValue.equals("goback") || beginStatusValue.equals("reject") || approvePostils.size()<=0){
			
			for(int i = 0 ; i < approvePostils.size();i++){
				baseService.delete(approvePostils.get(i));
			}
			
			baseService.delete(goal);
			ServletUtil.responseText( "{'success':true,'msg':'提交成功'}");
			
		} else{
			ServletUtil.responseText(  "{'success':false,'msg':'已提交的目标不能删除'}");
		}
	}
	
	/**
	 * 撤销目标提交
	 * @throws Exception 
	 */
	public void undo() throws Exception{
		
		ServletUtil.responseText(goalService.undo(uid, applyType));
	}
	
	public void getOpinions(){
		
		List<?> objects = null;
			
		PerformanceGoal goal = (PerformanceGoal) baseService.findById(PerformanceGoal.class, Integer.parseInt(uid));
		
		objects = baseService.findBySql(null,
			" select approveTime,getDeptName(approveDept) as approveDept," +
			" getUserName(approvePerson) as approvePerson,getItemText(action) as action," +
			" postil as opinion,getItemText(finishStatus) as finishStatus,score " +
			" from approve_postil,performance_goal " +
			" where approve_postil.goal = performance_goal.uid " +
			" and goal = '"+uid+"' " +
			" and getItemValue(applyType) like '%"+applyType+"%' " +
			" and approveTime is not null "+
			" order by approveTime");
		
		JSONArray topics = new JSONArray();

		for(int i = 0 ; i < objects.size() ; i++){
			Map<?,?> object = (Map<?,?>) objects.get(i);
			
			JSONObject topic = new JSONObject();
			
			topic.put("approveTime", DataConvert.toString(object.get("approveTime")));
			topic.put("approveDept", DataConvert.toString(object.get("approveDept")));
			topic.put("approvePerson", DataConvert.toString(object.get("approvePerson")));
			topic.put("action", DataConvert.toString(object.get("action")));
			topic.put("opinion", DataConvert.toString(object.get("opinion")));
			topic.put("finishStatus", DataConvert.toString(object.get("finishStatus")));
			topic.put("score", DataConvert.toString(object.get("score")));
			
			if(goal.getOwnerPerson().getUserName().equals(DataConvert.toString(object.get("approvePerson")))){
				topic.put("phaseName", "first");
			} else if(goal.getFinalApprover().getUserName().equals(DataConvert.toString(object.get("approvePerson")))){
				topic.put("phaseName", "last");
			} else{
				topic.put("phaseName", "middle");
			}
			
			topics.add(topic);
		}
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("success", true);
		jsonObject.put("info",topics );
		
		String str_json = jsonObject.toString();
		ServletUtil.responseText(str_json);
		
	}
	
	/**
	 * 保存并提交
	 * @throws Exception
	 */
	public void signOpinion() throws Exception{
		
		// 获取批量提交的目标主键
		JSONArray json_uids = JSONArray.fromObject(uid);
		
		Iterator<?> it = json_uids.iterator();
		
		while(it.hasNext()){
			int uid = (Integer)it.next();
			PerformanceGoal goal = ((PerformanceGoal)baseService.findById(PerformanceGoal.class, uid));
			
			ApprovePostil approvePostil = null;
			
			if(opinionUid != null && opinionUid.length()>0 ){//查找当前阶段意见
				approvePostil = (ApprovePostil) baseService.findById(ApprovePostil.class, Integer.parseInt(opinionUid));
			}
			
			Map<String, Object> session = ActionContext.getContext().getSession();
			Department curDept = (Department) session.get("curDept");
			User curUser = (User) session.get("curUser");
			
			if(approvePostil == null){//如果当前阶段意见不存在，则新增意见
				
				approvePostil = new ApprovePostil();
				
				approvePostil.setAction(((CodeLibrary)baseService.findUniqueBySql(CodeLibrary.class,
					"select * from basic_code_library where value='"+action+"' and getCodeNo(codeCatalog)='Action'")));
				approvePostil.setApplyType(((CodeLibrary)baseService.findUniqueBySql(CodeLibrary.class,
					"select * from basic_code_library where value='"+applyType+"' and getCodeNo(codeCatalog)='ApplyType'")));
				approvePostil.setApproveDept(curDept);
				approvePostil.setApprovePerson(curUser);
				approvePostil.setApproveTime(DateUtil.getNowTime("yyyy-MM-dd HH:mm:ss"));
				approvePostil.setGoal(goal);
				approvePostil.setPostil(opinion);
				approvePostil.setScore(0);
				approvePostil.setPhaseNo(1);
				
			} else{
				
				approvePostil.setAction(((CodeLibrary)baseService.findUniqueBySql(CodeLibrary.class,
					"select * from basic_code_library where value='"+action+"' and getCodeNo(codeCatalog)='Action'")));
				approvePostil.setApproveTime(DateUtil.getNowTime("yyyy-MM-dd HH:mm:ss"));
				approvePostil.setPostil(opinion);
				approvePostil.setScore(0);
			}
			
			goalService.signApplyOpinion(goal,approvePostil,curDept,curUser,applyType);
		}
		
		ServletUtil.responseText( "{'success':true,'msg':'提交成功'}");
	}
	
	/**
	 * 保存并提交
	 * @throws Exception
	 */
	public void signSelfEvaOpinion() throws Exception{
		
		JSONArray json_uids = JSONArray.fromObject(uid);
		
		Iterator<?> it = json_uids.iterator();
		
		while(it.hasNext()){
			int uid = (Integer)it.next();
			PerformanceGoal goal = ((PerformanceGoal)baseService.findById(PerformanceGoal.class, uid));
			
			goal.setFinishStatus(((CodeLibrary)baseService.findUniqueBySql(CodeLibrary.class,
				"select * from basic_code_library where value='"+finishStatus+"' and getCodeNo(codeCatalog)='FinishStatus'")));
			goal.setIsAddScore(((CodeLibrary)baseService.findUniqueBySql(CodeLibrary.class,
				"select * from basic_code_library where value='"+(isAddScore == null?"false":isAddScore)+"' and getCodeNo(codeCatalog)='YesOrNo'")));
			goal.setAddScoreReason(addScoreReason);
			
			if(dateBatchUid != null && dateBatchUid.length()>0){
				goal.setDateBatch((DateBatch) baseService.findById(DateBatch.class, Integer.parseInt(dateBatchUid)));
			}
			
			ApprovePostil approvePostil = null;
			
			if(opinionUid != null && opinionUid.length()>0 ){//查找当前阶段意见
				approvePostil = (ApprovePostil) baseService.findById(ApprovePostil.class, Integer.parseInt(opinionUid));
			}
			
			Map<String, Object> session = ActionContext.getContext().getSession();
			Department curDept = (Department) session.get("curDept");
			User curUser = (User) session.get("curUser");
			
			if(approvePostil == null){//如果当前阶段意见不存在，则新增意见
				
				approvePostil = new ApprovePostil();
				
				approvePostil.setAction(((CodeLibrary)baseService.findUniqueBySql(CodeLibrary.class,
					"select * from basic_code_library where value='"+action+"' and getCodeNo(codeCatalog)='Action'")));
				approvePostil.setApplyType(((CodeLibrary)baseService.findUniqueBySql(CodeLibrary.class,
					"select * from basic_code_library where value='"+applyType+"' and getCodeNo(codeCatalog)='ApplyType'")));
				approvePostil.setApproveDept(curDept);
				approvePostil.setApprovePerson(curUser);
				approvePostil.setApproveTime(DateUtil.getNowTime("yyyy-MM-dd HH:mm:ss"));
				approvePostil.setGoal(goal);
				approvePostil.setPostil(opinion);
				approvePostil.setPhaseNo(1);
				
			} else{
				
				approvePostil.setAction(((CodeLibrary)baseService.findUniqueBySql(CodeLibrary.class,
					"select * from basic_code_library where value='"+action+"' and getCodeNo(codeCatalog)='Action'")));
				approvePostil.setApproveTime(DateUtil.getNowTime("yyyy-MM-dd HH:mm:ss"));
				approvePostil.setPostil(opinion);
			}
			
			goalService.signApplyOpinion(goal,approvePostil,curDept,curUser,applyType);
		}
		
		ServletUtil.responseText( "{'success':true,'msg':'提交成功'}");
	}
	
	public void findOpinion(){
		
		Map<String, Object> session = ActionContext.getContext().getSession();
		User curUser = (User) session.get("curUser");

		String roleUids = curUser.getAllRoleUidToString();
		
		PerformanceGoal goal = (PerformanceGoal) baseService.findById(PerformanceGoal.class, Integer.parseInt(uid));
		
		ApprovePostil approvePostil = (ApprovePostil) baseService.findUniqueBySql(ApprovePostil.class,
			" select * from approve_postil,performance_goal " +
			" where  " +
			" approve_postil.goal = performance_goal.uid"+
			" and goal = "+uid +//当前目标
			" and getItemValue(applyType) like '%"+applyType+"%'" +//申请类型
			(curUser.hasRole("100") && curUser.hasRole("101")?" and ( getRoleId(approveRole) = '100' or getDeptDirectLeader(performance_goal.ownerDept) = "+curUser.getUid()+")":"")+
			(!curUser.hasRole("100") && curUser.hasRole("101")?" and getDeptDirectLeader(performance_goal.ownerDept) = "+curUser.getUid():"")+
			(!curUser.hasRole("101")?" and approveRole in ("+roleUids+")":"")+
			" and approveRole in ("+roleUids+")" +
			" and approveTime is null"//申请时间是null
		);
			
		JSONObject info = new JSONObject();
		info.put("content", goal.getContent());
		if(approvePostil != null){
			info.put("opinionUid", approvePostil.getUid());
			info.put("finishStatus", goal.getFinishStatus().getValue());
			info.put("finishStatusName", goal.getFinishStatus().getText());
			info.put("action", approvePostil.getAction().getValue());
			info.put("isAddScore", goal.getIsAddScore() == null?"false":goal.getIsAddScore().getValue());
			info.put("addScoreReason", goal.getAddScoreReason());
			info.put("evaluation","satisfy");
			info.put("opinion", "同意");
		}else{
			info.put("finishStatus", "yes");
			info.put("action", "agree");
			info.put("isAddScore", "false");
			info.put("evaluation","satisfy");
		}
		
		JSONArray jsonArray = new JSONArray();
		jsonArray.add(info);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("success", true);
		jsonObject.put("info",jsonArray );
		
		String str_json = jsonObject.toString();
		
		ServletUtil.responseText(str_json);
		
	}
	
	/**
	 * 复制目标
	 * @throws Exception 
	 */
	public void copyGoal() throws Exception {
		JSONObject jb = JSONObject.fromObject(jsonObject);
		int uid = (Integer)jb.get("uid");
		
		Department curDept = (Department)(ActionContext.getContext().getSession().get("curDept"));
		User curUser = ServletUtil.getCurUser();
		
		PerformanceGoal performGoal = (PerformanceGoal) baseService.findById(PerformanceGoal.class, uid);
		
		PerformanceGoal newPerformGoal = new PerformanceGoal();
		
		newPerformGoal.setBeginStatus((CodeLibrary) baseService.findUniqueBySql(CodeLibrary.class,
			"select * from basic_code_library where getCodeNo(codeCatalog)='ApplyStatus1' and value='submit'"));
		newPerformGoal.setContent(performGoal.getContent());
		newPerformGoal.setCreateDept(curDept);
		newPerformGoal.setCreatePerson(curUser);
		newPerformGoal.setIsMajor(performGoal.getIsMajor());
		newPerformGoal.setCreateTime(DateUtil.getNowTime("yyyy-MM-dd HH:mm:ss"));
		newPerformGoal.setDateBatch((DateBatch)baseService.findUniqueBySql(DateBatch.class,
			"select * from date_batch where batchType='"+performGoal.getDateBatch().getBatchType()+"' and beginStatus=true"));
		newPerformGoal.setFinalApprover(performGoal.getFinalApprover());
		newPerformGoal.setFinishStatus((CodeLibrary) baseService.findUniqueBySql(CodeLibrary.class,
			"select * from basic_code_library where getCodeNo(codeCatalog)='FinishStatus' and value='no'"));
		newPerformGoal.setGoalType(performGoal.getGoalType());
		newPerformGoal.setOwnerDept(curDept);
		newPerformGoal.setOwnerPerson(curUser);
		
		baseService.add(newPerformGoal,"json:");

		String str_json = "{'success':true,'msg':'目标复制成功'}";
		ServletUtil.responseText(str_json);
	}
	
	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getGoalType() {
		return goalType;
	}

	public void setGoalType(String goalType) {
		this.goalType = goalType;
	}

	public String getApplyType() {
		return applyType;
	}

	public void setApplyType(String applyType) {
		this.applyType = applyType;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public String getOpinion() {
		return opinion;
	}

	public void setOpinion(String opinion) {
		this.opinion = opinion;
	}

	public String getOpinionUid() {
		return opinionUid;
	}

	public void setOpinionUid(String opinionUid) {
		this.opinionUid = opinionUid;
	}

	public String getBeginStatus() {
		return beginStatus;
	}

	public void setBeginStatus(String beginStatus) {
		this.beginStatus = beginStatus;
	}

	public String getEndStatus() {
		return endStatus;
	}

	public void setEndStatus(String endStatus) {
		this.endStatus = endStatus;
	}

	public IGoalService getGoalService() {
		return goalService;
	}

	public void setGoalService(IGoalService goalService) {
		this.goalService = goalService;
	}

	public String getFinishStatus() {
		return finishStatus;
	}

	public void setFinishStatus(String finishStatus) {
		this.finishStatus = finishStatus;
	}

	public String getDateBatchUid() {
		return dateBatchUid;
	}

	public void setDateBatchUid(String dateBatchUid) {
		this.dateBatchUid = dateBatchUid;
	}

	public String getIsAddScore() {
		return isAddScore;
	}

	public void setIsAddScore(String isAddScore) {
		this.isAddScore = isAddScore;
	}

	public String getAddScoreReason() {
		return addScoreReason;
	}

	public void setAddScoreReason(String addScoreReason) {
		this.addScoreReason = addScoreReason;
	}
}
