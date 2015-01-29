<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp"%>

<c:set var="entityName" value="com.lxq.platform.goalManage.pojo.PerformanceGoal"></c:set>
    
<html>
	<head>
		<script type="text/javascript">
		
			var dateBatch = Ext.decode('${ param.dateBatch }');
			var deptUid = Ext.decode('${ param.deptUid }');
		
			var params = {		
			    /**panel渲染元素**/
				divId : '${pageId}',
				
			    /**项目名称**/
			    path: '${path}',
			
				/**导出文件的名称**/
				fileName: '工作明细表',

			    /**弹出窗口标题**/
			    title: "工作明细表",
				
			    /**实体对象名称**/
			    entityName: '${entityName}',
				
			    /**action地址**/
			    actionUrl: "/goalManage/report3Action",
				
			    /**grid查询参数*/
			    baseParams: {goalType:'dept'},
			    
			    /**每页显示的记录数**/
			    pageSize: 100,
			    
			    /**排序字段**/
			    sort: 'uid',
			    
				/**排序方式**/
		    	dir: 'asc',	
				
		    	/**grid高度*/
				gridHeight : Ext.get("center").getHeight()-Ext.get("south").getHeight()-30,

				/**弹出窗口的宽度**/
				formWidth: 600,
				
				/**弹出窗口的高度**/
				formHeight: 450,
				
				/**弹出窗口的表单项的文字标签的对齐方式**/
				labelAlign: 'right',
				
				/**gird信息项**/
				gridFields: [{
		            type: 'combo',
		            name: 'dateBatch',
		            field: 'dateBatch.uid',
		            header: '期次',
		            searchable: true,
		            codeSql: 'select uid,dateBatch from DateBatch',
		            hidden: true
		        },{
		            type: 'textfield',
		            name: 'dateBatch',
		            field: 'dateBatch.dateBatch',
		            header: '期次',
		            sortable: false,
		            searchable: false
		        },{
		            type: 'combo',
		            name: 'deptUid',
		            field: 'ownerDept.uid',
		            header: '部门名称',
		            searchable: (${pt:hasRole(curUser,'102')} || ${pt:hasRole(curUser,'102')} ?false:true),
		            hidden: true,
		            codeSql: ${pt:hasRole(curUser,'102')}?"select uid,deptName from Department where level.value='2'":"select uid,deptName from Department where parentDept.uid= ${curDept.uid} or uid= ${curDept.uid}"
		        },{
		            type: 'textfield',
		            name: 'deptName',
		            field: 'ownerDept.deptName',
		            header: '部门名称',
		            sortable: true,
		            searchable: false
		        },{
		            type: 'textfield',
		            name: 'content',
		            header: '重点工作内容',
		            sortable: false,
		            searchable: false,
		            showTip: true
		        },{
		            type: 'textfield',
		            name: 'finishStatus',
		            header: '完成情况',
		            sortable: true,
		            searchable: false
		        },{
		            type: 'numberfield',
		            name: 'finalScore',
		            header: '得分情况',
		            sortable: true,
		            searchable: false
		        },{
		            type: 'textfield',
		            name: 'remark',
		            header: '备注',
		            sortable: true,
		            searchable: false
		        }],
				
				/**form表单信息项**/
			    formFields: [],
			    
				//new : 新增权限,info ： 查看权限,edit ：编辑权限,cancel ：取消权限，all ：所有权限
				buttons:[
					{ name : 'add_button', visible : false},
					{ name : 'query_button', visible : false},
					{ name : 'update_button', visible : false},
					{ name : 'delete_button', visible : false},
					{ name : 'search_button', visible : false},
					{ name : 'extend_search_button', visible : false},
					{ name : 'export_button', visible : false}
				]
			};
			
			var goalReport = new com.lxq.js.GridAndForm.BaseGridAndForm(params);
			goalReport.initGridAndForm();
			var gridStore = goalReport.getGridStore();
			var tb = goalReport.getToolBar();
			
			tb.insert(7,{
           		id: '${pageId}_batch_detail',
           		xtype: 'datefield',
           		plugins: 'monthPickerPlugin',
           		value: new Date(),
           		format: 'Y年n月'
			});
			
			tb.insert(8,{
           		xtype: 'tbspacer'
			});
			tb.insert(9,{
           		id: '${pageId}_dept_detail',
           		xtype: 'combo',
           		emptyText: '请选择部门',
           		typeAhead: true,
			    triggerAction: 'all',
			    lazyRender:true,
			    mode: 'local',
			    store: new Ext.data.JsonStore({
					autoLoad: true,
	                fields: ['uid','text'],
				    url: ${pt:hasRole(curUser,'102')}?"${path}/utilAction!getCodeLibraryBySql.action?codeSql=select uid,deptName from Department where level.value='2' order by deptId":"${path}/utilAction!getCodeLibraryBySql.action?codeSql=select uid,deptName from Department where parentDept.uid= ${curDept.uid} or uid= ${curDept.uid} order by deptId"
				}),
			    valueField: 'uid',
			    displayField: 'text'
			});
			
			tb.insert(10,{
           		id: '${pageId}_query_report',
           		xtype: 'button',
           		text: '查询',
           		icon: '${path}/resources/images/icon/search.gif',
   				listeners: { 
   					click: function(){
   						var dateBatch = Ext.getCmp('${pageId}_batch_detail');
   						var dept = Ext.getCmp('${pageId}_dept_detail');
   						
   						if(!dateBatch.value){
	   						Ext.MessageBox.show({
					           title: '提示',
					           msg: '请选择期次',
					           icon:Ext.MessageBox.INFO,
					           buttons:Ext.Msg.OK,
					           closable:true
					        });
   						}else if(!dept.value){
	   						Ext.MessageBox.show({
					           title: '提示',
					           msg: '请选择部门',
					           icon:Ext.MessageBox.INFO,
					           buttons:Ext.Msg.OK,
					           closable:true
					        });
   						} else{
							gridStore.baseParams.queryClause = "{'dateBatch':"+dateBatch.value+",'deptUid':"+dept.value+"}";
							gridStore.load({ 
						        params:{
						        	start:0,
						        	limit:100
						        }  
						    });
   						}
   						
   					}
   				}	
			});

			//添加一个按钮
			tb.insert(11,{
           		id: '${pageId}_export_report',
           		xtype: 'button',
           		text: '导出报表',
           		icon: '${path}/resources/extjs/examples/shared/icons/fam/excel.gif',
   				listeners: { 
   					click: function(){
						doPost({
						    url: '${path}/goalManage/report3Action!exportReport.action'
						});
   					}
   				}	
			});
			
			gridStore.baseParams.queryClause = "{'dateBatch':"+dateBatch+",'deptUid':"+deptUid+"}";
			gridStore.load({ 
		        params:{
		        	start:0,
		        	limit:100
		        }  
		    });
		</script>
	</head>
	<body>
		<div id='${pageId}'></div>
	</body>
</html>
