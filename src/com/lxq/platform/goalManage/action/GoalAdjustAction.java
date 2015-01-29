package com.lxq.platform.goalManage.action;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Iterator;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

import org.apache.commons.beanutils.BeanUtils;

import com.lxq.platform.action.BaseAction;
import com.lxq.platform.exception.PrivilegeException;
import com.lxq.platform.util.ReflectUtil;
import com.lxq.platform.util.ServletUtil;

@SuppressWarnings("serial")
public class GoalAdjustAction extends BaseAction {
	
	
	/**
	 * 更新json格式的实体对象
	 * @return
	 * @throws ClassNotFoundException 
	 * @throws NoSuchMethodException 
	 * @throws InvocationTargetException 
	 * @throws IllegalAccessException 
	 * @throws SecurityException 
	 * @throws IllegalArgumentException 
	 * @throws PrivilegeException 
	 * @throws Exception 
	 * @throws IOException response获取输出流失败
	 */
	public void update() throws IllegalArgumentException, SecurityException, IllegalAccessException, InvocationTargetException, NoSuchMethodException, ClassNotFoundException, PrivilegeException {
		
		JSONObject jb = JSONObject.fromObject(jsonObject);
		
		jb.put("finalScore", jb.getInt("finalScore")+jb.getInt("adjustScore"));
		
		jb.put("addScoreReason", (jb.getString("addScoreReason")==null || jb.getString("addScoreReason").trim().equals("")?"":jb.getString("addScoreReason")+"<br/>调整得分原因：")+jb.getString("adjustReason"));
		
		Object entity = baseService.findByObject(Class.forName(entityName), jb);
		
		Iterator<?> keys = jb.keys();//获取json对象的keys
		
		StringBuffer message = new StringBuffer();
		
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setIgnoreDefaultExcludes(false);
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);  
		
		message.append(JSONObject.fromObject(entity,jsonConfig).toString()+"->"+jb.toString());
		
		while(keys.hasNext()){
			
			String key = (String)keys.next();//获取json对象属性名称
			
			if(key.equals("adjustReason") || key.equals("adjustScore")){
				continue;
			}
			
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
	
}
