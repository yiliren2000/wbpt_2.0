package com.lxq.platform.action;

import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.struts2.ServletActionContext;

import com.lxq.platform.exception.PrivilegeException;
import com.lxq.platform.service.intef.IBaseService;
import com.lxq.platform.userManage.service.intef.IUserService;
import com.lxq.platform.util.DataConvert;
import com.lxq.platform.util.DateUtil;
import com.lxq.platform.util.ExcelExport;
import com.lxq.platform.util.ReflectUtil;
import com.lxq.platform.util.ServletUtil;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class BaseAction extends ActionSupport{
	
    /**排序方式*/
    protected String dir;
    /**最大记录数*/
    protected int limit;
    /**排序字段*/
    protected String sort;
    /**记录开始索引位置*/
    protected int start;
    /**查询实体类名称*/
    protected String entityName ;
    /**grid 的sql 语句**/
    protected String gridSql ;
    /**form 的sql 语句**/
    protected String formSql ;
    /**实体对象的唯一标示属性*/
    protected String keyName ;
    /**查询列表头*/
    protected String fields ;
    /**表单加载数据时的查询条件*/
    protected String whereClause;
    /**查询框提交的查询条件*/
    protected String queryClause;
    /**导出文件名*/
    protected String fileName; 
    /**json格式的实体对象*/
    protected String jsonObject; 
    /**业务处理*/
    protected IBaseService baseService;
    /**用户处理类*/
    protected IUserService userService;
    /**树形菜单节点编号*/
    protected String nodeId;
	
    /**
     * 获取json格式的分页数据
     * @return json格式的分页数据。
     *     例：{callback:"callback1001",totalCount:2,topics:[{"admin","系统管理员"},{"test","测试用户"}]}
     */
	public void jsonPage() {

		List<Map<String,String>> header = getHeader(fields);
		String queryString = getQueryString(header);
		
		if(queryClause == null || queryClause.equals("")){
			queryClause = "1=1";
		}
		
		String querySql = null;
		String countSql = null;
		
		//组装sql语句中的,select部分,from部分
		if(gridSql.toLowerCase().contains("select")){
			countSql = "select count(*) " + gridSql.substring(gridSql.indexOf("from"));
			querySql = gridSql;
		} else{
			countSql = "select count(*) " + gridSql;
			querySql = "select "+ queryString + " "+gridSql;
		}
		
		//组装sql语句中的,where部分
		if(gridSql.toLowerCase().contains("where")){
			countSql = countSql + " and " +queryClause;
			querySql = querySql + " and " +queryClause;
		} else{
			countSql = countSql + " where "  +queryClause;
			querySql = querySql + " where "  +queryClause;
		}
		
		//组装sql语句中的order by部分
		querySql = querySql + " order by "+sort+" "+dir;
		
		int totalCount = baseService.getCount(countSql);
		
		List<?> objects = baseService.findBySql(null,querySql, start, limit);

		JSONArray topics = new JSONArray();

		for(int i = 0 ; i < objects.size() ; i++){
			Map<?, ?> object = (Map<?, ?>) objects.get(i);
			
			JSONObject topic = new JSONObject();
			
			for(int j = 0 ; j < header.size() ; j ++){
				topic.put(header.get(j).get("name"), object.get(header.get(j).get("name")));
			}
			
			topics.add(topic);
			
		}
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("totalCount", totalCount);
		jsonObject.put("topics", topics);
		
		String str_json = jsonObject.toString();
		
		ServletUtil.responseText(str_json);
		
	}

	
	/**
	 * 导出数据文件
	 * @return excel文件输出流
	 * @throws IOException reponse获取输出流
	 */
	public void export() throws IOException {
		
		List<Map<String,String>> header = getHeader(fields);
		String queryString = getQueryString(header);
		
 		List<?> objects = null;
		if(queryClause == null || queryClause.equals("")){
			queryClause = "1=1";
		}
		
		String querySql = null;
		
		//组装sql语句中的,select部分,from部分
		if(gridSql.toLowerCase().contains("select")){
			querySql = gridSql;
		} else{
			querySql = "select "+ queryString + " "+gridSql;
		}
		
		//组装sql语句中的,where部分
		if(gridSql.toLowerCase().contains("where")){
			querySql = querySql + " and " +queryClause;
		} else{
			querySql = querySql + " where "  +queryClause;
		}
		
		objects = baseService.findBySql(null,querySql);
		
		List<Map<String,String>> data = new ArrayList<Map<String,String>>();
		
		for(int i = 0 ; i < objects.size() ; i++){
			Map<?,?> object = (Map<?,?>) objects.get(i);
			Map<String,String> data_column = new HashMap<String,String>();
			
			for(int j = 0 ; j < header.size() ; j ++){

				data_column.put((String)header.get(j).get("name"), DataConvert.toString(object.get((String)header.get(j).get("name"))));
			}
			
			data.add(data_column);
			
		}

		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("application/octet-stream;charset=UTF-8");
		
		response.reset(); //清空输出流
		fileName = new String(fileName.getBytes(), "ISO-8859-1")+DateUtil.getToday("yyyyMMdd");
		response.setHeader("Content-disposition", "attachment; filename="+fileName+".xls");  
		
		OutputStream out = response.getOutputStream();
		ExcelExport.export(header,data,out);
		out.flush();
		out.close();
		
	}
	
	/**
	 * 删除json格式的实体对象
	 * 将json格式的字符串转化为实体对象，然后删除实体对象
	 * @throws ClassNotFoundException 
	 * @throws PrivilegeException 
	 * @throws Exception 
	 */
	public void delete() throws ClassNotFoundException, PrivilegeException {
		
		JSONObject jb = JSONObject.fromObject(jsonObject);
		
		Object object = JSONObject.toBean(jb, Class.forName(entityName));
		
		String str_json = null;
		//删除用户
		baseService.delete(object,"json:"+jsonObject);
		str_json = "{'success':true,'msg':'删除成功'}";
		ServletUtil.responseText(str_json);
	}
	
	/**
	 * 加载表单数据
	 * @return json格式数据。
	 *     例：{success:true,info:["userId":"admin","userName":"系统管理员"]}
	 * @throws ClassNotFoundException 
	 */
	public void find() throws ClassNotFoundException {
		
		List<Map<String,String>> header = getHeader(fields);
		String queryString = getQueryString(header);
		
		whereClause = getWhereClause(whereClause);
		
		String querySql = null;
		
		//组装sql语句中的,select部分,from部分
		if(formSql.toLowerCase().contains("select")){
			querySql = formSql;
		} else{
			querySql = "select "+ queryString + " "+formSql;
		}
		
		//组装sql语句中的,where部分
		if(formSql.toLowerCase().contains("where")){
			querySql = querySql + " and " +whereClause;
		} else{
			querySql = querySql + " where "  +whereClause;
		}
		
		Map<?, ?> object = (HashMap<?, ?>)baseService.findUniqueBySql(null,querySql);
		
		JSONObject info = new JSONObject();
		for(int i = 0 ; i < header.size() ; i ++){
			Map<String,String> field = header.get(i);
			
			String name = field.get("name");
			info.put(name, object.get(name));
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
	 * 保存json格式的实体对象
	 * @return
	 * @throws ClassNotFoundException 
	 * @throws PrivilegeException 
	 * @throws Exception 
	 * @throws IOException response获取输出流失败
	 */
	public void save() throws ClassNotFoundException, PrivilegeException  {
		JSONObject jb = JSONObject.fromObject(jsonObject);
		
		Object entity = JSONObject.toBean(jb, Class.forName(entityName));

		// 保存对象
		baseService.add(entity,"json:"+jsonObject);
		
		String str_json = "{'success':true,'msg':'保存成功'}";
		
		ServletUtil.responseText(str_json);
	}
	
	/**
	 * 更新json格式的实体对象
	 * @return
	 * @throws ClassNotFoundException 
	 * @throws NoSuchMethodException 
	 * @throws SecurityException 
	 * @throws InvocationTargetException 
	 * @throws IllegalAccessException 
	 * @throws PrivilegeException 
	 */
	public void update() throws ClassNotFoundException, SecurityException, NoSuchMethodException, IllegalAccessException, InvocationTargetException, PrivilegeException {
		
		JSONObject jb = JSONObject.fromObject(jsonObject);
		
		Object entity = baseService.findByObject(Class.forName(entityName), jb);
		
		Iterator<?> keys = jb.keys();//获取json对象的keys
		
		StringBuffer message = new StringBuffer();
		
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setIgnoreDefaultExcludes(false);
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);  
		
		message.append(JSONObject.fromObject(entity,jsonConfig).toString()+"->"+jb.toString());
		
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
		
		String str_json = "{'success':true,'msg':'保存成功'}";
		
		ServletUtil.responseText(str_json);
	}
	
	/**
	 * 获取json格式表头信息，供导出数据和加载表单数据时，使用
	 * @param fields json格式的属性集合
	 * @return 表头信息。
	 *     例：{{"name":"userId","field":"userId","header":"用户编号"},{"name":"userName","field":"userName","header":"用户名称"}}
	 */
	public List<Map<String,String>> getHeader(String fields){
		
		JSONArray headers_Array = JSONArray.fromObject(fields);
		
		List<Map<String,String>> title = new ArrayList<Map<String,String>>();
		
		for(int i = 0 ; i < headers_Array.size() ; i ++){
			Map<String,String> header_column = new HashMap<String,String>();
			
			JSONObject m =  (JSONObject) headers_Array.get(i);
			
			String name = m.optString("name");
			String field = m.optString("field");
			String header = m.optString("header");
			
			header_column.put("name", name);
			header_column.put("field", field);
			header_column.put("header", header);
			
			title.add(header_column);
		}
		return title;
	}
	
	/**
	 * 组装Sql查询条件
	 * @param header json格式的表头信息
	 * @return Sql查询条件。例："userId,userName"
	 */
	public String getQueryString(List<Map<String,String>> header){
		String queryString = "";
		
		for(int i = 0 ; i < header.size() ; i ++){
			Map<String,String> m =  header.get(i);
			
			queryString = queryString+","+m.get("field") + " as "+ m.get("name");
		}
		queryString = queryString.substring(1);	
		
		return queryString;
	}

	
	/**
	 * 
	 * @param json_whereClause Sql语句的where条件，例：{userId:'test',userName:'测试用户'}
	 * @return where条件，例："1=1 and userId='test' and userName='测试用户'"
	 */
	public String getWhereClause(String json_whereClause){
		String whereClause = "1=1";
		
		JSONObject o_whereClause = JSONObject.fromObject(json_whereClause);
		
		Iterator<?> it = o_whereClause.keys();
		while(it.hasNext()){
			String key = (String)it.next();
			String value = o_whereClause.getString(key);
			
			whereClause = whereClause + " and "+key+"="+value;
		}
		return whereClause;
	}
	
	
	
	public void setDir(String dir) {
		this.dir = dir;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public void setEntityName(String entityName) {
		this.entityName = entityName;
	}

	public void setFields(String fields) {
		this.fields = fields;
	}

	public void setWhereClause(String whereClause) {
		this.whereClause = whereClause;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public void setBaseService(IBaseService baseService) {
		this.baseService = baseService;
	}

	public void setJsonObject(String jsonObject) {
		this.jsonObject = jsonObject;
	}

	public void setKeyName(String keyName) {
		this.keyName = keyName;
	}

	public void setNodeId(String nodeId) {
		this.nodeId = nodeId;
	}

	public void setQueryClause(String queryClause) {
		this.queryClause = queryClause;
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

	public String getGridSql() {
		return gridSql;
	}


	public void setGridSql(String gridSql) {
		this.gridSql = gridSql;
	}


	public String getFormSql() {
		return formSql;
	}


	public void setFormSql(String formSql) {
		this.formSql = formSql;
	}


	public String getDir() {
		return dir;
	}


	public int getLimit() {
		return limit;
	}


	public String getSort() {
		return sort;
	}


	public int getStart() {
		return start;
	}


	public String getEntityName() {
		return entityName;
	}


	public String getKeyName() {
		return keyName;
	}


	public String getFields() {
		return fields;
	}


	public String getWhereClause() {
		return whereClause;
	}


	public String getQueryClause() {
		return queryClause;
	}


	public String getFileName() {
		return fileName;
	}


	public String getJsonObject() {
		return jsonObject;
	}


	public IBaseService getBaseService() {
		return baseService;
	}


	public IUserService getUserService() {
		return userService;
	}


	public String getNodeId() {
		return nodeId;
	}

}
