package com.lxq.platform.goalManage.action;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;

import com.lxq.platform.action.BaseAction;
import com.lxq.platform.goalManage.pojo.ApprovePostil;
import com.lxq.platform.goalManage.pojo.DateBatch;
import com.lxq.platform.goalManage.pojo.PerformanceGoal;
import com.lxq.platform.servlet.Initialization;
import com.lxq.platform.userManage.pojo.Department;
import com.lxq.platform.util.DataConvert;
import com.lxq.platform.util.DateUtil;
import com.lxq.platform.util.ExcelExport;
import com.lxq.platform.util.ServletUtil;
import com.opensymphony.xwork2.ActionContext;


@SuppressWarnings("serial")
public class Report3Action extends BaseAction {
	
	public void jsonPage() {
		
		Map<String, Object> session = ActionContext.getContext().getSession();
		String deptName = null;
		String dateBatch = null;
		int dateBatchUid = 0;
		String deptUid = null;
		Map<String , Object> records = new HashMap<String,Object>();
		List<Object> resultSet = new ArrayList<Object>();
		if(queryClause == null || queryClause.equals("")){
			queryClause = "1=2";
		}else{

			records.put("resultSet", resultSet);
			session.put("report", records);
			session.put("reportNo", "report3");
			
			JSONObject o_queryClause = JSONObject.fromObject(queryClause);
			
			dateBatch = o_queryClause.get("dateBatch").toString();
			dateBatchUid = (Integer)baseService.findUniqueBySql(DateBatch.class,"select uid from date_batch where dateBatch='"+dateBatch+"'");
			
			deptUid = o_queryClause.get("deptUid").toString();
			
			deptName = (String)baseService.findUniqueBySql(Department.class," select deptName from basic_department where uid="+deptUid);
			records.put("dateBatch",dateBatch);
			records.put("deptName",deptName);
		}
		
		JSONArray topics = new JSONArray();

		List<?> goals = baseService.findBySql(PerformanceGoal.class,"select * from performance_goal " +
				"where beginStatus.value='pass' " +
				"and isMajor.value = 'true' " +
				"and ownerDept.uid = "+deptUid+" " +
				"and dateBatch.uid="+dateBatchUid);
		double totalScore = 0;
		for( int i = 0 ; i < goals.size() ; i ++){

			PerformanceGoal goal = (PerformanceGoal)goals.get(i);
			totalScore = totalScore + goal.getFinalScore();
			JSONObject topic = new JSONObject();
			
			topic.put("dateBatch", dateBatch);//期次
			
			ApprovePostil approvePostil = (ApprovePostil) baseService.findUniqueBySql(ApprovePostil.class,"select * from approve_postil" +
					" where goal.uid="+goal.getUid()+"" +
					" and applyType.value like '%selfEva'" +
					" and approvePerson.uid="+goal.getOwnerPerson().getUid());
			
			topic.put("deptName", goal.getOwnerDept().getDeptName());//部门名称
			topic.put("content", goal.getContent());//目标内容
			topic.put("finishStatus", goal.getFinishStatus().getText());//完成情况
			topic.put("finalScore", goal.getFinalScore());//目标得分
			topic.put("isAddScore", goal.getIsAddScore().getText());//是否加分
			topic.put("addScoreReason", goal.getAddScoreReason());//加分理由
			topic.put("postil", approvePostil==null?"":approvePostil.getPostil());//未完成描述
			topic.put("remark", goal.getRemark());//备注
			topics.add(topic);

			resultSet.add(topic);
		}
		String[] sum = new String[1];
		sum[0] = String.valueOf(totalScore);
		records.put("sum", sum);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("totalCount", goals.size());
		jsonObject.put("topics", topics);
		
		String str_json = jsonObject.toString();
		
		ServletUtil.responseText(str_json);
		
	}
	
	public void exportReport() throws IOException
	{
		InputStream is = new FileInputStream(Initialization.context.getRealPath("/")+"report/template/report3.xls");
		HSSFWorkbook wb = new HSSFWorkbook(is); 

		Map<String, Object> session = ActionContext.getContext().getSession();

		String deptName = "";
		if(session.get("reportNo")!= null && session.get("reportNo").equals("report3")){
			Map<?, ?> records = (Map<?, ?>) session.get("report");
			List<?> resultSet = (List<?>) records.get("resultSet");
			
			String dateBatch = (String) records.get("dateBatch");
			deptName = (String) records.get("deptName");
			
			String year = DateUtil.formatDate(dateBatch, "yyyy年M月","yyyy");
			String month = DateUtil.formatDate(dateBatch, "yyyy年M月","M");
			
			HSSFSheet sheet = wb.getSheetAt(0);// 第1个工作表
			//1、报表标题，设置期次
			HSSFCell cell_title = sheet.getRow(1).getCell(0);// 第2行,第1列
			cell_title.setCellValue(new HSSFRichTextString(cell_title.getRichStringCellValue().getString().replace("$deptName", deptName).replace("$year", year).replace("$month", month)));
			
			//2、设置制表日期和制表人
			HSSFCell cell_bottom = sheet.getRow(17).getCell(0);
			cell_bottom.setCellValue(new HSSFRichTextString(cell_bottom.getRichStringCellValue().getString().replace("$tableDate", DateUtil.getToday("yyyy-M-d")).replace("$tableUser", ServletUtil.getCurUser().getUserName())));
			
			HSSFCell cell_sum = sheet.getRow(15).getCell(3);
			
			String[] sum = (String[])records.get("sum");
			
			cell_sum.setCellValue(Double.parseDouble(sum[0]));
			
			//3、动态设置报表内容
			
			if(resultSet.size()> 10){
				
				for(int i = 0 ; i < resultSet.size() - 10 ; i ++){
					ExcelExport.insertRow(sheet,5);
				}
			}
			
			int rowIndex = 5;
			for( int i = 0 ; i < resultSet.size() ; i ++){
				
				JSONObject record = (JSONObject)resultSet.get(i);
				
				HSSFRow row = sheet.getRow(rowIndex);
				
				row.getCell(0).setCellValue(rowIndex - 4);
				row.getCell(1).setCellValue(new HSSFRichTextString(DataConvert.toString(record.get("content"))));
				row.getCell(2).setCellValue(new HSSFRichTextString(DataConvert.toString(record.get("finishStatus"))));
				row.getCell(3).setCellValue((Double)record.get("finalScore"));
				row.getCell(4).setCellValue(new HSSFRichTextString(DataConvert.toString(record.get("addScoreReason"))));
				row.getCell(5).setCellValue(new HSSFRichTextString(DataConvert.toString(record.get("postil"))));
				row.getCell(6).setCellValue(new HSSFRichTextString(DataConvert.toString(record.get("remark"))));
				
				rowIndex ++;
			}
			
		}
		
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		
		response.reset(); //清空输出流
		
		String fileName = new String(("部门明细表-"+deptName).getBytes(), "ISO-8859-1");
		response.setHeader("Content-disposition", "attachment; filename="+fileName+"_"+DateUtil.getToday("yyyyMMdd")+".xls");  
		
		OutputStream out = response.getOutputStream();
		wb.write(response.getOutputStream());
		out.flush();
		out.close();
	}
}
