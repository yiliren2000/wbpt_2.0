<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp"%>

<c:set var="entityName1" value="com.lxq.platform.goalManage.pojo.ApprovePostil"></c:set>
<c:set var="entityName2" value="com.lxq.platform.goalManage.pojo.PerformanceGoal"></c:set>
    
<html>
	<head>
		<script type="text/javascript">
			var tree_menu_panel = Ext.getCmp('${ param.treeId }');
		
			var jsonObject = Ext.decode('${ param.jsonObject }');
			var finishStatus = jsonObject.finishStatus;
			var goalType = jsonObject.goalType;
			var params = {		
			    /**panel渲染元素**/
				divId : '${pageId}_1',
				
			    /**项目名称**/
			    path: '${path}',
			
				/**导出文件的名称**/
				fileName: '目标执行人列表',

			    /**弹出窗口标题**/
			    title: "期次管理",
				
			    /**实体对象名称**/
			    entityName: '${entityName1}',
				
			    /**action地址**/
			    actionUrl: "/goalManage/goalApplierAction",
				
			    /***grid查询参数**/
			    baseParams: {applyType:'selfEva',goalType:goalType,finishStatus: finishStatus},
				
			    /**每页显示的记录数**/
			    pageSize: 20,
			    
			    /**排序字段**/
			    sort: 'approve_postil.uid',
			    
				/**排序方式**/
		    	dir: 'asc',	

		    	/**是否单选**/
		    	singleSelect: false,
		    	
		    	/**grid高度*/
				gridHeight : (Ext.get("center").getHeight()-Ext.get("south").getHeight()-20)/2-10,

				/**弹出窗口的宽度**/
				formWidth: 400,
				
				/**弹出窗口的高度**/
				formHeight: 250,
				
				/**弹出窗口的表单项的文字标签的对齐方式**/
				labelAlign: 'right',
				
				/**gird信息项**/
				gridFields: [{
		            type: 'textfield',
		            name: 'dateBatchUid',
		            field: 'goal.dateBatch' ,
		            header: '期次主键',
		            sortable: true,
		            searchable: true,
		            hidden: true
		        },{
		            type: 'textfield',
		            name: 'dateBatch',
		            field: 'getDateBatch(goal.dateBatch)' ,
		            header: '期次',
		            sortable: true,
		            searchable: true
		        },{
		            type: 'textfield',
		            name: 'ownerDeptUid',
		            field: 'goal.ownerDept' ,
		            header: '执行机构',
		            sortable: true,
		            searchable: true,
		            hidden: true
		        },{
		            type: 'textfield',
		            name: 'ownerDeptName',
		            field: 'getDeptName(goal.ownerDept)' ,
		            header: '执行机构',
		            sortable: true,
		            searchable: true
		        },{
		            type: 'textfield',
		            name: 'ownerPersonUid',
		            field: 'goal.ownerPerson' ,
		            header: '执行人',
		            sortable: true,
		            searchable: true,
		            hidden: true
		        },{
		            type: 'textfield',
		            name: 'ownerPersonName',
		            field: 'getDeptName(goal.ownerPerson)' ,
		            header: '执行人',
		            sortable: true,
		            searchable: true,
		            hidden: true
		        },{
		            type: 'textfield',
		            name: 'goalCount',
		            header: '目标总计',
		            sortable: true,
		            searchable: true
		        },{
		            type: 'textfield',
		            name: 'majorGoalCount',
		            header: '重点工作总计',
		            sortable: true,
		            searchable: true
		        }],
				
				/**form表单信息项**/
			    formFields: [
			    {
			    }],
			    
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
			
			var applyPerson = new com.lxq.js.GridAndForm.BaseGridAndForm(params);

			applyPerson.initGridAndForm();
			
			var params2 = {		
				    /**panel渲染元素**/
					divId : '${pageId}_2',
					
				    /**项目名称**/
				    path: '${path}',
				
					/**导出文件的名称**/
					fileName: '目标列表',

				    /**弹出窗口标题**/
				    title: "期次管理",
					
				    /**实体对象名称**/
				    entityName: '${entityName2}',
					
				    /**action地址**/
				    actionUrl: "/goalManage/goalApproveAction",
					
				    /***grid查询参数**/
				    baseParams: {applyType:'selfEva',goalType:goalType,finishStatus: finishStatus},
				    
				    /**每页显示的记录数**/
				    pageSize: 20,
				    
	                /**grid 的sql from 语句**/
                    gridSql:
                        " from approve_postil,performance_goal goal " +
                        " where " +
                        //关联批复意见表和目标表
                        " approve_postil.goal = goal.uid"+
                        //期次初或者期次末的状态有效的目标
                        " and (getDateBatchStatus(goal.dateBatch,'begin')=true or getDateBatchStatus(goal.dateBatch,'end')=true)"+
                        //如果当前用户有100和101角色，则取批复角色=100，且目标所属部门的直属领导是当前用户的目标
                        (${pt:hasRole(curUser,'100')} && ${pt:hasRole(curUser,'101')}?" and ( getRoleId(approveRole) = '100' or getDeptDirectLeader(goal.ownerDept)=${curUser.uid})":"")+
                        //如果当前用户没有100角色，有101角色，则取目标所属部门的直属领导是当前用户的目标
                        (!${pt:hasRole(curUser,'100')} && ${pt:hasRole(curUser,'101')}?" and getDeptDirectLeader(goal.ownerDept)= ${curUser.uid}":"")+
                        //批复人是当前用户
                        " and approveRole in (${pt:getAllRoleUidToString()})"+
                        //申请类型是指定的申请类型的目标
                        " and getItemValue(applyType) like '%selfEva'"+
                        //目标类型是指定的目标类型的目标
                        " and getItemValue(goal.goalType) = '"+goalType+"'"+//目标类型
                        //不是申请阶段
                        " and phaseNo != 1"+
                        //批复时间
                        (finishStatus=="yes"?" and approveTime is not null":" and approveTime is null")
                    ,
                    
                    /**查询条件*/
                    queryClause: '1=2',
                    
                    /**form 的sql from 语句**/
                    formSql: 'from performance_goal', 
				    
				    /**排序字段**/
				    sort: 'goal.uid',
				    
					/**排序方式**/
			    	dir: 'asc',	

			    	/**是否单选**/
			    	singleSelect: false,
			    	
			    	/**grid高度*/
					gridHeight : (Ext.get("center").getHeight()-Ext.get("south").getHeight()-20)/2-10,

					/**弹出窗口的宽度**/
					formWidth: 600,
					
					/**弹出窗口的高度**/
					formHeight: 350,
					
					/**弹出窗口的表单项的文字标签的对齐方式**/
					labelAlign: 'right',
					
					/**gird信息项**/
					gridFields: [{
			            type: 'textfield',
			            name: 'uid',//必须有一个名称为“uid”的信息项,作为主键
			            field: 'goal.uid' ,
			            header: '主键',
			            searchable: false,
			            hidden: true
			        },{
			            type: 'textfield',
			            name: 'dateBatch',
			            field: 'getDateBatch(goal.dateBatch)' ,
			            header: '期次',
			            sortable: true,
			            searchable: true,
						hidden: ${pt:hasRole(curUser,'100')}
			        },{
			            type: 'textfield',
			            name: 'goalType',
			            field: 'getItemText(goal.goalType)' ,
			            header: '目标类型',
			            sortable: true,
			            searchable: true,
						hidden: ${pt:hasRole(curUser,'100')}
			        },{
			            type: 'textfield',
			            name: 'content',
			            field: 'goal.content' ,
			            header: '目标内容',
			            sortable: true,
			            searchable: true,
			            renderer: ${pt:hasRole(curUser,'100')}?autoHeightExtend:showTip
			        },{
                        type: 'textfield',
                        name: 'isMajor',
                        field: 'getItemText(goal.isMajor)' ,
                        header: '是否重要任务',
                        sortable: true,
                        searchable: false,
                        hidden: ${pt:hasRole(curUser,'100')}
	                },{
				        type:'textfield',
				        name:'isAddScore',
				        field: 'getItemText(goal.isAddScore)',
				        header: '申请加分',
				        sortable: true,
			            searchable: true,
						hidden: ${pt:hasRole(curUser,'100')}
			        },{
			            type: 'textfield',
			            name: 'addScoreReason',
			            field: 'goal.addScoreReason' ,
			            header: '加分理由',
			            sortable: true,
			            searchable: true,
						hidden: ${pt:hasRole(curUser,'100')}
			        },{
			            type: 'numberfield',
			            name: 'finalScore',
			            field: 'goal.finalScore' ,
			            header: '目标得分',
			            sortable: true,
			            searchable: true,
						hidden: ${pt:hasRole(curUser,'100')}
			        },{
			            type: 'textfield',
			            name: 'finishStatus',
			            field: 'getItemText(goal.finishStatus)' ,
			            header: '完成情况',
			            sortable: true,
			            searchable: true,
						hidden: ${pt:hasRole(curUser,'100')}
				    },{
			            type: 'textfield',
			            name: 'endStatus',
			            field: 'getItemText(goal.endStatus)' ,
			            header: '期次末状态',
			            sortable: true,
			            searchable: true,
						hidden: ${pt:hasRole(curUser,'100')}
			        },{
			            type: 'textfield',
			            name: 'createDept',
			            field: 'getDeptName(goal.createDept)' ,
			            header: '创建部门',
			            sortable: true,
			            searchable: true,
						hidden: ${pt:hasRole(curUser,'100')}
			        },{
			            type: 'textfield',
			            name: 'createTime',
			            field: 'goal.createTime' ,
			            header: '创建时间',
			            sortable: true,
			            searchable: true,
						hidden: ${pt:hasRole(curUser,'100')}
			        }],
					
					/**form表单信息项**/
				    formFields: [
				    {
				        xtype:'textfield',
				        fieldLabel: '主键',
				        name:'uid',
				        field: 'uid',
				        readOnly : true,
				        hidden : true
				    },{
				        xtype:'textfield',
				        fieldLabel: '所属期次',
				        name:'dateBatchText',
				        objectName: 'dateBatch.dateBatch',
				        field: 'getDateBatch(dateBatch)',
				        readOnly:true,
				        style:'background:#E6E6E6'
				    },{
				        xtype:'textfield',
				        fieldLabel: '所属期次',
				        name:'dateBatch',
				        field: 'dateBatch',
				        hidden: true
				    },{
				    	xtype: 'textarea',
				        fieldLabel: '目标内容',
				        name:'content',
				        field: 'content',
				        height:200,
				        allowBlank: false,
				        width: 400,
				        height : 100
				    }],
				    
					//new : 新增权限,info ： 查看权限,edit ：编辑权限,cancel ：取消权限，all ：所有权限
					buttons:[
						{ name : 'add_button', visible : false},
						{ name : 'query_button', visible : true},
						{ name : 'update_button', visible : false},
						{ name : 'delete_button', visible : false},
						{ name : 'search_button', visible : false},
						{ name : 'extend_search_button', visible : false},
						{ name : 'export_button', visible : false}
					]
				};			
				
				var deptLevel = Ext.decode('${ curDept.level.value}');
				
				//如果当前部门级别是1级部门，则展示协同部门
			    if(deptLevel == '1'){
					params2.formFields.push({
						xtype:'lovcombo',
				        fieldLabel: '协同部门',
				        name:'coorDeptsJson',
				        field: 'coorDeptsJson',
				        allowBlank: false,
				        codeSql: "select uid,deptName as text from basic_department where getItemValue(level)='2'"
		            });	
			    }
			
				var selfEvaGoal = new com.lxq.js.GridAndForm.BaseGridAndForm(params2);

				selfEvaGoal.initGridAndForm();
				
				var selfEvaGoalPanel = selfEvaGoal.getGridPanel();
				var tb = selfEvaGoal.getToolBar();
				
				var dateBatchUid ;
		        var ownerDeptUid ;
		        var ownerPersonUid ;
		        
				
				//添加一个按钮
				tb.insert(4,{
	           		id: this.divId+'_sbumit_button',
	           		hidden : finishStatus=='no'?false:true,
	           		xtype: 'button',
	           		text: ${pt:hasRole(curUser,'100')}?'终审':'审核',
	           		icon: '${path}/resources/extjs/examples/shared/icons/fam/add.gif',
	   				listeners: { 
	   					click: function(){
	   						var selModel = selfEvaGoalPanel.getSelectionModel();
			                if (selModel.hasSelection()) {
			                	
			                	var selected = selModel.getSelections();
			            		
		                		var opinion_tb = new Ext.Toolbar({
		                	       items: [
		                	       {
		                	      		text: '提交',
		                	      		xtype: 'button',
		                	      		icon: '${path}/resources/images/icon/accept.png',
		                				handler: function() {
		                	   				var form = signOpinionPanel.getForm();
		                	   				
		                			      	if (form.isValid()) {
		                			      		var json_uids = new Array();
		                			      		
		                			      		for(var i = 0 ; i < selected.length ; i ++){
		                			      			json_uids.push(selected[i].data.uid); 
		                			     	    }
		                			      		 
		                			            form.submit({
		                			           	    url:'${path}/goalManage/goalApproveAction!signSelfEvaOpinion.action',
		                			           	    method : 'post',
			                			           	params:{
			                			           		uid : Ext.encode(json_uids),
			     		                	        	applyType : 'selfEva'
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
		                						    	applyPerson.reloadGrid();
		                						    	selfEvaGoal.reloadGrid("goal.dateBatch="+dateBatchUid+" and goal.ownerDept="+ownerDeptUid+" and goal.ownerPerson="+ownerPersonUid);
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
					              			 },['opinionUid','content','evaluation','isAddScore','addScoreReason','finishStatusName','action','opinion']
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
				          			          height : 50,
				          			          readOnly:true,
				          			          style:'background:#E6E6E6',
				          			          hidden: selected.length>1
				                	      },{
				                	    	  xtype:'textfield',
				                	    	  fieldLabel : '完成情况', 
				                	    	  name: 'finishStatusName',
				                	          allowBlank: false,
				          			          readOnly:true,
				          				      style:'background:#E6E6E6',
				          				      hidden: selected.length>1
		          				       	 },{
				                	    	  xtype:'checkboxgroup',
				                	    	  fieldLabel : '申请加分', 
				                	    	  name: 'isAddScore',
				                	    	  anchor:'95%',
				                	    	  columns: 1 ,
				                	    	  items:[
				                	    	      {boxLabel: " ", name: 'isAddScore',inputValue: 'true'} 
				                	    	  ],
				                	    	  disabled : 'disable',
				                	    	  hidden: selected.length>1
				                	      },{
				                	    	  xtype:'textarea',
				                	          fieldLabel: '加分理由',
				                	          name: 'addScoreReason',
				                	          height:200,
				          			          allowBlank: true,
				          			          width: 400,
				          			          height : 50,
				          			          readOnly:true,
				          				      style:'background:#E6E6E6',
				          				      hidden: selected.length>1
				                	      },{
				                	    	  xtype:'radiogroup',
				                	    	  fieldLabel : '目标评价', 
				                	    	  name: 'evaluation',
				                	    	  anchor:'95%',
				                	    	  columns: 3 ,
				                	    	  items:[
				                	    	      {boxLabel: "满意", name: 'evaluation',inputValue: 'satisfy',checked: true},  
				                	    	      {boxLabel: "基本满意", name: 'evaluation',inputValue: 'base-satisfy'},  
				                	    		  {boxLabel: "不满意", name: 'evaluation',inputValue: 'unsatisfy'}  
				                	    	  ], 
				                	          allowBlank: false,
				                	          hidden: finishStatus=='submit'||finishStatus=='goback'?true:false
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
				                	          hidden: true
				                	      },{
				                	    	  xtype: 'textarea',
				          			          fieldLabel: '意见',
				          			          name:'opinion',
				          			          field: 'opinion',
				          			          height:200,
				          			          width: 400,
				          			          height : 80
				                	      }]
				                	    });		                		
			                		Ext.Ajax.request({
			                			url: '${path}/goalManage/goalApplyAction!getOpinions.action',
			                			method: 'POST',
			                			params:{
			                				uid : selected[0].data.uid,
			                	        	applyType : 'selfEva'
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
					                	        	applyType : 'selfEva'
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
	           		hidden : finishStatus=='no'?true:false,
	           		xtype: 'button',
	           		text: '查看意见',
	           		icon: '${path}/resources/images/icon/user_comment.png',
	   				listeners: { 
	   					click: function(){
	   						var selModel = selfEvaGoalPanel.getSelectionModel();
			                if (selModel.hasSelection()) {
			                	
			                	var selected = selModel.getSelections();
			            		
			                		var opinionWindow = new Ext.Window({
			                			modal: true,
			                			title: '查看意见',
			                			width: 680,
			                			height: 550,
			                			autoScroll:true,
			                			closeAction: 'hide'
			                		});
			                		
			                		Ext.Ajax.request({
			                			url: '${path}/goalManage/goalApplyAction!getOpinions.action',
			                			method: 'POST',
			                			params:{
			                				uid : selected[0].data.uid,
			                				applyType:'selfEva'
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
				
				tb.insert(10,'->');
				//添加一个按钮
				tb.insert(11,{
	           		id: this.divId+'_expire_button',
	           		xtype: 'button',
	           		text: '逾期清理',
	           		icon: '${path}/resources/images/icon/user_comment.png',
	   				listeners: { 
	   					click: function(){
	   						var selModel = selfEvaGoalPanel.getSelectionModel();
			                if (selModel.hasSelection()) {
                     		       Ext.MessageBox.show({
						           title: '提示',
						           msg: '确认清理吗？',
						           icon:Ext.MessageBox.QUESTION,
						           buttons:Ext.Msg.YESNO,
						           closable:true,
						           fn: function (button) {
					                     if (button == "yes") {
						                	var selected = selModel.getSelections();
						                	var json_uids = new Array();
					                			      		
			             			        for(var i = 0 ; i < selected.length ; i ++){
			             			      		json_uids.push(selected[i].data.uid); 
			             			     	}
			            			            Ext.Ajax.request({
			           			           	    url:'${path}/goalManage/goalApproveAction!cannelExprire.action',
			           			           	    method : 'post',
			            			           		params:{
			            			           			uid : Ext.encode(json_uids),
			 		                	        		applyType : 'selfEva'
			 		                				},
			           			           	    waitTitle: '请等待',
			           			           	    waitMsg : '正在提交...',
			           			               	success: function(response) {
			           						    	Ext.MessageBox.show({
			           						           title: '提示',
			           						           msg: '清理成功',
			           						           icon:Ext.MessageBox.INFO,
			           						           buttons:Ext.Msg.OK,
			           						           closable:true
			           						        });
			           						        tree_menu_panel.getRootNode().reload();
			          						        tree_menu_panel.expandAll();
			           						    	//重新加载下面gird的数据 
			           						    	applyPerson.reloadGrid();
			           								selfEvaGoal.reloadGrid("goal.dateBatch="+dateBatchUid+" and goal.ownerDept="+ownerDeptUid+" and goal.ownerPerson="+ownerPersonUid);
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
		                    }) 		
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
				//----上下型页面，上页面行点击，下页面重新加载--------------
				
				var applyPersonPanel = applyPerson.getGridPanel();
				
				//当上面grid行点击时，重新加载下面grid的数据
				applyPersonPanel.on( "rowclick" , function( gridPanel,rowIndex,e){
				
					var selModel = gridPanel.getSelectionModel();
				    if (selModel.hasSelection()) {//有选中行
				        var selected = selModel.getSelections();//获取选择的列
				        
				        dateBatchUid = selected[0].data.dateBatchUid;
				        ownerDeptUid = selected[0].data.ownerDeptUid;
				        ownerPersonUid = selected[0].data.ownerPersonUid;
				        
						//重新加载下面gird的数据
						selfEvaGoal.reloadGrid("goal.dateBatch="+dateBatchUid+" and goal.ownerDept="+ownerDeptUid+" and goal.ownerPerson="+ownerPersonUid);
					}
				})
				
		</script>
	</head>
	<body>
		<div id='${pageId}_1'></div>
		<div id='${pageId}_2'></div>
	</body>
</html>
