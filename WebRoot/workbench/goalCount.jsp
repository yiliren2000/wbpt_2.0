<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp"%>

<c:set var="entityName1" value="com.lxq.platform.goalManage.pojo.ApprovePostil"></c:set>
<c:set var="entityName2" value="com.lxq.platform.goalManage.pojo.PerformanceGoal"></c:set>
    
<html>
	<head>
		<script type="text/javascript">
			var term = '${param.term}';
			var terms = term.split("_");
			var finishStatus = 'yes';
			var goalType = terms[1];
			var applyType = terms[2];
		
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
			    actionUrl: "/goalManage/goalCountApplierAction",
				
			    /**action参数**/
			    baseParams: {applyType: applyType,goalType:goalType,finishStatus: finishStatus},
				
			    /**每页显示的记录数**/
			    pageSize: 20,
			    
			    /**排序字段**/
			    sort: 'uid',
			    
				/**排序方式**/
		    	dir: 'asc',	

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
		            field: 'dateBatch.uid' ,
		            header: '期次主键',
		            sortable: true,
		            searchable: true,
		            hidden: true
		        },{
		            type: 'textfield',
		            name: 'dateBatch',
		            field: 'dateBatch.dateBatch' ,
		            header: '期次',
		            sortable: true,
		            searchable: true
		        },{
		            type: 'textfield',
		            name: 'ownerDeptUid',
		            field: 'ownerDept.uid' ,
		            header: '执行机构',
		            sortable: true,
		            searchable: true,
		            hidden: true
		        },{
		            type: 'textfield',
		            name: 'ownerDeptName',
		            field: 'ownerDept.deptName' ,
		            header: '执行机构',
		            sortable: true,
		            searchable: true
		        },{
		            type: 'textfield',
		            name: 'ownerPersonUid',
		            field: 'ownerPerson.uid' ,
		            header: '执行人',
		            sortable: true,
		            searchable: true,
		            hidden: true
		        },{
		            type: 'textfield',
		            name: 'ownerPersonName',
		            field: 'ownePerson.userName' ,
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
				    actionUrl: "/baseAction",
					
				    /***grid查询参数**/
				    baseParams: {applyType:applyType,goalType:goalType,finishStatus: finishStatus},
				    
				    /**每页显示的记录数**/
				    pageSize: 20,
				    
				    /**grid 的sql from 语句**/
	                gridSql:
	                	" from performance_goal"+
					    " where "+
			            " (getDateBatchStatus(dateBatch,'begin')=true or getDateBatchStatus(dateBatch,'end')=true)"+
			            " and getItemValue(goalType) = '"+goalType+"'"+//目标类型
			            (applyType.search("setup")>-1?" and getItemValue(beginStatus)='pass'":" and getItemValue(endStatus)='pass'")//审批通过阶段
					,
					
					/**查询条件*/
					queryClause: '1=2',
					
	                /**form 的sql from 语句**/
	                formSql: 'from performance_goal', 

	                /**排序字段**/
				    sort: 'getItemValue(isMajor)',
				    
					/**排序方式**/
			    	dir: 'desc',	

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
			            field: 'uid' ,
			            header: '主键',
			            searchable: false,
			            hidden: true
			        },{
			            type: 'textfield',
			            name: 'dateBatch',
			            field: 'getDateBatch(dateBatch)' ,
			            header: '期次',
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
			            name: 'content',
			            field: 'content' ,
			            header: '目标内容',
			            sortable: true,
			            searchable: true,
			            renderer: showTip
			        },{
			            type: 'numberfield',
			            name: 'finalScore',
			            field: 'finalScore' ,
			            header: '目标得分',
			            sortable: true
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
			            name: 'createDept',
			            field: 'getDeptName(createDept)' ,
			            header: '创建部门',
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
			            name: 'remark',
			            field: 'remark' ,
			            header: '备注',
			            sortable: true,
			            searchable: true
			        }],
					
				/**form表单信息项**/
			    formFields: [
	            ],
				    
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
				
				var setupCountGoal = new com.lxq.js.GridAndForm.BaseGridAndForm(params2);

				setupCountGoal.initGridAndForm();
				
				var setupCountGoalPanel = setupCountGoal.getGridPanel();
				var tb = setupCountGoal.getToolBar();
				
				var dateBatchUid ;
		        var ownerDeptUid ;
		        var ownerPersonUid ;
		        
				
				//添加一个按钮
				tb.insert(4,{
	           		id: this.divId+'_view-opinion_button',
	           		hidden : finishStatus=='no'?true:false,
	           		xtype: 'button',
	           		text: '查看意见',
	           		icon: '${path}/resources/images/icon/user_comment.png',
	   				listeners: { 
	   					click: function(){
	   						var selModel = setupCountGoalPanel.getSelectionModel();
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
			                				applyType:applyType
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
						setupCountGoal.reloadGrid("dateBatch="+dateBatchUid+" and ownerDept="+ownerDeptUid+" and ownerPerson="+ownerPersonUid);
					}
				})
				
		</script>
	</head>
	<body>
		<div id='${pageId}_1'></div>
		<div id='${pageId}_2'></div>
	</body>
</html>
