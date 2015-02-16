<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/header.jsp"%>

<c:set var="entityName"
	value="com.lxq.platform.workflow.pojo.FlowNode"></c:set>

<html>
<head>
<script type="text/javascript">
	var params = {

		/**panel渲染元素**/
		divId : '${pageId}',

		/**项目名称**/
		path : '${path}',

		/**导出文件的名称**/
		fileName : '流程节点',

		/**弹出窗口标题**/
		title : '流程节点',

		/**实体对象名称**/
		entityName : '${entityName}',

		/**action地址**/
		actionUrl : "/baseAction",

		/**每页显示的记录数**/
		pageSize : 20,

		/**grid 的sql from 语句**/
		gridSql : 'from flownode',

		/**初始化grid的sql查询条件**/
		queryClause : '1=2',
		
		/**form 的sql from 语句**/
		formSql : 'from flownode',

		/**排序字段**/
		sort : 'uid',

		/**排序方式**/
		dir : 'asc',
		
		/**grid高度*/
		gridHeight : (Ext.get("center").getHeight()
		- Ext.get("south").getHeight() - 20) / 2,

		/**弹出窗口的宽度**/
		formWidth : 600,

		/**弹出窗口的高度**/
		formHeight : 250,

		/**弹出窗口的表单项的文字标签的对齐方式**/
		labelAlign : 'right',

		/**gird信息项**/
		gridFields : [ {
			type : 'textfield',
			name : 'uid',//必须有一个名称为“uid”的信息项,作为主键
			field : 'uid',
			header : '主键',
			searchable : false,
			hidden : true
		} , {
			type : 'textfield',
			name : 'nodeNo',
			field : 'nodeNo',
			header : '节点编号',
			sortable : true,
			searchable : true
		} , {
			type : 'textfield',
			name : 'nodeName',
			field : 'nodeName',
			header : '节点名称',
			sortable : true,
			searchable : true
		} , {
			type : 'textfield',
			name : 'script',
			field : 'script',
			header : '节点脚本',
			sortable : true,
			searchable : true
		} , {
			type : 'textfield',
			name : 'flowModel',
			field : 'flowModel',
			header : '所属流程',
			sortable : true,
			searchable : true
		} , {
			type : 'textfield',
			name : 'remark',
			field : 'remark',
			header : '备注',
			sortable : true,
			searchable : true
		} ],

		/**form表单信息项**/
		formFields : [ {
			xtype : 'fieldset',
			title : ' ',
			collapsible : true,
			autoHeight : true,
			layout : 'column',
			items : [ {
				columnWidth : 1.0,
				layout : 'form',
				items : [ {
					xtype : 'textfield',
					fieldLabel : '主键',
					name : 'uid',
					field : 'uid',
					hidden : true,
					readOnly : true
				} ]
			}, {
				columnWidth : 1.0,
				layout : 'form',
				items : [ {
					xtype : 'textfield',
					fieldLabel : '节点编号',
					name : 'nodeNo',
					field : 'nodeNo',
					allowBlank : true
				} ]
			}, {
				columnWidth : 1.0,
				layout : 'form',
				items : [ {
					xtype : 'textfield',
					fieldLabel : '节点名称',
					name : 'nodeName',
					field : 'nodeName',
					allowBlank : true
				} ]
			}, {
				columnWidth : 1.0,
				layout : 'form',
				items : [ {
					xtype : 'textfield',
					fieldLabel : '节点脚本',
					name : 'script',
					field : 'script',
					allowBlank : true
				} ]
			}, {
				columnWidth : 1.0,
				layout : 'form',
				items : [ {
					xtype : 'textfield',
					fieldLabel : '所属流程',
					name : 'flowModel',
					objectName : 'flowModel.uid',
					field : 'flowModel',
					allowBlank : true
				} ]
			}, {
				columnWidth : 1.0,
				layout : 'form',
				items : [ {
					xtype : 'textfield',
					fieldLabel : '备注',
					name : 'remark',
					field : 'remark',
					allowBlank : true
				} ]
			} ]
		} ],

		//new : 新增权限,info ： 查看权限,edit ：编辑权限,cancel ：取消权限，all ：所有权限
		buttons : [ {
			name : 'add_button',
			visible : true
		}, {
			name : 'query_button',
			visible : true
		}, {
			name : 'update_button',
			visible : true
		}, {
			name : 'delete_button',
			visible : true
		}, ]
	};

	var flowNode = new com.lxq.js.GridAndForm.BaseGridAndForm(params);
	flowNode.initGridAndForm();
</script>
</head>
<body>
	<div id='${pageId}'></div>
</body>
</html>
