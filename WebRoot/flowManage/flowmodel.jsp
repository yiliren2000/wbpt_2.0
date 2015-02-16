<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/header.jsp"%>

<c:set var="entityName"
	value="com.lxq.platform.workflow.pojo.FlowModel"></c:set>

<html>
<head>
<script type="text/javascript">
	var params = {

		/**panel渲染元素**/
		divId : '${pageId}',

		/**项目名称**/
		path : '${path}',

		/**导出文件的名称**/
		fileName : '流程模板',

		/**弹出窗口标题**/
		title : '流程模板',

		/**实体对象名称**/
		entityName : '${entityName}',

		/**action地址**/
		actionUrl : "/baseAction",

		/**每页显示的记录数**/
		pageSize : 20,

		/**grid 的sql from 语句**/
		gridSql : 'from flowmodel',

		/**form 的sql from 语句**/
		formSql : 'from flowmodel',

		/**排序字段**/
		sort : 'uid',

		/**排序方式**/
		dir : 'asc',
		
		/**grid高度*/
		gridHeight : (Ext.get("center").getHeight()
		- Ext.get("south").getHeight() - 40) / 2,

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
			name : 'modelNo',
			field : 'modelNo',
			header : '流程编号',
			sortable : true,
			searchable : true
		} , {
			type : 'textfield',
			name : 'modelName',
			field : 'modelName',
			header : '流程名称',
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
			}, {	columnWidth : 1.0,
				layout : 'form',
				items : [ {
					xtype : 'textfield',
					fieldLabel : '节点编号',
					name : 'modelNo',
					field : 'modelNo',
					allowBlank : true
				} ]
			}, {	columnWidth : 1.0,
				layout : 'form',
				items : [ {
					xtype : 'textfield',
					fieldLabel : '节点名称',
					name : 'modelName',
					field : 'modelName',
					allowBlank : true
				} ]
			}, {	columnWidth : 1.0,
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

	var flowModel = new com.lxq.js.GridAndForm.BaseGridAndForm(params);
	flowModel.initGridAndForm();
	var flowModelPanel = flowModel.getGridPanel();

	var flowNodePanel = new Ext.Panel({
		renderTo : '${pageId}_2',
		autoLoad : {
			url : '${path}/flowManage/flownode.jsp',
			scripts : true
		}
	});

	//当上面grid行点击时，重新加载下面grid的数据
	flowModelPanel.on("rowclick", function(gridPanel, rowIndex, e) {

		var selModel = gridPanel.getSelectionModel();
		if (selModel.hasSelection()) {//有选中行
			var selected = selModel.getSelections();//获取选择的列

			var key_value = selected[0].data.uid;//获取选中的第一列，名为“uid”的属性的属性值

			flowNode.getNewPanel().getForm().setValues({
				flowModel : key_value
			});

			//重新加载下面gird的数据 
			flowNode.reloadGrid(encodeURI("flowmodel='" + key_value + "'"));
		}
	})
</script>
</head>
<body>
	<div id='${pageId}'></div>
	<div id='${pageId}_2'></div>
</body>
</html>
