<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp"%>

<c:set var="entityName" value="com.lxq.platform.userManage.pojo.Role"></c:set>
  
<html>
	<head>
		<script type="text/javascript">
			
			var params = {
							
			    /**panel渲染元素**/
				divId : '${pageId}',
				
			    /**项目名称**/
			    path: '${path}',
			
				/**导出文件的名称**/
				fileName: '用户角色列表',

			    /**弹出窗口标题**/
			    title: "用户角色",
				
			    /**实体对象名称**/
			    entityName: '${entityName}',
				
			    /**action地址**/
			    actionUrl: "/userManage/userRoleAction",
				
			    /**每页显示的记录数**/
			    pageSize: 20,
			    
			    /**排序字段**/
			    sort: 'uid',
			    
				/**排序方式**/
		    	dir: 'asc',	

				/**grid高度*/
				gridHeight : (Ext.get("center").getHeight()-Ext.get("south").getHeight()-20)/2,
				
				/**弹出窗口的宽度**/
				formWidth: 400,
				
				/**弹出窗口的高度**/
				formHeight: 250,
				
				/**弹出窗口的表单项的文字标签的对齐方式**/
				labelAlign: 'right',
				
				/**gird信息项**/
				gridFields: [{
		            type: 'textfield',
		            name: 'userUid',
		            field: 'userUid' ,
		            header: '用户主键',
		            hidden : true,
		            whereClause : true
		        },{
		            type: 'textfield',
		            name: 'roleUid',
		            field: 'roleUid',
		            header: '角色主键',
		            hidden : true,
		            whereClause : true
		        },{
		            type: 'textfield',
		            name: 'roleId',
		            field: 'roleId' ,
		            header: '角色编号',
		            sortable: true
		        },{
		            type: 'textfield',
		            name: 'roleName',
		            field: 'name' ,
		            header: '角色名称',
		            sortable: true
		        },{
		            type: 'textfield',
		            name: 'status',
		            field:'status.text' ,
		            header: '角色状态'
		        }],
				
				/**form表单信息项**/
			    formFields: [
			    {
			        xtype:'textfield',
			        fieldLabel: '用户主键',
			        name:'userUid',
			        field: 'userUid',
			        readOnly : true,
				    style:'background:#E6E6E6',
				    hidden : true
			    },
			    {
			        xtype:'combo',
			        fieldLabel: '角色',
			        name:'roleUid',
			        field: 'roleUid',
			        allowBlank : false,
			        codeSql : 'select uid,roleName as text from basic_role'
			    }],
			    
			    
				//new : 新增权限,info ： 查看权限,edit ：编辑权限,cancel ：取消权限，all ：所有权限
				buttons:[
					{ name : 'add_button', visible : ${pt:hasRight(curUser,'add', entityName)}},
					{ name : 'query_button', visible : false},
					{ name : 'update_button', visible : false},
					{ name : 'delete_button', visible : ${pt:hasRight(curUser,'delete', entityName)}},
					{ name : 'search_button', visible : false},
					{ name : 'extend_search_button', visible : false},
					{ name : 'export_button', visible : false}
				]
			};			
			
			var role = new com.lxq.js.GridAndForm.BaseGridAndForm(params);
			role.initGridAndForm();
			
		</script>
	</head>
	<body>
		<div id='${pageId}'></div>
	</body>
</html>
