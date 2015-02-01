<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/platformTags.tld" prefix="pt" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>    
<html>
<head>
<title>系统主页面</title>

<link rel="stylesheet" type="text/css" href="${path}/resources/extjs/resources/css/ext-all.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/extjs/examples/shared/examples.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/ext-patch.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/Ext.ux.form.LovCombo.css" />
<script type="text/javascript" src="${path}/resources/extjs/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="${path}/resources/extjs/states.js"></script>
<script type="text/javascript" src="${path}/resources/extjs/ext-all-debug.js"></script>
<script type="text/javascript" src="${path}/resources/extjs/examples/shared/examples.js"></script>
<script type="text/javascript" src="${path}/resources/extjs/src/locale/ext-lang-zh_CN.js"></script>
<script type="text/javascript" src="${path}/resources/js/common.js"></script> 
<script type="text/javascript" src="${path}/resources/js/project.js"></script> 
<script type="text/javascript" src="${path}/resources/js/marquee.js"></script> 
<script type="text/javascript" src="${path}/resources/js/baseGridAndForm.js"></script> 
<script type="text/javascript" src="${path}/resources/extjs/query-plugin.js"></script> 
<script type="text/javascript" src="${path}/resources/extjs/comboxtree.js"></script> 
<script type="text/javascript" src="${path}/resources/extjs/querytree.js"></script> 
<script type="text/javascript" src="${path}/resources/extjs/Ext.ux.form.LovCombo.js"></script>
<script type="text/javascript" src="${path}/resources/extjs/Ext.ux.MonthPickerPlugin.js"></script>

<!--获取任务条数-->
<script type="text/javascript" src="${path}/systemManage/workbenchAction!getTaskNum.action"></script> 

<!--系统通知-->
<script type="text/javascript" src="${path}/systemManage/noticeAction!showNotice.action"></script>

