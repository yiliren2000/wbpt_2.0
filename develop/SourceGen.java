import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.lxq.platform.annotation.Describe;

public class SourceGen {

	public static void main(String[] args) throws Exception {

		List<String> classNames = new ArrayList<String>();
		classNames.add("com.lxq.platform.workflow.pojo.FlowNode");
		classNames.add("com.lxq.platform.workflow.pojo.FlowRecord");

		List<Class> classes = init(classNames);

		genTable(classes);
		genJspFile(classes);
		genMapperFile(classes);
		genMybatisFile(classes);

	}

	public static List<Class> init(List<String> classNames)
			throws ClassNotFoundException {

		List<Class> classes = new ArrayList<Class>();;

		for (String className : classNames) {
			classes.add( Class.forName(className));
		}
		return classes;
	}

	public static void genTable(List<Class> classes) throws ClassNotFoundException, IOException {

		String template = readTemplateFile("template/template.sql");
		
		for(Class c : classes){
			
			String name = ((Describe)c.getAnnotation(Describe.class)).describe();

			String tableComment = ((Describe)c.getAnnotation(Describe.class)).describe();
			
			Field[] fields = c.getDeclaredFields();

			String tableName = c.getName().substring(
					c.getName().lastIndexOf(".") + 1);
			tableName = tableName.toLowerCase();

			StringBuffer sb = new StringBuffer();

			for (Field field : fields) {

				if (!field.getType().getName().contains("Set")) {

					sb.append(field.getName() + " ");
					sb.append(convertType(field.getType().getName()));
					if (field.getName().equals("uid")) {
						sb.append(" not null auto_increment");
					}
					sb.append(" comment '"+((Describe)field.getAnnotation(Describe.class)).describe()+"'");
					sb.append(",\n");
				}
			}
			System.out.println(template.replace("${tableName}", tableName).replace("${fileds}", sb).replace("${tableComment}", tableComment));
		}
	}

	public static void genMapperFile(List<Class> classes) throws IOException {
		
		String template = readTemplateFile("template/template.xml");
		
		int position = template.indexOf("</mapper>");
		
		for(Class c:classes){
			
			String head = template.substring(0,position);
			String tail = template.substring(position);
			String name = ((Describe)c.getAnnotation(Describe.class)).describe();
			
			Field[] fields = c.getDeclaredFields();
			
			String shortName = c.getName().substring(
					c.getName().lastIndexOf(".") + 1).toLowerCase();
			
			PrintWriter pw = new PrintWriter(new OutputStreamWriter(new FileOutputStream("./src/"+c.getName().replace(".", "/")+"Mapper.xml"),"UTF-8"));
			
			StringBuffer sb1 = new StringBuffer();
			StringBuffer sb2 = new StringBuffer();
			StringBuffer sb3 = new StringBuffer();
			
			String resultMap_head = "	<resultMap type=\""+c.getName()+"\" id=\""+shortName+"Result\">\n		<id column=\"uid\" property=\"uid\"/>";
			String resultMap_tail = "\n	</resultMap>\n\n";
			
			for (Field field : fields) {
				
				if (!field.getType().getName().contains("Set")) {
					if (field.getType().getName().equals("int") || field.getType().getName().equals("java.lang.String")) {
						sb1.append(",#{"+field.getName()+"}");
						sb2.append(", "+field.getName()+"=#{"+field.getName()+"}");
					} else{
						
						sb1.append(",#{"+field.getName()+".uid}");
						sb2.append(", "+field.getName()+"=#{"+field.getName()+".uid}");
						
						sb3.append("\n		<association property=\""+field.getName()+"\" column=\""+field.getName()+"\" select=\""+field.getType().getName()+"Mapper.findById\" />");
					
					}
					
				}
			}
			
			head = head.replace("${className}",c.getName()).replace("${shortName}", shortName).
					replace("${fields1}", sb1.substring(1)).
					replace("${fields2}", sb2.substring(1));
			
			if(sb3.indexOf("association")>-1){
				head = head.replace("resultType=\""+c.getName()+"\"", "resultMap=\""+shortName+"Result\"");
				
				head = head + resultMap_head + sb3 + resultMap_tail;
			}
			
			pw.write(head+tail);
			pw.close();
		}
	}

