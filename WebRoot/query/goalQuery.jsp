<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp"%>

<c:set var="entityName" value="com.lxq.platform.goalManage.pojo.PerformanceGoal"></c:set>
    
<html>
	<head>
		<script type="text/javascript">
			var params = {		
			    /**panel渲染元素**/
				divId : '${pageId}',
				
			    /**项目名称**/
			    path: '${path}',
			
				/**导出文件的名称**/
				fileName: '部门目标查询',

			    /**弹出窗口标题**/
			    title: "部门目标查询",
				
			    /**实体对象名称**/
			    entityName: '${entityName}',
				
			    /**action地址**/
			    actionUrl: "/goalManage/goalQuery",
				
			    /**grid查询参数*/
			    baseParams: {goalType:'dept'},
			    
			    /**每页显示的记录数**/
			    pageSize: 20,
			    
			    /**排序字段**/
			    sort: 'uid',
			    
				/**排序方式**/
		    	dir: 'asc',	
				
		    	/**grid高度*/
				gridHeight : Ext.get("center").getHeight()-Ext.get("south").getHeight()-20,

				/**弹出窗口的宽度**/
				formWidth: 600,
				
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
		            type: 'combo',
		            name: 'dateBatch',
		            field: 'dateBatch.dateBatch' ,
		            header: '期次',
		            sortable: true,
		            searchable: true,
		            codeSql: 'select dateBatch,dateBatch from DateBatch'
		        },{
		            type: 'combo',
		            name: 'ownerDept',
		            field: 'ownerDept.uid' ,
		            header: '部门名称',
		            sortable: true,
		            searchable: true,
		            hidden: true,
		            codeSql: ${pt:hasRole(curUser,'102')}?"select uid,deptName from Department where level.value='2'":"select uid,deptName from Department where parentDept.uid= ${curDept.uid} or uid= ${curDept.uid}"
		        },{
		            type: 'textfield',
		            name: 'ownerDept',
		            field: 'ownerDept.deptName' ,
		            header: '部门名称',
		            sortable: true,
		            searchable: false
		        },{
		            type: 'textfield',
		            name: 'content',
		            field: 'content' ,
		            header: '目标内容',
		            sortable: true,
		            searchable: false,
		            showTip: true
		        },{
		            type: 'textfield',
		            name: 'finalScore',
		            field: 'finalScore' ,
		            header: '目标得分',
		            sortable: true,
		            searchable: false
		        },{
		            type: 'textfield',
		            name: 'createTime',
		            field: 'createTime' ,
		            header: '创建时间',
		            sortable: true,
		            searchable: false
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
			        name:'dateBatch',
			        field: 'dateBatch.dateBatch',
			        allowBlank: false
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
			        xtype:'numberfield',
			        fieldLabel: '最终得分',
			        name:'finalScore',
			        field: 'finalScore',
			        allowBlank: false
			    },{
			        xtype:'textfield',
			        fieldLabel: '执行部门',
			        name:'ownerDept',
			        field: 'ownerDept.uid',
			        allowBlank: false
			    },{
			        xtype:'textfield',
			        fieldLabel: '执行人',
			        name:'ownerPerson',
			        field: 'ownerPerson.uid',
			        allowBlank: false
			    },{
			        xtype:'textfield',
			        fieldLabel: '创建日期',
			        name:'createTime',
			        field: 'createTime',
			        allowBlank: false
			    }],
			    
				//new : 新增权限,info ： 查看权限,edit ：编辑权限,cancel ：取消权限，all ：所有权限
				buttons:[
					{ name : 'add_button', visible : false},
					{ name : 'query_button', visible : true},
					{ name : 'update_button', visible : false},
					{ name : 'delete_button', visible : false},
					{ name : 'export_button', visible : false}
				]
			};
			
			var goalQuery = new com.lxq.js.GridAndForm.BaseGridAndForm(params);
			goalQuery.initGridAndForm();
			var goalQueryPanel = goalQuery.getGridPanel();
			var tb = goalQuery.getToolBar();
			
			//添加一个按钮
			tb.insert(4,{
           		id: this.divId+'_view-opinion_button',
           		xtype: 'button',
           		text: '查看意见',
           		icon: '${path}/resources/images/icon/user_comment.png',
   				listeners: { 
   					click: function(){
   						var selModel = goalQueryPanel.getSelectionModel();
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
		                	        	applyType : 'selfEva'
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
			
		</script>
	</head>
	<body>
		<div id='${pageId}'></div>
	</body>
</html>