<style type="text/css">
	#header_top {
		height: 40;
		font-size: 20px;
	    color: #ffffff;
	    font-weight: normal;
	    padding: 5px 10px;
		background: #7F99BE url(${path}/resources/extjs/examples/layout-browser/images/layout-browser-hd-bg.gif) repeat-x center;
	}
	h1 {
		font-size:17;
		color: #ffffff;
	}
	.x-date-middle {
	    width: 250px;
	}
	.ext-webkit table.x-date-inner {
		width: 250px;
	}
	.x-date-inner a {
	    font: 13px arial,helvetica,tahoma,sans-serif;
	}
	.x-panel-mc {
	    font: 13px tahoma,arial,helvetica,sans-serif;
	}
	
	a{color:#1e3b72;font-size:14px}
	a:link {TEXT-DECORATION:none}
	a:hover{TEXT-DECORATION:underline}
	.ux-lovcombo-icon { 
	    width:16px; 
	    height:16px; 
	    float:left; 
	    background-position: -1px -1px ! important; 
	    background-repeat:no-repeat ! important; R
	} 
	.ux-lovcombo-icon-checked { 
	    background: transparent url(${path}/resources/extjs/resources/images/default/menu/checked.gif); 
	} 
	.ux-lovcombo-icon-unchecked { 
	    background: transparent url(${path}/resources/extjs/resources/images/default/menu/unchecked.gif); 
	}
</style>

<script type="text/javascript">
	Ext.apply(Ext.form.VTypes, {
	
	    password : function(val, field) {
	        if (field.newPassField) {
	            var pwd = Ext.getCmp(field.newPassField);
	            return (val == pwd.getValue());
	        }
	        return true;
	    },
	
	    passwordText : '两次输入的密码不一致！'
	});

	var passwd_tb = new Ext.Toolbar({
       items: [
       {//创建“保存”按钮
      		text: '保存',
      		xtype: 'button',
      		icon: '${path}/resources/extjs/examples/shared/icons/save.gif',
			handler: function() {
   				var form = passwdPanel.getForm();
    							
		      	if (form.isValid()) {
		      		var newPass = Ext.getCmp("newPass").getValue();
		      		var confirmPass = Ext.getCmp("confirmPass").getValue();
		      		var json_object = Ext.encode({'newPass' : newPass,'confirmPass' : confirmPass});
		            
		            form.submit({
		           	    url:'${path}/userManage/userAction!modifyPass.action',
		           	    params: {
					        jsonObject : json_object
					    }, 
		           	    method : 'post',
		           	    waitTitle: '请等待',
		           	    waitMsg : '正在提交...',
		               	success: function(form, action) {
					    	Ext.MessageBox.show({
					           title: '提示',
					           msg: '密码修改成功',
					           icon:Ext.MessageBox.INFO,
					           buttons:Ext.Msg.OK,
					           closable:true,
					           fn: passwdWindow.hide()
					        });
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
	      	passwdWindow.hide();
        }
      	}
      ]
	});
		
	var passwdPanel = new Ext.FormPanel({
      frame: true,
      bodyStyle:'padding:5px 5px 0',
      defaults: {
        inputType: 'password'
      },
      defaultType: 'textfield',
      items: [{
          fieldLabel: '密码',
          name: 'newPass',
          id: 'newPass',
          vtype: 'password',
          oldPassField: 'oldPass',
          allowBlank : false,
          blankText : '密码不能为空',
          minLength:6,
          minLengthText:'密码长度最少6位！',
          maxLength:20,
          maxLengthText:'密码长度最多20位！'
      },{
          fieldLabel: '确认密码',
          name: 'confirmPass',
          id: 'confirmPass',
          vtype: 'password',
          newPassField: 'newPass',
          allowBlank : false,
          blankText : '确认密码不能为空',
          minLength:6,
          minLengthText:'密码长度最少6位！',
          maxLength:20,
          maxLengthText:'密码长度最多20位！'
      }]
    });
    
	/**创建新增表单窗口**/
	var passwdWindow = new Ext.Window({
		modal: true,
		title: '修改密码',
		width: 350,
		height: 200,
		autoScroll:true,
		tbar: ['->',passwd_tb],
		closeAction: 'hide',
		items: [passwdPanel]
	});

    var menu_json = Ext.decode('${userMenus}');
    
    Ext.onReady(function(){
    
    	Ext.BLANK_IMAGE_URL = '${path}/resources/extjs/resources/images/default/tree/s.gif';
        Ext.state.Manager.setProvider(new Ext.state.CookieProvider());
        Ext.QuickTips.init();
        
		var header_top = new Ext.Toolbar({
			id: 'header_top',
            height: 40, //组件高度
            items: [
                {
                	id: 'system_title',
                    xtype: 'tbtext',
                    text: '<h1>WEB系统平台</h1>'
                },
            	'->',
            	{
            		//主页面
            		xtype: 'button',
            		text: '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;',
            		icon: '${path}/resources/images/icon/icon_home.gif',
    				listeners: { 
    					click: function(){
    						window.location.href='${path}/main.jsp'
    					}
    				}	
            	},
            	{
            		//修改密码
            		xtype: 'button',
            		text: '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;',
            		icon: '${path}/resources/images/icon/icon_key.gif',
    				listeners: { 
    					click: function(){
    						passwdWindow.show();
    					}
    				}	
            	},
            	{
            		//刷新
            		text: '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;',
            		xtype: 'button',
            		icon: '${path}/resources/images/icon/icon_refresh.gif',
    				listeners: {
    					click: function(){
   							Ext.Ajax.request({
							    url : '${path}'+'/login!refreshUserCache.action',
							    method : 'post',
							    success : function(response, options) {
							    	Ext.MessageBox.show({
							           title: '提示',
							           msg: '刷新成功',
							           icon:Ext.MessageBox.INFO,
							           buttons:Ext.Msg.OK,
							           closable:true
							        });
							    },
							    failure : function() {
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
            	{
            		//帮助
            		text: '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;',
            		xtype: 'button',
            		icon: '${path}/resources/images/icon/icon_help.gif',
    				listeners: {
    					click: function(){
    						window.open('${path}/help.jsp');
    					}
    				}	
            	},
            	{
            		xtype: 'button',
            		text: '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;',
            		icon: '${path}/resources/images/icon/icon_signout.gif',
    				listeners: { 
    					click: function(){
    						window.location.href='${path}/logout!logout.action'
    					}
    				}	
            	}
            ]
        });   
        
        var header_bottom = new Ext.Toolbar({
 			id: 'bottom_panel',
            height: 40, //组件高度
   		    items: menu_json
		});
		
		addEvent = function (menu){
			var tabPanel;
			var childMenus = menu.menu;
			if(typeof(childMenus) == 'undefined' || childMenus.length == 0){
							
				Ext.getCmp(menu.id).on({
					'click': function(item , e){
						
						var tab = Ext.getCmp('menu_'+menu.id);
				      	if (tab) {//如果标签页已经打开则激活
							center_panel.setActiveTab(tab);
				      		return;
				      	}
						
						var url = item.url;
						
						//有url
						if(typeof(url) != 'undefined' && url.length != 0){
							
							//如果展示树，则打开url树，否则打开一个url标签页面
							if(item.showTree == true){
								
							    var tree_content_panel = new Ext.Panel({
							    	title: item.text,
							    	region: 'center'
								}); 
						        
						        var tree_menu_panel = new Ext.tree.TreePanel({
						        	id: item.id+'_tree_menu_panel',
						        	width: 225,
						            region: 'west',
						        	title: item.text,
						        	autoScroll: true,
						            split: true,
						            collapsible : true,
							        rootVisible: false,
									root: new Ext.tree.AsyncTreeNode({
										id: 'root',
							            expanded: true
							        }),
							        listeners: {
							        	 load:function(node){
							        		 if(node.id == 'root'){
										        
										        var url = node.firstChild.attributes.url;
										        if(url.length>0){
									        		var tabId = 'menu_'+menu.id+'_'+node.firstChild.attributes.id;
											        var tabTitle = node.firstChild.attributes.text;
											        var jsonObject = node.firstChild.attributes.jsonObject;
											        showContent(tree_content_panel,item.text+'->'+tabTitle,'${path}'+url+'?treeId='+item.id+'_tree_menu_panel&nodeId='+node.firstChild.attributes.id+'&jsonObject='+jsonObject);
										        }
							        		 }
							        	 },
							        	//打开标签页面 
							        	'click': function(n){
									        var url = n.attributes.url;
									        if(url.length>0){
										       	var tabId = 'menu_'+menu.id+'_'+n.attributes.id;
										        var tabTitle = n.attributes.text;
										        var jsonObject = n.attributes.jsonObject;
										        showContent(tree_content_panel,item.text+'->'+tabTitle,'${path}'+url+'?treeId='+item.id+'_tree_menu_panel&nodeId='+n.attributes.id+'&jsonObject='+jsonObject);
									        }
								  		},
								  		//加载树
								  		'beforeload': function(node){
								           this.loader.dataUrl = url.indexOf("?")>-1?'${path}'+url+'&uid=' + node.id:'${path}'+url+'?uid=' + node.id;
						            	}
						            }
								});
						        
						        tree_menu_panel.expandAll();
						        
						        tabPanel = {
						        	id: 'menu_'+menu.id,
						            title: item.text,
					                closable: true,
					                layout: 'border',
					                items:[tree_menu_panel,tree_content_panel]
						        };
							}else{
								tabPanel = {
						        	id: 'menu_'+menu.id,
						        	url : '${path}'+url,
						            title: item.text,
					                autoScroll: true,  
					                autoWidth: true,  
					                closable: true,  
					                frame: true,
					                autoLoad: { url: '${path}'+url+"?nodeId=",scripts: true}
						        };
							}
							
							center_panel.syncSize();
					        center_panel.add(tabPanel).show();
							
					        viewport.doLayout();
						}
					}
				});
			}else{
				for(var i = 0 ; i < childMenus.length ; i++){
					addEvent(childMenus[i]);
				}
			}
		};
		
		//为menu添加点击事件
		for(var i = 0 ; i < menu_json.length ; i++){
			addEvent(menu_json[i]);
		}
		
		openTab = function (menu){
			var tabPanel;
							
			var item = menu;
			var tab = Ext.getCmp('menu_'+menu.id);
	      	if (tab) {//如果标签页已经打开则激活
				center_panel.setActiveTab(tab);
	      		return;
	      	}
			
			var url = item.url;
			
			//有url
			if(typeof(url) != 'undefined' && url.length != 0){
				
				//如果展示树，则打开url树，否则打开一个url标签页面
				if(item.showTree == true){
					
				    var tree_content_panel = new Ext.Panel({
				    	title: item.text,
				    	region: 'center'
					}); 
			        
			        var tree_menu_panel = new Ext.tree.TreePanel({
			        	id: item.id+'_tree_menu_panel',
			        	width: 225,
			            region: 'west',
			        	title: item.text,
			        	autoScroll: true,
			            split: true,
			            collapsible : true,
				        rootVisible: false,
						root: new Ext.tree.AsyncTreeNode({
							id: 'root',
				            expanded: true
				        }),
				        listeners: {
				        	 load:function(node){
				        		 if(node.id == 'root'){
							        
							        var url = node.firstChild.attributes.url;
							        if(url.length>0){
						        		var tabId = 'menu_'+menu.id+'_'+node.firstChild.attributes.id;
								        var tabTitle = node.firstChild.attributes.text;
								        var jsonObject = node.firstChild.attributes.jsonObject;
								        showContent(tree_content_panel,item.text+'->'+tabTitle,'${path}'+url+'?treeId='+item.id+'_tree_menu_panel&nodeId='+node.firstChild.attributes.id+'&jsonObject='+jsonObject);
							        }
				        		 }
				        	 },
				        	//打开标签页面 
				        	'click': function(n){
						        var url = n.attributes.url;
						        if(url.length>0){
							       	var tabId = 'menu_'+menu.id+'_'+n.attributes.id;
							        var tabTitle = n.attributes.text;
							        var jsonObject = n.attributes.jsonObject;
							        showContent(tree_content_panel,item.text+'->'+tabTitle,'${path}'+url+'?treeId='+item.id+'_tree_menu_panel&nodeId='+n.attributes.id+'&jsonObject='+jsonObject);
						        }
					  		},
					  		//加载树
					  		'beforeload': function(node){
					           this.loader.dataUrl = url.indexOf("?")>-1?'${path}'+url+'&uid=' + node.id:'${path}'+url+'?uid=' + node.id;
			            	}
			            }
					});
			        
			        tree_menu_panel.expandAll();
			        
			        tabPanel = {
			        	id: 'menu_'+menu.id,
			            title: item.text,
		                closable: true,
		                layout: 'border',
		                items:[tree_menu_panel,tree_content_panel]
			        };
				}else{
					tabPanel = {
			        	id: 'menu_'+menu.id,
			        	url : '${path}'+url,
			            title: item.text,
		                autoScroll: true,  
		                autoWidth: true,  
		                closable: true,  
		                frame: true,
		                autoLoad: { url: '${path}'+url+"?nodeId=",scripts: true}
			        };
				}
				
				center_panel.syncSize();
		        center_panel.add(tabPanel).show();
				
		        viewport.doLayout();
			}
		};
		
		var north_panel = new Ext.Panel({
            region: 'north',
            height: 80,
            items: [header_top,header_bottom]
        });

		var south_panel = new Ext.Panel({
			height: 27,
			id:'south',
            region: 'south',
            title: '当前机构：${curDept.deptName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+
            	   '当前用户：${curUser.userName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+
            	   '登录时间：${loginTime}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+
            	   '当前在线人数：${fn:length(onlineList)}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;',
            margins: '0 0 0 0'//上下左右边缘宽度
        });
		
		var workbench = {
            title: '工作台',
            autoScroll: true,
            layout: 'border',
            items: [
				{
					region:"east",
					width:250,
		            layout: 'form',
		            items: [
		            	new Ext.DatePicker({//日历
		            		
				        }),
		            	{title:'系统通知',height:800,contentEl:'notice',bodyStyle:'background:#dae7f6;padding:8px 8px 0'}
		            ]
				},  
				{
					region:"center",
		            items:[ {
		                xtype:'tabpanel',
		                id: 'center_tabpanel',
		            	activeTab: 0,
		                items:[
							{
								title: '当前工作',
									bodyStyle:'background:#dae7f6;padding:20px 10px 10px 20px',
									height:sScreenHeight,
								html: 
									'<p>制定申请</p><p>'+
									'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onclick=openTab(Ext.getCmp("15"))>待提交的目标&nbsp;&nbsp;&nbsp;&nbsp;'+(typeof(taskNum.setupApply.submit)=='undefined'?0:taskNum.setupApply.submit)+'件</a></p><p>'+
									'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onclick=openTab(Ext.getCmp("15"))>被退回的目标&nbsp;&nbsp;&nbsp;&nbsp;'+(typeof(taskNum.setupApply.goback)=='undefined'?0:taskNum.setupApply.goback)+'件</a></p><p>'+
								    '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onclick=openTab(Ext.getCmp("23"))>待审核的目标&nbsp;&nbsp;&nbsp;&nbsp;'+(typeof(taskNum.setupApprove.submit)=='undefined'?0:taskNum.setupApprove.submit)+'件</a></p>'+
									'<p>评价申请</p><p>'+
									'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onclick=openTab(Ext.getCmp("15"))>待提交的目标&nbsp;&nbsp;&nbsp;&nbsp;'+(typeof(taskNum.selfEvaApply.submit)=='undefined'?0:taskNum.selfEvaApply.submit)+'件</a></p><p>'+
									'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onclick=openTab(Ext.getCmp("15"))>被退回的目标&nbsp;&nbsp;&nbsp;&nbsp;'+(typeof(taskNum.selfEvaApply.goback)=='undefined'?0:taskNum.selfEvaApply.goback)+'件</a></p><p>'+
								    '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onclick=openTab(Ext.getCmp("23"))>待审核的目标&nbsp;&nbsp;&nbsp;&nbsp;'+(typeof(taskNum.selfEvaApprove.submit)=='undefined'?0:taskNum.selfEvaApprove.submit)+'件</a></p>'
							}
		                ]
		            }]
				} 
			]
		}

        var center_panel = new Ext.TabPanel({
        	id: 'center',
            region: 'center',
            deferredRender: false,
            activeTab: 0,
            items: [workbench]
        });
        
		function showContent(tree_content_panel,tabTitle,url){
			
			tree_content_panel.setTitle(tabTitle);
			tree_content_panel.load({
			    url: url+"&"+new Date(),
			    scripts: true
			});
		}
        var viewport = new Ext.Viewport({
        	id: 'viewport',
            layout: 'border',
	        suspendLayout: true,
            items: [north_panel, south_panel,center_panel]
        });
        
		//定义一个id为tabpanel的TabPanel  
		Ext.getCmp('center_tabpanel').strip.dom.onmousemove = function(e) {  
			e = Ext.EventObject;  
			var t = Ext.getCmp('center_tabpanel');  
			var s = Ext.getCmp('center_tabpanel').strip;  
			var iel = e.getTarget('li', s);  
			var item = null;  
			if (iel) {  
				item = t.getComponent(iel.id.split(t.idDelimiter)[1]);  
			}  
			if (item && item != t.activeTab) {  
				t.setActiveTab(item);  
			}  
		}
    });
        
    </script>
    
</head>

<body>
    <div id="notice"></div>
</body>

<script type="text/javascript">

	function openFile(uid){
		doPost({
		    url:'${path}/systemManage/noticeAction!downloadFile.action',
		    params: {
		    	uid: uid
		   }
		});	
	}
	
	var notice_content = document.getElementById("notice");
	
	for(var i = 0 ; i < notices.length ; i ++){
		var title = notices[i].title;
		var uid = notices[i].uid;
		var filePath = notices[i].filePath;
		var publishDept = notices[i].publishDept;
		var publishPerson = notices[i].publishPerson;
	    var tag_p = document.createElement("p");//创建一个P标签 
	    if(filePath.length>0){
		    tag_p.innerHTML = "<span>"+publishPerson+"</span>：<a href='#' onclick='openFile("+uid+")'>"+title+"</a><br/>";
	    }else{
	    	tag_p.innerHTML = "<span>"+publishPerson+"</span>：<a>"+title+"</a><br/>";
	    }
		
	    notice_content.appendChild(tag_p);
	}
	
	new Marquee("notice",0,1,258,200,50,0,0);
	
	
</script>
</html>