	public static void genJspFile(List<Class> classes) throws IOException {

		String template = readTemplateFile("template/template.jsp");
		
		for(Class c:classes){
			
			String content = new String(template);
			
			String name = ((Describe)c.getAnnotation(Describe.class)).describe();

			Field[] fields = c.getDeclaredFields();

			String shortName = c.getName().substring(
					c.getName().lastIndexOf(".") + 1);
			shortName = shortName.toLowerCase();

			PrintWriter pw = new PrintWriter(new OutputStreamWriter(new FileOutputStream(shortName+".jsp"),"UTF-8"));

			StringBuffer sb1 = new StringBuffer();
			StringBuffer sb2 = new StringBuffer();

			for (Field field : fields) {

				if (!field.getType().getName().contains("Set") && !field.getName().equals("uid")) {
					
					sb1.append(", {\n");
					sb1.append("			type : 'textfield',\n");
					sb1.append("			name : '"+field.getName()+"',\n");
					sb1.append("			field : '"+field.getName()+"',\n");
					sb1.append("			header : '"+((Describe)field.getAnnotation(Describe.class)).describe()+"',\n");
					sb1.append("			sortable : true,\n");
					sb1.append("			searchable : true\n");
					sb1.append("		} ");
						
					sb2.append(", {\n");
					sb2.append("				columnWidth : 1.0,\n");
					sb2.append("				layout : 'form',\n");
					sb2.append("				items : [ {\n");
					sb2.append("					xtype : 'textfield',\n");
					sb2.append("					fieldLabel : '"+((Describe)field.getAnnotation(Describe.class)).describe()+"',\n");
					sb2.append("					name : '"+field.getName()+"',\n");
					sb2.append("					field : '"+field.getName()+"',\n");
					if (!field.getType().getName().equals("java.lang.String") && !field.getType().getName().equals("int")) {
						sb2.append("					objectName : '"+field.getName()+".uid',\n");
					}
					sb2.append("					allowBlank : true\n");
					sb2.append("				} ]\n");
					sb2.append("			}");
					
				}
			}
			content = content.replace("${className}",c.getName()).replace("${title}", name).
					replace("${shortName}", shortName).
					replace("${gridFields}", sb1).
					replace("${formFields}", sb2);
			
			pw.write(content);
			pw.close();
		}
	}
	
	public static void genMybatisFile(List<Class> classes) throws IOException {
		
		String templateFile = "WebRoot/WEB-INF/conf/mybatis-config.xml";
		String template = readTemplateFile(templateFile);
		
		int position = template.indexOf("</mappers>");
		
		String head = template.substring(0,position);
		String tail = template.substring(position);
		
		StringBuffer buffer = new StringBuffer(head);
		PrintWriter pw = new PrintWriter(new OutputStreamWriter(new FileOutputStream(templateFile),"UTF-8"));
		
		for(Class c:classes){
			
			if(buffer.indexOf("<mapper resource=\""+c.getName().replace(".", "/")+"Mapper.xml\"/>")<0){
				buffer.append("         <mapper resource=\""+c.getName().replace(".", "/")+"Mapper.xml\"/>\n");
			}
		}
		buffer.append("	"+tail);
		pw.write(buffer.toString());
		pw.close();
	}
	

	public static String convertType(String classType) {
		if (classType.equals("java.lang.String")) {
			return "varchar(30)";
		} else if (classType.equals("boolean")) {
			return "bit(1)";
		} else {
			return "int(11)";
		}
	}
	
	public static String readTemplateFile(String templateFile) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(templateFile)));
		StringBuffer content = new StringBuffer();
		String str = null;
		while((str=br.readLine())!=null){
			content.append(str+"\n");
		}
		br.close();
		
		return content.toString();
	}
	
	
}