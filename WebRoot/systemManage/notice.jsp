<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/header.jsp"%>
<c:set var="entityName" value="com.lxq.platform.systemManage.pojo.Notice"></c:set>
<html>
	<head>
		<script type="text/javascript">
		
			var nextMonth = new Date();
			
			nextMonth.setMonth(nextMonth.getMonth()+1);
			
			var params = {
							
			    /**panel渲染元素**/
				divId : '${pageId}',
				
			    /**项目名称**/
			    path: '${path}',
			
				/**导出文件的名称**/
				fileName: '系统通知',
                
                /**实体对象名称**/
                entityName: "${entityName}",
                
			    /**弹出窗口标题**/
			    title: "系统通知",
				
			    /**action地址**/
			    actionUrl: "/systemManage/noticeAction",
				
			    /**每页显示的记录数**/
			    pageSize: 20,
			    
                /**grid 的sql from 语句**/
                gridSql: 'from basic_notice', 
                
                /**form 的sql from 语句**/
                formSql: 'from basic_notice', 
                
			    /**排序字段**/
			    sort: 'uid',
			    
				/**排序方式**/
		    	dir: 'asc',	
				
				/**弹出窗口的宽度**/
				formWidth: 600,
				
				/**弹出窗口的高度**/
				formHeight: 300,
				
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
		            name: 'title',
		            field: 'title' ,
		            header: '消息内容',
		            sortable: false,
		            searchable: true
		        },{
		            type: 'textfield',
		            name: 'noticeDeptsJson',
		            field: 'noticeDeptsJson' ,
		            header: '通知部门',
		            sortable: true,
		            searchable: true
		        },{
		        
	        	 	type: 'textfield',
		            name: 'filePath',
		            field: 'filePath',
		            header: '附件名称',
		            sortable: false,
		            searchable: false
		        },{
	        	 	type: 'textfield',
		            name: 'startDate',
		            field: 'startDate' ,
		            header: '消息开始日期',
		            sortable: false,
		            searchable: true
		        },{
		            type: 'datefield',
		            name: 'endDate',
		            field: 'endDate' ,
		            header: '消息结束日期',
		            sortable: false,
		            searchable: true
		        },{
		            type: 'datefield',
		            name: 'createDate',
		            field: 'createDate' ,
		            header: '创建日期',
		            sortable: false,
		            searchable: true
		        }],
				
				/**form表单信息项**/
			    formFields: [{
			        xtype:'textfield',
			        fieldLabel: '主键',
			        name:'uid',
			        field: 'uid',        
			        readOnly : true,
			        hidden : true
			    },{
			        xtype: 'textarea',
			        fieldLabel: '消息内容',
			        name:'title',
			        field: 'title',
			        height:200,
			        allowBlank: false,
			        maxLength: 10,
			        width: 400,
			        height : 100,
			        maxLength:50,//最多字符设置
             		maxLengthText:'最多可输入50个字符'      //当输入大于最多字符设置时，提示信息
		        },{
					xtype:'lovcombo',
			        fieldLabel: '通知部门',
			        name:'noticeDeptsJson',
			        field: 'noticeDeptsJson',
			        codeSql: "select uid,deptName as text from basic_department where parentDept = ${curDept.uid}"
			    },{
			        xtype:'datefield',
			        fieldLabel: '消息开始日期',
			        name:'startDate',
			        field: 'startDate',
			        value: new Date(),
			        minValue: new Date(),
			        format: 'Y-m-d'
			    },{
			        xtype:'datefield',
			        fieldLabel: '消息结束日期',
			        name:'endDate',
			        field: 'endDate',
			        value: nextMonth,
			        minValue: new Date(),
			        format: 'Y-m-d'
		        },{
			        xtype:'textfield',
			        fieldLabel: '发布人',
			        name:'publishPerson',
			        objectName: 'publishPerson.uid',
			        field: 'publishPerson',
			        value: '${curUser.uid}',
			        hidden: true
		        },{
			        xtype:'datefield',
			        fieldLabel: '发布时间',
			        name:'createDate',
			        field: 'createDate',
			        value: new Date(),
			        format: 'Y-m-d',
			        hidden: true
                }],
			    
				buttons:[
					{ name : 'add_button', visible : true},
					{ name : 'query_button', visible : false},
					{ name : 'update_button', visible : true},
					{ name : 'delete_button', visible : true},
					{ name : 'search_button', visible : true},
					{ name : 'extend_search_button', visible : false},
					{ name : 'export_button', visible : false}  
				]
			};			
			
			var notice = new com.lxq.js.GridAndForm.BaseGridAndForm(params);

			notice.initGridAndForm();
			
			var noticePanel = notice.getGridPanel();
			var tb = notice.getToolBar();

			//添加一个按钮
			tb.insert(4,{
           		id: this.divId+'_upload_button',
           		xtype: 'button',
           		text: '上传附件',
           		icon: '${path}/resources/images/icon/arrow-up.gif',
   				listeners: { 
   					click: function(){
   						var selModel = noticePanel.getSelectionModel();
		                if (selModel.hasSelection()) {
		                	
		                	var selected = selModel.getSelections();//获取选择的列
		                	
		                	var form = new Ext.form.FormPanel({
		                        baseCls: 'x-plain',
		                        labelWidth: 80,
		                        url:'${path}/systemManage/noticeAction!upload.action',
		                        fileUpload:true,

		                        items: [{
		                            xtype: 'hidden',
		                            name:'uid',
		                            value:selected[0].data.uid
		                        },{
		                            xtype: 'hidden',
		                            name:'saveDir',
		                            value:'/WEB-INF/data/notice'
		                        },{
		                            xtype: 'textfield',
		                            fieldLabel: '文件名',
		                            name: 'upload',
		                            inputType: 'file',
		                            allowBlank: false,
		                            blankText: '请选择文件'
		                        }]
		                   	});
		                    var win = new Ext.Window({
		                        title: '文件上传',
		                        width: 350,
		                        height:100,
		                        plain:true,
		                        bodyStyle:'padding:5px;',
		                        buttonAlign:'center',
		                        items: [form],
		                        buttons: [{
		                            text: '上传',
		                            handler: function() {
		                                if(form.form.isValid()){
		                                    Ext.MessageBox.show({
		                                           title: '请等待',
		                                           msg: '上传中...',
		                                           progressText: '',
		                                           width:300,
		                                           progress:true,
		                                           closable:false,
		                                           animEl: 'loding'
		                                       });
		                                    form.getForm().submit({
		                                    
		                                        success: function(form, action){
		                                           Ext.MessageBox.show({
		                					           title: '提示',
		                					           msg: '上传成功',
		                					           icon:Ext.MessageBox.INFO,
		                					           buttons:Ext.Msg.OK,
		                					           closable:true,
		                					           fn: win.hide()
		                				           }); 
		                                           
		                                           notice.reloadGrid();
		                                        },    
		                                       failure: function(form, action){    
		                	                         Ext.MessageBox.show({
		                							     title: '提示',
		                							     msg: '上传失败',
		                							     icon:Ext.MessageBox.ERROR,
		                							     buttons:Ext.Msg.OK,
		                							     closable:true
		                						    });    
		                                       }
		                                    })               
		                                }
		                           }
		                        },{
		                            text: '关闭',
		                            handler:function(){win.hide();}
		                        }]
		                    }).show();
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
			},{
           		id: this.divId+'_view_button',
           		xtype: 'button',
           		text: '查看附件',
           		icon: '${path}/resources/images/icon/arrow-down.gif',
   				listeners: { 
   					click: function(){
   						var selModel = noticePanel.getSelectionModel();
		                if (selModel.hasSelection()) {
		                	var selected = selModel.getSelections();//获取选择的列
		                	
		                	if(selected[0].data.filePath){
			                	doPost({
								    url:'${path}/systemManage/noticeAction!downloadFile.action',
								    params: {
								    	uid:selected[0].data.uid
								   }
								});		                	
		                	}else{
		                		Ext.MessageBox.show({
	                               title: '提示',
	                               msg: '本通知暂无附件',
	                               icon:Ext.MessageBox.WARNING,
	                               buttons:Ext.Msg.OK,
	                               closable:true
	                            });
		                	}
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
