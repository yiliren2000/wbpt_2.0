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
public class Report1Action extends BaseAction {
	
	public void jsonPage() {
		
		Map<String, Object> session = ActionContext.getContext().getSession();
		Department curDept = (Department) session.get("curDept");
		List<?> orgs = null;
		String dateBatch = null;
		int dateBatchUid = 0;
		Map<String , Object> records = new HashMap<String,Object>();
		
		List<Object> resultSet = new ArrayList<Object>();
		
		if(queryClause == null || queryClause.equals("")){
			queryClause = "1=2";
			orgs = baseService.findBySql(Department.class," select * from basic_department where 1=2");
		}else{
			records.put("resultSet", resultSet);
			session.put("report", records);
			session.put("reportNo", "report1");
			JSONObject o_queryClause = JSONObject.fromObject(queryClause);
			dateBatch = o_queryClause.get("dateBatch").toString();
			dateBatchUid = (Integer)baseService.findUniqueBySql(DateBatch.class,"select uid from date_batch where dateBatch='"+dateBatch+"'");
			
			int parentDeptUid = 0;
			if(ServletUtil.getCurUser().hasRole("102")){
				parentDeptUid = (Integer)baseService.findUniqueBySql(Department.class," select uid from basic_department where level.value='1'");
			}else{
				parentDeptUid = curDept.getUid();
			}
			
			orgs = baseService.findBySql(Department.class," select * from basic_department where parentDept.uid=" + parentDeptUid + " order by deptId");
			records.put("dateBatch",dateBatch);
		}
		
		String [] org = null;
		
		JSONArray topics = new JSONArray();

		int sum_totalCount = 0;
		int sum_finishCount = 0;
		int sum_non_finishCoun = 0;
		double sum_totalScore = 0.00;
		for( int i = 0 ; i < orgs.size() ; i ++){

			Department dept = (Department)orgs.get(i);
			String deptName = dept.getDeptName();
			
			String whereClause = " beginStatus.value='pass' and isMajor.value = 'true' and ownerDept.uid = "+dept.getUid()+" and dateBatch.uid="+dateBatchUid;
			int totalCount = baseService.getCount("select count(*) from performance_goal where "+whereClause);
			int finishCount = baseService.getCount("select count(*) from performance_goal where finishStatus.value='yes' and "+whereClause);
			int non_finishCount = baseService.getCount("select count(*) from performance_goal where finishStatus.value='no' and "+whereClause);
			Object o_totalScore = baseService.findUniqueBySql(PerformanceGoal.class,"select sum(finalScore) from performance_goal where "+whereClause);
			double totalScore = o_totalScore == null ? 0:Math.round((Double)o_totalScore*100)/100.00; 
			
			sum_totalCount = sum_totalCount + totalCount;
			sum_finishCount = sum_finishCount + finishCount;
			sum_non_finishCoun = sum_non_finishCoun + non_finishCount;
			sum_totalScore = sum_totalScore + totalScore;
			
			JSONObject topic = new JSONObject();
			
			topic.put("dateBatch", DataConvert.toString(dateBatch));
			topic.put("deptUid", DataConvert.toString(dept.getUid()));
			topic.put("deptName", DataConvert.toString(deptName));
			topic.put("totalCount", totalCount);
			topic.put("finishCount", finishCount);
			topic.put("non_finishCount", non_finishCount);
			topic.put("totalScore", totalScore);
			topics.add(topic);

			org = new String[5];
			org[0] = String.valueOf(deptName);
			org[1] = String.valueOf(totalCount);
			org[2] = String.valueOf(finishCount);
			org[3] = String.valueOf(non_finishCount);
			org[4] = String.valueOf(totalScore);
			
			resultSet.add(org);
		}
		String[] sum = new String[4];
		sum[0] = String.valueOf(sum_totalCount);
		sum[1] = String.valueOf(sum_finishCount);
		sum[2] = String.valueOf(sum_non_finishCoun);
		sum[3] = String.valueOf(sum_totalScore);
		records.put("sum", sum);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("totalCount", orgs.size());
		jsonObject.put("topics", topics);
		
		String str_json = jsonObject.toString();
		
		ServletUtil.responseText(str_json);
		
	}
	
	public void exportReport() throws IOException
	{
		
		InputStream is = new FileInputStream(Initialization.context.getRealPath("/")+"report/template/report1.xls");
		HSSFWorkbook wb = new HSSFWorkbook(is); 

		
		Map<String, Object> session = ActionContext.getContext().getSession();
		
		if(session.get("reportNo")!= null && session.get("reportNo").equals("report1")){
			
			Map<?, ?> records = (Map<?, ?>) session.get("report");
			
			String dateBatch = (String) records.get("dateBatch");
			List<?> resultSet = (List<?>) records.get("resultSet");
			
			String year = DateUtil.formatDate(dateBatch, "yyyy年M月","yyyy");
			String month = DateUtil.formatDate(dateBatch, "yyyy年M月","M");
			
			HSSFSheet sheet = wb.getSheetAt(0);//获取第一个工作簿
			
			//1、报表标题，设置期次
			HSSFCell cell_title = sheet.getRow(1).getCell(0);// 第2行,第1列
			cell_title.setCellValue(new HSSFRichTextString(cell_title.getRichStringCellValue().getString().replace("$year", year).replace("$month", month)));
			
			//2、设置制表日期和制表人
			HSSFRow row_bottom = sheet.getRow(23);// 第24行
			HSSFCell cell_table = row_bottom.getCell(0);// 第1列
			
			HSSFRow row_sum = sheet.getRow(21);
			String[] sum = (String[])records.get("sum");

			row_sum.getCell(1).setCellValue(Integer.parseInt(sum[0]));
			row_sum.getCell(2).setCellValue(Integer.parseInt(sum[1]));
			row_sum.getCell(3).setCellValue(Integer.parseInt(sum[2]));
			row_sum.getCell(4).setCellValue(Double.parseDouble(sum[3]));

			String table = cell_table.getRichStringCellValue().getString();
			table = table.replace("$tableDate", DateUtil.getToday("yyyy-M-d"));
			table = table.replace("$tableUser", ServletUtil.getCurUser().getUserName());
			
			cell_table.setCellValue(new HSSFRichTextString(table));
			
			//3、动态设置报表内容
			if(resultSet.size()> 10){
				for(int i = 0 ; i < resultSet.size() - 16 ; i ++){
					ExcelExport.insertRow(sheet,5);
				}
			}
			
			for(int i = 0 ; i < resultSet.size() ; i ++){
				String [] org = (String[])resultSet.get(i);
				
				HSSFRow row = sheet.getRow(i+5);
				
				row.getCell(0).setCellValue(new HSSFRichTextString(org[0]));
				row.getCell(1).setCellValue(Integer.parseInt(org[1]));
				row.getCell(2).setCellValue(Integer.parseInt(org[2]));
				row.getCell(3).setCellValue(Integer.parseInt(org[3]));
				row.getCell(4).setCellValue(Double.parseDouble(org[4]));
			}
		}
		
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("application/octet-stream;charset=UTF-8");
		
		response.reset(); //清空输出流
		
		String fileName = new String(("部门汇总表").getBytes(), "ISO-8859-1");
		response.setHeader("Content-disposition", "attachment; filename="+fileName+"_"+DateUtil.getToday("yyyyMMdd")+".xls");  
		
		OutputStream out = response.getOutputStream();
		wb.write(response.getOutputStream());
		out.flush();
		out.close();
	}
	
}
