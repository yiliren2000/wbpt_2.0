<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp"%>

<c:set var="entityName" value="com.lxq.platform.goalManage.pojo.PerformanceGoal"></c:set>
    
<html>
	<head>
		<script type="text/javascript">
			var tree_menu_panel = Ext.getCmp('${ param.treeId }');
					
			var jsonObject = Ext.decode('${ param.jsonObject }');
		
			var goalType = jsonObject.goalType;
			var beginStatus = jsonObject.beginStatus;
			var applyType = jsonObject.applyType;
		
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
			    actionUrl: "/goalManage/goalApplyAction",
				
			    /**每页显示的记录数**/
			    pageSize: 20,
			    
                /**grid 的sql from 语句**/
                gridSql: 
                    " from performance_goal " +
                    " where " +
                    " ownerPerson = '${curUser.uid}' " +//执行人是当前用户
                    (beginStatus!="exprire"?" and getDateBatchStatus(dateBatch,'begin') = true":"")+//是期初目标
                    " and getItemValue(goalType)='"+goalType+"' " +//目标类型
                    " and getItemValue(beginStatus) = '"+beginStatus+"'"//制定状态
                ,
                
                /**form 的sql from 语句**/
                formSql: 'from performance_goal', 
			    
			    /**排序字段**/
			    sort: 'getItemText(isMajor)',
			    
				/**排序方式**/
		    	dir: 'desc',	
				
				/**是否单选**/
		    	singleSelect: false,
		    	
		    	/**grid高度*/
				gridHeight : Ext.get("center").getHeight()-Ext.get("south").getHeight()-30,

				/**弹出窗口的宽度**/
				formWidth: 650,
				
				/**弹出窗口的高度**/
				formHeight: 350,
				
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
		            searchable: true,
		            hidden: true
		        },{
		            type: 'textfield',
		            name: 'dateBatch',
		            field: 'getDateBatch(dateBatch)' ,
		            header: '期次',
		            sortable: true,
		            searchable: true
		        },{
		        	id: '${pageId}_content',
		            type: 'textfield',
		            name: 'content',
		            field: 'content' ,
		            header: '目标内容',
		            sortable: true,
		            searchable: false,
		            hidden: false,
		            renderer: showTip
		        },{
		            type: 'textfield',
		            name: 'isMajor',
		            field: 'getItemText(isMajor)' ,
		            header: '是否重要任务',
		            sortable: true,
		            searchable: false,
		            hidden: false
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
		            searchable: true,
		            hidden: true
		        },{
		            type: 'textfield',
		            name: 'ownerDept',
		            field: 'getDeptName(ownerDept)' ,
		            header: '执行机构',
		            sortable: true,
		            searchable: true,
		            hidden: true
		        },{
		            type: 'textfield',
		            name: 'coorDeptsJson',
		            field: 'coorDeptsJson' ,
		            header: '协同部门',
		            sortable: true,
		            searchable: true,
		            hidden: true
		        },{
		            type: 'textfield',
		            name: 'beginStatus',
		            field: 'getItemText(beginStatus)' ,
		            header: '制定申请状态',
		            sortable: true,
		            searchable: true,
		            hidden: false
		        },{
		            type: 'textfield',
		            name: 'createDept',
		            field: 'getDeptName(createDept)' ,
		            header: '创建部门',
		            sortable: true,
		            searchable: true,
		            hidden: true
		        },{
		            type: 'textfield',
		            name: 'createPerson',
		            field: 'getUserName(createPerson)' ,
		            header: '创建人',
		            sortable: true,
		            searchable: true
		        },{
		            type: 'textfield',
		            name: 'createTime',
		            field: 'createTime' ,
		            header: '创建时间',
		            sortable: true,
		            searchable: true
		        },{
		            type: 'textfield',
		            name: 'finalScore',
		            field: 'finalScore' ,
		            header: '最终得分',
		            sortable: true,
		            searchable: true,
		            hidden: true
		        },{
		            type: 'textfield',
		            name: 'remark',
		            field: 'remark' ,
		            header: '备注',
		            sortable: true,
		            searchable: true,
		            renderer: showTip
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
			        xtype:'textfield',
			        fieldLabel: '所属期次',
			        name:'dateBatchText',
			        objectName: 'dateBatch.dateBatch',
			        field: 'getDateBatch(dateBatch)',
			        byUse: {info_panel:true}
			    },{
			        xtype:'combo',
			        fieldLabel: '所属期次',
			        name:'dateBatch',
			        objectName: 'dateBatch.uid',
			        field: 'dateBatch',
			        allowBlank: false,
			        codeSql:'select uid,dateBatch as text from date_batch where beginStatus=true ',
			        byUse: {new_panel:true,edit_panel: true}
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
			        fieldLabel: '目标类型',
			        name:'goalType',
			        objectName: 'goalType.uid',
			        field: 'goalType',
			        allowBlank: false,
					value:13,
			        hidden:true
			    },{
			        xtype:'textfield',
			        fieldLabel: '完成状态',
			        name:'finishStatus',
			        objectName:'finishStatus.uid',
			        field: 'finishStatus',
			        allowBlank: false,
					value:23,
			        hidden:true
			    },{
			        xtype:'numberfield',
			        fieldLabel: '最终得分',
			        name:'finalScore',
			        field: 'finalScore',
			        allowBlank: true,
			        hidden:true
			    },{
			        xtype:'textfield',
			        fieldLabel: '制定申请状态',
			        name:'beginStatus',
			        objectName: 'beginStatus.uid',
			        field: 'beginStatus',
			        allowBlank: false,
			        hidden:true,
			        value:15
			    },{
					xtype:'lovcombo',
			        fieldLabel: '协同部门',
			        name:'coorDeptsJson',
			        field: 'coorDeptsJson',
			        allowBlank: true,
			        codeSql: "select uid,deptName as text from basic_department where getItemValue(status)='1' and getItemValue(level)='2' and uid != ${curDept.uid} order by deptId"
			    },{
			        xtype:'combo',
			        fieldLabel: '是否重点任务',
			        name:'isMajor',
			        objectName: 'isMajor.uid',
			        field: 'isMajor',
			        allowBlank: false,
			        codeNo: 'YesOrNo',
			        byUse: {new_panel:true,edit_panel: true}
	            }],
			    
				//new : 新增权限,info ： 查看权限,edit ：编辑权限,cancel ：取消权限，all ：所有权限
				buttons:[
					{ name : 'add_button', visible : beginStatus=='submit'?true:false},
					{ name : 'query_button', visible : true},
					{ name : 'update_button', visible : beginStatus=='submit'||beginStatus=='goback'?true:false},
					{ name : 'delete_button', visible : beginStatus=='submit'||beginStatus=='goback'||beginStatus=='reject'?true:false},
					{ name : 'search_button', visible : false},
					{ name : 'extend_search_button', visible : false},
					{ name : 'export_button', visible : false}
				]
			};			
			
			var setupGoal = new com.lxq.js.GridAndForm.BaseGridAndForm(params);

			setupGoal.initGridAndForm();
			
			var setupGoalPanel = setupGoal.getGridPanel();
			var tb = setupGoal.getToolBar();
			
			//添加一个按钮
			tb.insert(4,{
           		id: this.divId+'_sbumit_button',
           		hidden : beginStatus=='submit'||beginStatus=='goback'?false:true,
           		xtype: 'button',
           		text: '提交',
           		icon: '${path}/resources/images/icon/accept.png',
   				listeners: { 
   					click: function(){
   						var selModel = setupGoalPanel.getSelectionModel();
		                if (selModel.hasSelection()) {
		                	
		                	var selected = selModel.getSelections();
		            		
		                	var opinion_tb = new Ext.Toolbar({
	                	       items: [
	                	       {
	                	      		text: '提交',
	                	      		xtype: 'button',
	                	      		icon: '${path}/resources/extjs/examples/shared/icons/save.gif',
	                				handler: function() {
	                	   				var form = signOpinionPanel.getForm();
	                	   				
	                			      	if (form.isValid()) {
	                			      		
	                			      		var json_uids = new Array();
	                			      		
	                			      		 for(var i = 0 ; i < selected.length ; i ++){
	                			      			json_uids.push(selected[i].data.uid); 
	                			     	     }
	                			      		
	                			            form.submit({
	                			           	    url:'${path}/goalManage/goalApplyAction!signOpinion.action',
	                			           	    method : 'post',
		                			           	params:{
		     		                				uid : Ext.encode(json_uids),
		     		                	        	applyType : applyType
		     		                			},
	                			           	    waitTitle: '请等待',
	                			           	    waitMsg : '正在提交...',
	                			               	success: function(form, action) {
	                						    	Ext.MessageBox.show({
	                						           title: '提示',
	                						           msg: '提交成功',
	                						           icon:Ext.MessageBox.INFO,
	                						           buttons:Ext.Msg.OK,
	                						           closable:true,
	                						           fn: opinionWindow.hide()
	                						        });
	                						        tree_menu_panel.getRootNode().reload();
	                						        tree_menu_panel.expandAll();
	                						        
	                						    	//重新加载下面gird的数据 
	                								setupGoal.reloadGrid();
	                			       			},
	                			     		    failure: function(form, action) {
	                							    Ext.MessageBox.show({
	                							      title: '提示',
	                							      msg: "系统错误",
	                							      icon:Ext.MessageBox.ERROR,
	                							      buttons:Ext.Msg.OK,
	                							      closable:true
	                							    });
	                				            }
	                			          });
	                			     }
	                		     	}	
	                	      	},
	                	       {//创建“取消”按钮
	                	      		text: '取消',
	                	      		xtype: 'button',
	                	      		icon: '${path}/resources/images/icon/cancel.png',
	                			    handler: function() {
	                				   opinionWindow.hide();
	                	            }
	                	      	}
	                	      ]
	                		});
		                	
		                		var opinionWindow = new Ext.Window({
		                			modal: true,
		                			title: (selected.length>1?'多条目标':'单条目标')+'------提交/签署意见',
		                			width: 680,
		                			height: 450,
		                			autoScroll:true,
		                			tbar: ['->',opinion_tb],
		                			closeAction: 'hide'
		                		});
		                		
		                		var signOpinionPanel = new Ext.FormPanel({
              					      frame: true,
			                	      bodyStyle:'padding:5px 5px 0',
			                	      reader: new Ext.data.JsonReader({
				              				successProperty: 'success',
				              				root: 'info'
				              			 },['opinionUid','content','action','opinion']
				              		  ),
			                	      items: [{
			          			        xtype:'textfield',
			        			        fieldLabel: '主键',
			        			        name:'opinionUid',
			        			        readOnly : true,
		                	            allowBlank: true,
			        			        hidden : true
			        			   	 },{
			                	    	  xtype:'textarea',
			                	          fieldLabel: '目标内容',
			                	          name: 'content',
			                	          height:200,
			          			          allowBlank: true,
			          			          width: 400,
			          			          height : 100,
			          			          readOnly:true,
			          			          style:'background:#E6E6E6',
			          			          hidden: selected.length>1
			                	      },{
			                	    	  xtype:'radiogroup',
			                	    	  fieldLabel : '提交动作', 
			                	    	  name: 'action',
			                	    	  anchor:'95%',
			                	    	  columns: 3 ,
			                	    	  items:[
			                	    	      {boxLabel: "同意", name: 'action',inputValue: 'agree',checked: true},  
			                	    	      {boxLabel: "否决", name: 'action',inputValue: 'reject'},  
			                	    		  {boxLabel: "退回", name: 'action',inputValue: 'goback'}  
			                	    	  ], 
			                	          allowBlank: false,
			                	          hidden: beginStatus=='submit'||beginStatus=='goback'?true:false
			                	      },{
			                	    	  xtype:'textarea',
			                	          fieldLabel: '意见',
			                	          name: 'opinion',
			                	          height:200,
			          			          allowBlank: true,
			          			          width: 400,
			          			          height : 100
			                	      }]
			                	    });		                		
		                		Ext.Ajax.request({
		                			url: '${path}/goalManage/goalApplyAction!getOpinions.action',
		                			method: 'POST',
		                			params:{
		                				uid : selected[0].data.uid,
		                	        	applyType : applyType
		                			},
		                			success: function (response) {
		                					
		                				if(selected.length<=1){
			                				var opinions = Ext.decode(response.responseText).info;
			                				for( var i = 0 ; i < opinions.length ; i++){
					                			var title;
					                			var html;
					                			if(opinions[i].phaseName == "first"){
						                	        title = '提交时间:'+opinions[i].approveTime+
						                	          '&nbsp;&nbsp;&nbsp;&nbsp;提交部门:'+opinions[i].approveDept+
						                	      	  '&nbsp;&nbsp;&nbsp;&nbsp;提交人:'+opinions[i].approvePerson+
						                	      	  '&nbsp;&nbsp;&nbsp;&nbsp;提交动作:'+opinions[i].action+'&nbsp;&nbsp;&nbsp;&nbsp;';
						                	      	html = "目标完成情况:"+opinions[i].opinion;  
					                			} else if(opinions[i].phaseName == "last"){
						                	        title = '终审时间:'+opinions[i].approveTime+
						                	          '&nbsp;&nbsp;&nbsp;&nbsp;终审部门:'+opinions[i].approveDept+
						                	      	  '&nbsp;&nbsp;&nbsp;&nbsp;终审人:'+opinions[i].approvePerson+
						                	      	  '&nbsp;&nbsp;&nbsp;&nbsp;终审动作:'+opinions[i].action+'&nbsp;&nbsp;&nbsp;&nbsp;';
						                	      	html = "终审意见:"+opinions[i].opinion;  
					                			} else{
						                	        title = '审查时间:'+opinions[i].approveTime+
						                	          '&nbsp;&nbsp;&nbsp;&nbsp;审查部门:'+opinions[i].approveDept+
						                	      	  '&nbsp;&nbsp;&nbsp;&nbsp;审查人:'+opinions[i].approvePerson+
						                	      	  '&nbsp;&nbsp;&nbsp;&nbsp;审查动作:'+opinions[i].action+'&nbsp;&nbsp;&nbsp;&nbsp;';
						                	      	html = "审查意见:"+opinions[i].opinion;  
					                			}
						                	      	
					                			var opinionPanel = new Ext.Panel({
				                				  frame: true,
						                	      bodyStyle:'padding:5px 5px 0',
						                	      title: title,
						                	      html: html
						                	    });
					                			
						                		opinionWindow.add(opinionPanel);
					                		}
		                				}
				                		
				                		//加载详情表单的数据
				            			signOpinionPanel.getForm().load( {
				            	           	url : '${path}/goalManage/goalApplyAction!findOpinion.action',
				            	           	params : {
				            	           		uid : selected[0].data.uid,
				                	        	applyType : applyType
				            				},
				            	           	
				            	           	waitTitle: '请等待',
				            	           	waitMsg : '正在载入数据...',
				            	           	success : function(form,action) {
				            	           	},
				            	           	failure : function(form,action) {

				            					var o_response = Ext.util.JSON.decode(action.response.responseText)
				            			    	if(!o_response.success){
				            				    	Ext.MessageBox.show({
				            						     title: '提示',
				            						     msg: o_response.info.msg,
				            						     icon:Ext.MessageBox.ERROR,
				            						     buttons:Ext.Msg.OK,
				            						     closable:true
				            					    });
				            			    	}
				            	           	}
				            	       	});
				            			opinionWindow.add(signOpinionPanel);
				                		opinionWindow.show();
		                			},
		                			failure: function(form, action) {
		                	        }
		                		});
		                		
		                		
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
           		id: this.divId+'_view-opinion_button',
           		hidden : beginStatus=='submit'?true:false,
           		xtype: 'button',
           		text: '查看意见',
           		icon: '${path}/resources/images/icon/user_comment.png',
   				listeners: { 
   					click: function(){
   						var selModel = setupGoalPanel.getSelectionModel();
		                if (selModel.hasSelection()) {
		                	
		                	var selected = selModel.getSelections();
		            		
		                		var opinionWindow = new Ext.Window({
		                			modal: true,
		                			title: '查看意见',
		                			width: 680,
		                			height: 450,
		                			autoScroll:true,
		                			closeAction: 'hide'
		                		});
		                		
		                		Ext.Ajax.request({
		                			url: '${path}/goalManage/goalApplyAction!getOpinions.action',
		                			method: 'POST',
		                			params:{
		                				uid : selected[0].data.uid,
		                	        	applyType : applyType
		                			},
		                			success: function (response) {
		                				var opinions = Ext.decode(response.responseText).info;
		                				for( var i = 0 ; i < opinions.length ; i++){
				                			var title;
				                			var html;
				                			if(opinions[i].phaseName == "first"){
					                	        title = '提交时间:'+opinions[i].approveTime+
					                	          '&nbsp;&nbsp;&nbsp;&nbsp;提交部门:'+opinions[i].approveDept+
					                	      	  '&nbsp;&nbsp;&nbsp;&nbsp;提交人:'+opinions[i].approvePerson+
					                	      	  '&nbsp;&nbsp;&nbsp;&nbsp;提交动作:'+opinions[i].action+'&nbsp;&nbsp;&nbsp;&nbsp;';
					                	      	html = "目标完成情况:"+opinions[i].opinion;  
				                			} else if(opinions[i].phaseName == "last"){
					                	        title = '终审时间:'+opinions[i].approveTime+
					                	          '&nbsp;&nbsp;&nbsp;&nbsp;终审部门:'+opinions[i].approveDept+
					                	      	  '&nbsp;&nbsp;&nbsp;&nbsp;终审人:'+opinions[i].approvePerson+
					                	      	  '&nbsp;&nbsp;&nbsp;&nbsp;终审动作:'+opinions[i].action+'&nbsp;&nbsp;&nbsp;&nbsp;';
					                	      	html = "终审意见:"+opinions[i].opinion;  
				                			} else{
					                	        title = '审查时间:'+opinions[i].approveTime+
					                	          '&nbsp;&nbsp;&nbsp;&nbsp;审查部门:'+opinions[i].approveDept+
					                	      	  '&nbsp;&nbsp;&nbsp;&nbsp;审查人:'+opinions[i].approvePerson+
					                	      	  '&nbsp;&nbsp;&nbsp;&nbsp;审查动作:'+opinions[i].action+'&nbsp;&nbsp;&nbsp;&nbsp;';
					                	      	html = "审查意见:"+opinions[i].opinion;  
				                			}
					                	      	
				                			var opinionPanel = new Ext.Panel({
			                				  frame: true,
					                	      bodyStyle:'padding:5px 5px 0',
					                	      title: title,
					                	      html: html
					                	    });
				                			
					                		opinionWindow.add(opinionPanel);
				                		}
				                		opinionWindow.show();
		                			},
		                			failure: function(form, action) {
		                	        }
		                		});
		                		
		                		
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
			tb.insert(6,{
           		id: this.divId+'_undo_button',
           		hidden : beginStatus=='approving'?false:true,
           		xtype: 'button',
           		text: '撤销',
           		icon: '${path}/resources/images/goback.png',
   				listeners: { 
   					click: function(){
   						var selModel = setupGoalPanel.getSelectionModel();
		                if (selModel.hasSelection()) {
		                	Ext.MessageBox.show({
						           title: '提示',
						           msg: '确认要撤销吗？',
						           icon:Ext.MessageBox.QUESTION,
						           buttons:Ext.Msg.YESNO,
						           closable:true,
						           fn: function (button) {
		                        if (button == "yes") {
		                            var selected = selModel.getSelections();
		
									var uid = selected[0].data.uid;

									var jsonObject = {'uid':uid};
									
									Ext.Ajax.request({
									    url : '${path}/goalManage/goalApplyAction!undo.action',
									    method : 'post',
									    params:{
			                				uid : selected[0].data.uid,
			                	        	applyType : applyType
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
  	                						    tree_menu_panel.getRootNode().reload();
	                						    tree_menu_panel.expandAll();
										    	//重新加载下面gird的数据 
                								setupGoal.reloadGrid();
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
