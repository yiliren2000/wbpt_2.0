<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp"%>

<c:set var="entityName" value="com.lxq.platform.goalManage.pojo.PerformanceGoal"></c:set>
    
<html>
	<head>
		<script type="text/javascript">
			var tree_menu_panel = Ext.getCmp('${ param.treeId }');
		
			var jsonObject = Ext.decode('${ param.jsonObject }');
			var finishStatus = jsonObject.finishStatus;
			var goalType = jsonObject.goalType;
		
			var params = {		
			    /**panel渲染元素**/
				divId : '${pageId}',

			    /**tree_menu_panel渲染元素**/
				treeMenuPanel : tree_menu_panel,
								
			    /**项目名称**/
			    path: '${path}',
			
				/**导出文件的名称**/
				fileName: '期次列表',

			    /**弹出窗口标题**/
			    title: "期次管理",
				
			    /**实体对象名称**/
			    entityName: '${entityName}',
				
			    /**action地址**/
			    actionUrl: "/goalManage/goalSendAction",
				
                /**grid 的sql from 语句**/
                gridSql: 
                    " from performance_goal " +
                    " where " +
                    " createPerson = '${curUser.uid}' " +//创建人是当前用户
                    " and getDateBatchStatus(dateBatch,'begin')=true "+//是期初目标
                    " and getItemValue(goalType)='"+goalType+"' " +//目标类型
                    " and beginStatus is null"//制定状态
                ,	
                /**form 的sql from 语句**/
                formSql: 'from performance_goal',
			    
			    /**每页显示的记录数**/
			    pageSize: 20,
			    
			    /**排序字段**/
			    sort: 'uid',
			    
				/**排序方式**/
		    	dir: 'asc',	

		    	/**grid高度*/
				gridHeight : Ext.get("center").getHeight()-Ext.get("south").getHeight()-40,

				/**弹出窗口的宽度**/
				formWidth: 700,
				
				/**弹出窗口的高度**/
				formHeight: 450,
				
				/**弹出窗口的表单项的文字标签的对齐方式**/
				labelAlign: 'right',
				
				/**gird信息项**/
				gridFields: [{
		            type: 'textfield',
		            name: 'uid',//必须有一个名称为“uid”的信息项,作为主键
		            field: 'uid' ,
		            header: '主键',
		            searchable: false,
		            hidden: true
		        },{
		            type: 'textfield',
		            name: 'batchType',
		            field: 'getItemText(getBatchType(dateBatch))' ,
		            header: '期次类型',
		            sortable: true,
		            searchable: true
		        },{
		            type: 'textfield',
		            name: 'dateBatch',
		            field: 'getDateBatch(dateBatch)' ,
		            header: '期次',
		            sortable: true,
		            searchable: true
		        },{
		            type: 'textfield',
		            name: 'content',
		            field: 'content' ,
		            header: '目标内容',
		            sortable: true,
		            searchable: true,
		            hidden: false,
		            renderer: showTip
		        },{
		            type: 'textfield',
		            name: 'finishStatus',
		            field: 'getItemText(finishStatus)' ,
		            header: '完成状态',
		            sortable: true,
		            searchable: true
		        },{
		            type: 'textfield',
		            name: 'goalType',
		            field: 'getItemText(goalType)' ,
		            header: '目标类型',
		            sortable: true,
		            searchable: true
		        },{
		            type: 'textfield',
		            name: 'fullScore',
		            field: 'fullScore' ,
		            header: '目标得分',
		            sortable: true,
		            searchable: true
		        },{
		            type: 'textfield',
		            name: 'ownerDept',
		            field: 'getDeptName(ownerDept)' ,
		            header: '执行机构',
		            sortable: true,
		            searchable: true
		        }],
				
				/**form表单信息项**/
			    formFields: [
			    {
			        xtype:'textfield',
			        fieldLabel: '主键',
			        name:'uid',
			        field: 'uid',
			        hidden: true,
			        readOnly : true,
			        hidden : true
			    },{
			        xtype:'combo',
			        fieldLabel: '所属期次',
			        name:'dateBatch',
			        objectName: 'dateBatch.uid',
			        field: 'dateBatch',
			        allowBlank: false,
			        codeSql:'select uid,dateBatch as text from date_batch where beginStatus=true '
			    },{
			    	xtype: 'textarea',
			        fieldLabel: '目标内容',
			        name:'content',
			        field: 'content',
			        height:200,
			        allowBlank: false,
			        width: 400,
			        height : 100
			    },{
			        xtype:'textfield',
			        fieldLabel: '完成情况',
			        name:'finishStatus',
			        objectName:'finishStatus.uid',
			        field: 'finishStatus',
			        allowBlank: false,
					value:23,
			        hidden:true
			    },{
			        xtype:'textfield',
			        fieldLabel: '目标类型',
			        name:'goalType',
			        objectName:'goalType.uid',
			        field: 'goalType',
			        allowBlank: false,
					value:13,
			        hidden:true
			    },{
			        xtype:'numberfield',
			        fieldLabel: '标准得分',
			        name:'fullScore',
			        field: 'fullScore',
			        allowBlank: true,
			        hidden:true
			    },{
			        xtype:'combo',
			        fieldLabel: '执行人',
			        name:'ownerPerson',
			        objectName:'ownerPerson.uid',
			        field: 'ownerPerson',
			        allowBlank: false,
			        hidden: false,
			        codeSql : 'select uid,userName as text from basic_user where getParentDept(belongDept)=${curDept.uid} '
			    }],
			    
				//new : 新增权限,info ： 查看权限,edit ：编辑权限,cancel ：取消权限，all ：所有权限
				buttons:[
					{ name : 'add_button', visible : finishStatus=='no'?true:false},
					{ name : 'query_button', visible : true},
					{ name : 'update_button', visible : finishStatus=='no'?true:false},
					{ name : 'delete_button', visible : finishStatus=='no'?true:false},
					{ name : 'export_button', visible : false}
				]
			};			
			
			var setupGoal = new com.lxq.js.GridAndForm.BaseGridAndForm(params);

			setupGoal.initGridAndForm();
			
			var setupGoalPanel = setupGoal.getGridPanel();
			var tb = setupGoal.getToolBar();
			
			//添加一个按钮
			tb.insert(4,{
           		id: this.divId+'_send_button',
           		hidden : finishStatus=='no'?false:true,
           		xtype: 'button',
           		text: '分发',
           		icon: '${path}/resources/images/send_receive.png',
   				listeners: { 
   					click: function(){
   						var selModel = setupGoalPanel.getSelectionModel();
		                if (selModel.hasSelection()) {
		                	Ext.MessageBox.show({
						           title: '提示',
						           msg: '确认分发吗？',
						           icon:Ext.MessageBox.QUESTION,
						           buttons:Ext.Msg.YESNO,
						           closable:true,
						           fn: function (button) {
		                        if (button == "yes") {
		                            var selected = selModel.getSelections();
		
									var uid = selected[0].data.uid;

									var jsonObject = {'uid':uid};
									
									Ext.Ajax.request({
									    url : '${path}/goalManage/goalApproveAction!sendGoal.action',
									    method : 'post',
									    params : {
									       jsonObject : Ext.encode(jsonObject)
									    },
									    success : function(response, options) {
									    	var o_response = Ext.util.JSON.decode(response.responseText)
									    	if(!o_response.success){
										    	Ext.MessageBox.show({
												     title: '提示',
												     msg: o_response.msg?o_response.msg:"系统错误",
												     icon:Ext.MessageBox.ERROR,
												     buttons:Ext.Msg.OK,
												     closable:true
											    });
									    	}else{
										    	Ext.MessageBox.show({
												     title: '提示',
												     msg: o_response.msg,
												     icon:Ext.MessageBox.INFO,
												     buttons:Ext.Msg.OK,
												     closable:true
											    });
									    	}
									    	tree_menu_panel.getRootNode().reload();
	                						tree_menu_panel.expandAll();
									    	setupGoal.reloadGrid();
									    },
									    failure : function(response, options) {
									    	 Ext.MessageBox.show({
											     title: '提示',
											     msg: '系统错误',
											     icon:Ext.MessageBox.ERROR,
											     buttons:Ext.Msg.OK,
											     closable:true
										    });
									    }
									 });
		                        }
		                    }});
		                }
		                else {
		                	Ext.MessageBox.show({
					           title: '提示',
					           msg: '请选择一条记录',
					           icon:Ext.MessageBox.WARNING,
					           buttons:Ext.Msg.OK,
					           closable:true
					        });
		                }
   					}
   				}	
			});
			
			//添加一个按钮
			tb.insert(5,{
           		id: this.divId+'_copy_button',
           		hidden : finishStatus=='no'?true:false,
           		xtype: 'button',
           		text: '复制',
           		icon: '${path}/resources/images/copy.png',
   				listeners: { 
   					click: function(){
   						var selModel = setupGoalPanel.getSelectionModel();
		                if (selModel.hasSelection()) {
		                	Ext.MessageBox.show({
						           title: '提示',
						           msg: '确认复制吗？',
						           icon:Ext.MessageBox.QUESTION,
						           buttons:Ext.Msg.YESNO,
						           closable:true,
						           fn: function (button) {
		                        if (button == "yes") {
		                            var selected = selModel.getSelections();
		
									var uid = selected[0].data.uid;

							    	var jsonObject = {
							    			uid:uid,
							    			copyType: 'send'
							    		};
									Ext.Ajax.request({
									    url : '${path}/goalManage/goalApplyAction!copyGoal.action',
									    method : 'post',
									    params : {
									    	jsonObject : Ext.encode(jsonObject)
									    },
									    success : function(response, options) {
									    	var o_response = Ext.util.JSON.decode(response.responseText)
									    	if(!o_response.success){
										    	Ext.MessageBox.show({
												     title: '提示',
												     msg: o_response.msg?o_response.msg:"系统错误",
												     icon:Ext.MessageBox.ERROR,
												     buttons:Ext.Msg.OK,
												     closable:true
											    });
									    	}else{
										    	Ext.MessageBox.show({
												     title: '提示',
												     msg: o_response.msg,
												     icon:Ext.MessageBox.INFO,
												     buttons:Ext.Msg.OK,
												     closable:true
											    });
									    	}
									    },
									    failure : function(response, options) {
									    	 Ext.MessageBox.show({
											     title: '提示',
											     msg: '系统错误',
											     icon:Ext.MessageBox.ERROR,
											     buttons:Ext.Msg.OK,
											     closable:true
										    });
									    }
									 });
		                        }
		                    }});
		                }
		                else {
		                	Ext.MessageBox.show({
					           title: '提示',
					           msg: '请选择一条记录',
					           icon:Ext.MessageBox.WARNING,
					           buttons:Ext.Msg.OK,
					           closable:true
					        });
		                }
   					}
   				}	
			});
		</script>
	</head>
	<body>
		<div id='${pageId}'></div>
	</body>
</html>
