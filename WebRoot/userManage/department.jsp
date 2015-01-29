<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp"%>

<c:set var="entityName" value="com.lxq.platform.userManage.pojo.Department"></c:set>

<html>
	<head>
		<script type="text/javascript">
		
			var params = {
			
			    /**树节点编号**/
				nodeId : '${ param.nodeId }',
				
			    /**panel渲染元素**/
				divId : '${pageId}',
				
			    /**项目名称**/
			    path: '${path}',

			    /**弹出窗口标题**/
			    title: "系统用户",
				
			    /**实体对象名称**/
			    entityName: '${entityName}',
				
			    /**action地址**/
			    actionUrl: "/baseAction",
				
			    /**每页显示的记录数**/
			    pageSize: 20,
	             
                /**grid 的sql from 语句**/
                gridSql: 'from basic_department where parentDept=${ param.nodeId }', 
                
                /**form 的sql from 语句**/
                formSql: 'from basic_department',
			    
			    /**排序字段**/
			    sort: 'deptId',
			    
				/**排序方式**/
		    	dir: 'asc',	

		    	/**grid高度*/
				gridHeight : Ext.get("center").getHeight()-Ext.get("south").getHeight()-40,

				/**导出文件的名称**/
				fileName: '机构列表',
				
				/**弹出窗口的宽度**/
				formWidth: 400,
				
				/**弹出窗口的高度**/
				formHeight: 250,
				
				/**弹出窗口的表单项的文字标签的对齐方式**/
				labelAlign: 'right',
				
				/**gird信息项**/
				gridFields: [{
		            name: 'uid',//必须有一个名称为“uid”的信息项,作为主键
		            type: 'textfield',
		            field: 'uid' ,
		            header: '主键',
		            searchable: false,
		            hidden : true
		        },{
		            name: 'deptId',
		            type: 'textfield',
		            field: 'deptId' ,
		            header: '机构编号',
		            sortable: true,
		            searchable: true
		        },{
		            name: 'deptName',
		            type: 'textfield',
		            field:'deptName' ,
		            header: '机构名称',
		            searchable: true
		        },{
		            name: 'level',
		            type: 'textfield',
		            field:'getItemText(level)' ,
		            header: '机构级别',
		            searchable: false
		        },{
		            type: 'textfield',
		            name: 'status',
		            field:'getItemText(status)' ,
		            header: '机构状态',
		            searchable: true,
		            hidden : false
		        },{
		            name: 'directLeader',
		            type: 'textfield',
		            field:'getUserName(directLeader)' ,
		            header: '直属领导',
		            searchable: false
		        }],
				
				/**form表单信息项**/
			    formFields: [{
			        xtype:'textfield',
			        fieldLabel: '主键',
			        name:'uid',
			        field: 'uid',
			        hidden: true,
			        readOnly : true,
			        hidden : true
			    },{
			        xtype:'textfield',
			        fieldLabel: '机构编号',
			        name:'deptId',
			        field: 'deptId'
			    },{
			        xtype:'textfield',
			        fieldLabel: '机构名称',
			        name:'deptName',
			        field: 'deptName'
			    },{
			        xtype:'combo',
			        fieldLabel: '机构级别',
			        name:'level',
			        objectName: 'level.uid',
			        field: 'level',
                    editable : false,
                    codeSql: "select basic_code_library.uid as uid,text from basic_code_catalog,basic_code_library where basic_code_catalog.uid=basic_code_library.codeCatalog and basic_code_catalog.codeNo='OrgLevel' and basic_code_library.value!='1'"
			    },{
			        xtype:'textfield',
			        fieldLabel: '上级机构',
			        name:'parentDept',
			        objectName: 'parentDept.uid',
			        field: 'parentDept',
			        value: '${ param.nodeId }',
			        hidden : true
			    },{
			        xtype:'combo',
                    fieldLabel: '机构状态',
			        name:'status',
			        objectName:'status.uid',
			        field:'status',
                    editable : false,
			        codeNo: 'Status'
			    }],
			    
				buttons:[
					{ name : 'add_button', visible : ${pt:hasRight(curUser,'add', entityName)}},
					{ name : 'query_button', visible : false},
					{ name : 'update_button', visible : ${pt:hasRight(curUser,'update', entityName)}},
					{ name : 'delete_button', visible : ${pt:hasRight(curUser,'delete', entityName)}},
					{ name : 'search_button', visible : false},
					{ name : 'extend_search_button', visible : false},
					{ name : 'export_button', visible : true}
				]
			};	
			var jsonObject = Ext.decode('${ param.jsonObject }');
			//如果点击的是一级机构，则增加“直属领导”输入框
		    if(jsonObject.level == 1){
				params.formFields.push({
			        xtype:'combo',
	                fieldLabel: '直属领导',
			        name:'directLeader',
			        objectName: 'directLeader.uid',
			        field:'directLeader',
	                editable : false,
	                codeSql: "select basic_user.uid as uid,userName as text from basic_department,basic_user where basic_department.uid = basic_user.belongDept and getItemValue(basic_department.level)='1' and userId!='admin'"
	            });	
		    }
			new com.lxq.js.GridAndForm.BaseGridAndForm(params).initGridAndForm();

		</script>
	</head>
	<body>
		<div id='${pageId}'></div>
	</body>
</html>
