Ext.namespace("com.lxq.js.GridAndForm");

/**创建grid和form*/
com.lxq.js.GridAndForm.BaseGridAndForm = function(params){
	
    /**树节点编号*/
    this.nodeId = params.nodeId;
    /**树pannel*/
    var treeMenuPanel = params.treeMenuPanel;
    /**展现层id*/
    this.divId = params.divId;
    /**项目路径*/
    var path = params.path;
    /**弹出窗口标题*/
    this.title = params.title;
    /**实体对象名称*/
    var entityName = params.entityName;
    /**action地址*/
    this.actionUrl = params.actionUrl;
    /**action查询参数*/
    this.baseParams = params.baseParams;
    /**每页显示的记录数*/
    var pageSize = params.pageSize;
    /**grid 的sql from 语句**/
    var gridSql = params.gridSql;
    /**form 的sql from 语句**/
    this.formSql = params.formSql;
    /**grid 的queryClause语句**/
    this.queryClause = params.queryClause;
    /**排序字段*/
    this.sort = params.sort;
	/**排序方式*/
   	this.dir = params.dir;
	/**导出文件的名称*/
	var fileName = params.fileName;
	/**grid高度*/
	var gridHeight = params.gridHeight;
	/**弹出窗口的宽度*/
	this.formWidth = params.formWidth;
	/**弹出窗口的高度*/
	this.formHeight = params.formHeight;
	/**弹出窗口的表单项的文字标签的对齐方式*/
	this.labelAlign = params.labelAlign;
	/**创建工具栏，并创建“新增”、“详情”、“编辑”、“删除”、“查询”、“高级查询”、“导出”按钮*/
	this.buttons = params.buttons;
	/**是否单选*/
	this.singleSelect = params.singleSelect;
	/**grid表单项*/
	this.gridFields = params.gridFields;
	/**form表单项*/
	var formFields = params.formFields;
	
	this.gridPanel;
	this.gridStore;
	this.newPanel;
	this.tb;
	//------创建所需方法-------------------------------------------------------
	/**根据json数组中得属性和属性值，查找指定属性的属性值*/
	findArrayValue = function (array,prop, propValue,destProp){
	    var field;
	    
	    for(var i = 0 ; i < array.length ; i ++){
	        var f = array[i];
	        if(f[prop] == propValue){ 
	            field = f;
	            break;
	        } 
	    }
	    return field ? field[destProp] : '';
	}
	
	/**根据form表单元素，组装json对象*/
	getJsonObject = function (form){
		
	  	var form_fields = form.items.items;
	  
	  	var fields = new Array();
	  
	  	form.items.each(function(item,index,length){
	  		var fieldName = item.objectName?item.objectName:item.name;
			var field = {field:fieldName,value:item.getValue() instanceof Date ?Ext.util.Format.date(item.getValue(),item.format):item.getValue()};	
			fields.push(field); 	
  		});
	
		var o = new Object();
		for(var i = 0 ; i < fields.length ; i ++){
			
			if(fields[i].field.indexOf(".")>-1){
				var array = fields[i].field.split(".");
				
				addChildElement(o,0,array,fields[i].value);
				
			}else{
				o[fields[i].field] = fields[i].value;
			}					
		}
		return o;
	}
	
	/**拆分级联属性，组装json对象，如"'user.address.address1':'地址一'"----->"user:{address:{address1:'地址一'}}"*/
	addChildElement = function (parent,index,array,value){
			
		if(index == array.length-1){//最后一个属性
			parent[array[index]] = value;
		}else{
			if(typeof(parent[array[index]]) == "undefined"){
				parent[array[index]] = new Object();
			}
			addChildElement(parent[array[index]],++index,array,value);
		}
	}
	
	/**根据formFields,初始化loadFields的表单项*/
	this.initloadFields = function (formFields){

		var loadFields = new Array();
		
		for(var i = 0 ; i < formFields.length ; i ++){
			
			var fieldSets = formFields[i].items;
			
			for(var j = 0 ; j < fieldSets.length ; j ++){
				
				var fields = fieldSets[j].items;
				
				for(var k = 0 ; k < fields.length ; k ++){
					loadFields.push(fields[k]);
				}
			}
		}
		return loadFields;
	}
	
	/**根据formFields,初始化loadFields的表单项*/
	this.initloadFieldNames = function (loadFields){
		
		var loadFieldNames = new Array();
		for(var i = 0 ; i < loadFields.length ; i ++){
			loadFieldNames.push(loadFields[i].name);
		}
		return loadFieldNames;
	}
	
	/**根据formFields,初始化newPanel的表单项*/
	this.initNewFields = function (formFields){
	
		return this.copyForm('new',formFields);
	}
	
	/**根据formFields,初始化editPanel的表单项*/
	this.initEditFields = function (formFields){
	
		return this.copyForm('edit',formFields);
	}
	
	/**根据formFields,初始化infoPanel的表单项*/
	this.initInfoFields = function (formFields){
	
		return this.copyForm('info',formFields);
	}
	
	/**根据gridFields,初始化gridPanel的表单项*/
	this.initColumnModel = function (gridFields , sm){
	
		var fields = new Array(gridFields.length+2); 
		
		fields[0] = sm;
		fields[1] = new Ext.grid.RowNumberer();
		for(var i = 0 ; i < gridFields.length ; i ++){
			
			if((gridFields[i].type == 'combo' || gridFields[i].type == 'lovcombo') && typeof(gridFields[i].store) == 'undefined'){
				
				var url;
				if(gridFields[i].codeNo){
				    url = path+'/utilAction!getCodeLibrary.action?codeNo='+gridFields[i].codeNo;
				}else{
				    url = path+'/utilAction!getCodeLibraryBySql.action?codeSql='+gridFields[i].codeSql;
				}
				
				gridFields[i].store = new Ext.data.JsonStore({
					autoLoad: true,
	                fields: ['uid','text'],
				    url: url
				})        
	        }
			fields[i+2] = gridFields[i];
		}
		
		return fields;
	}
	
	/**获取查询字段*/
	getQueryFields = function (gridFields){
	
		var data = new Array();
		for(var i = 0 ; i < gridFields.length ; i++){
			if(gridFields[i].searchable != false){
				var dataField = {
					value:gridFields[i].field,
					text:gridFields[i].header,
					type:gridFields[i].type,
					store:gridFields[i].store
				};
				
				if(gridFields[i].onceLoad == true){
				    dataField.dataUrl = gridFields[i].dataUrl+'!getAllNodes.action'
				}else{
				    dataField.dataUrl = gridFields[i].dataUrl+'!getChildNodes.action'
				}
				data.push(dataField);
			}
		}
		return data;
	}
	
	/**为详情表单、编辑表单加载表单数据*/
	load4Form = function (path,actionUrl,formWindow,gridPanel,formPanel,entityName,gridFields,formSql){
		
		var selModel = gridPanel.getSelectionModel();
	    if (selModel.hasSelection()) {//有选中行
	        var selected = selModel.getSelections();//获取选择的列
	        
	        var o_whereClause = new Object();
	        for(var i = 0 ; i < gridFields.length ; i ++){
				if(gridFields[i].whereClause == true || gridFields[i].name == 'uid' || gridFields[i].name == 'id'){
					var field_name = findArrayValue(gridFields,'name', gridFields[i].name,'field');
					var field_value = selected[0].data[gridFields[i].name];
					
					o_whereClause['uid'] = field_value;
				}
			}
					        
	        var key_value = selected[0].data.uid;//获取选中的第一列，名为“uid”的属性的属性值
	        var key_name = findArrayValue(gridFields,'name', 'uid','name');//查找名为“uid”列的field属性的属性值
		    var form_fields = formPanel.getForm().items.items;//获取详情表单信息项
		   //初始化需要查询的信息项
		    var fields = new Array(); 
			for(var i = 0 ; i < form_fields.length ; i ++){
				if(typeof(form_fields[i].queryable) == 'undefined' || form_fields[i].queryable == true){
					var field = {name:form_fields[i].name,field:form_fields[i].field};
					fields.push(field);
				}
			}
			var whereClause = Ext.encode(o_whereClause);//主键的查询条件
			//加载详情表单的数据
			formPanel.getForm().load( {
	           	url : path+actionUrl+'!find.action',
	           	params : {
				    formSql: formSql,
				    fields : Ext.encode(fields),
				    whereClause : whereClause
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
			formWindow.show();//展示详情窗口
	    }else {//没有选中任一行
	   	   Ext.MessageBox.show({
	           title: '提示',
	   	       msg: '请选择一条记录',
	           icon:Ext.MessageBox.WARNING,
	           buttons:Ext.Msg.OK,
	           closable:true
	   	   });
	      }
	}
	/**提交新增表单、编辑表单*/
	submitForm = function (newOrEdit,path,actionUrl,formWindow,formPanel,entityName,keyName,store,pageSize){
	     	var form = formPanel.getForm();
	          	
	      	var json_object = Ext.encode(getJsonObject(form));
			
			if(newOrEdit=='new'){
				actionUrl = actionUrl+'!save.action';
			}else{
				actionUrl = actionUrl+'!update.action';
			}
			
	      	if (form.isValid()) {
	            form.submit({
	           	    url:path+actionUrl,
	           	    params: {
				        entityName : entityName,
				        keyName : keyName,
				        jsonObject : json_object
				    }, 
	           	    method : 'post',
	           	    waitTitle: '请等待',
	           	    waitMsg : '正在提交...',
	               	success: function(form, action) {
	               		if(treeMenuPanel){
		               		treeMenuPanel.getRootNode().reload();
							treeMenuPanel.expandAll();
				    	}
	                	store.load({ 
					        params:{
					        	start:0,
					        	limit:pageSize
					        }  
			    		});
				    	Ext.MessageBox.show({
				           title: '提示',
				           msg: '保存成功',
				           icon:Ext.MessageBox.INFO,
				           buttons:Ext.Msg.OK,
				           closable:true,
				           fn: formWindow.hide()
				        });
	       			},
	     		    failure: function(form, action) {
					    Ext.MessageBox.show({
					      title: '提示',
					      msg: action.result.msg || '系统错误',
					      icon:Ext.MessageBox.ERROR,
					      buttons:Ext.Msg.OK,
					      closable:true
					    });
		            }
	          });
	     }
	}
	
	/**设置DataIndex=name*/
	this.setDataIndex = function (gridFields){
		for(var i = 0 ; i < gridFields.length ; i ++){
			gridFields[i].dataIndex = gridFields[i].name;
		}
		return gridFields;
	}
	
	/**隐藏功能按钮*/
	this.cancelButtons = function (tb , buttons){
	
		for(var i = 0 ; i < buttons.length ; i ++){
	        if (typeof(buttons[i]) != 'undefined' && buttons[i].visible == false) {
	        
				Ext.getCmp(this.divId+'_'+buttons[i].name).setVisible(false);
	        }
		}
	}
	
	/**重组查询字段，取消隐藏字段*/
	cancelHiddenFields = function (gridFields){
	
		var fields = new Array(gridFields.length);
		
		var count = 0;
		
		for(var i = 0 ; i < gridFields.length ; i ++){
			if(gridFields[i].hidden != true){
				fields[count] = {
					name : gridFields[i].name,
					field : gridFields[i].field,
					header : gridFields[i].header
				}
				count++;
			}
		}
		return fields;
	}

	/**复制属性*/
	this.copyForm = function (newOrEdit,formFields){
		var newFormFields = Ext.decode(Ext.encode(formFields));
		
		for(var i = 0 ; i < newFormFields.length ; i ++){
			
			var fieldSets = newFormFields[i].items;
			
			for(var j = 0 ; j < fieldSets.length ; j ++){
				
				var fields = fieldSets[j].items;
				
				for(var k = 0 ; k < fields.length ; k ++){
					if(typeof(fields[k].byUse) != 'undefined' &&fields[k].byUse[newOrEdit+"_panel"] == false){
						fields[k].hidden = true;
					} else{
						this.setProperty(newOrEdit,fields[k]);
					}
				}
			}
		}
		return newFormFields;
	}
	
	/**设置属性*/
	this.setProperty = function (newOrEdit,o1){
		
		o1.id = newOrEdit+'_'+(o1.id||Ext.id());
		o1.readOnly = newOrEdit=='info'?true:o1.readOnly;
		o1.style = newOrEdit=='info'?'background:#E6E6E6':o1.style;
		
		if(o1.xtype=='combo' || o1.xtype == 'lovcombo'){
			
			o1.mode = 'local';
		    o1.typeAhead = true;
		    o1.triggerAction = 'all';
		    o1.emptyText = '请选择...';
		    o1.displayField = 'text';
		    o1.valueField = 'uid';
		    
		    var url;
		    if(o1.codeNo){
			    url = path+'/utilAction!getCodeLibrary.action?codeNo='+o1.codeNo;
			}else{
			    url = path+'/utilAction!getCodeLibraryBySql.action?codeSql='+o1.codeSql;
			}
			o1.store = new Ext.data.JsonStore({
	            autoLoad: true,
	            fields: ['uid','text'],
			    url: url
			})        
		}
		if(o1.xtype=='combotree'){
			o1.relativeField = newOrEdit+'_'+o1.relativeField;
			
			if(o1.onceLoad == true){
			    o1.dataUrl = o1.dataUrl+'!getAllNodes.action'
			}else{
			    o1.dataUrl = o1.dataUrl+'!getChildNodes.action'
			}
		}
	}    
    
	this.initGridAndForm = function(){
		
	    var actionUrl = this.actionUrl;
		var formSql = this.formSql;
		/**grid信息项*/
		var gridFields = this.setDataIndex(this.gridFields);
		/**数据存储器*/
	    var gridStore = new Ext.data.JsonStore({
	        root: 'topics',
	        totalProperty: 'totalCount',
	        idProperty: 'threadid',
	        remoteSort: true,
	        fields: gridFields,//需要获取的数据项
	        proxy: new Ext.data.HttpProxy({
	        	method:'POST',
	            url: path+actionUrl+'!jsonPage.action'
	        })
	    });
	    
	    var thisBaseParams = this.baseParams ;
	    for(var key in thisBaseParams){
	    	gridStore.baseParams[key] = thisBaseParams[key];
	    }
	    
	    gridStore.baseParams.fields = Ext.encode(gridFields);
	    gridStore.baseParams.entityName = entityName;
	    gridStore.baseParams.gridSql = gridSql;
	    
	    if(this.nodeId){
		    gridStore.baseParams.nodeId = this.nodeId;
	    }
	    
	    gridStore.setDefaultSort(this.sort, this.dir);//数据存储器，默认排序字段和方式
		
	    gridStore.load({params:{queryClause : this.queryClause,start:0, limit:pageSize}});//数据存储器，分页加载数据
	    
		this.gridStore = gridStore;
		/**创建工具栏，并创建“新增”、“详情”、“编辑”、“删除”、“查询”、“高级查询”、“导出”按钮*/
		var tb = new Ext.Toolbar({
            items: [
            	{//创建新增按钮
            		id: this.divId+'_add_button',
            		xtype: 'button',
            		text: findArrayValue(this.buttons,'name', "add_button",'text')?findArrayValue(this.buttons,'name', "add_button",'text'):'新增',
            		icon: path+'/resources/extjs/examples/shared/icons/fam/add.gif',
    				listeners: { 
    					click: function(){
    						newWindow.show();//打开新增窗口
    					}
    				}	
            	},
            	{//创建详情按钮
            		id: this.divId+'_query_button',
            		xtype: 'button',
            		text: findArrayValue(this.buttons,'name', "query_button",'text')?findArrayValue(this.buttons,'name', "query_button",'text'):'详情',
            		icon: path+'/resources/extjs/examples/shared/icons/fam/information.png',
    				listeners: {
						click: function(){
							//加载详情表单的信息项
							load4Form(path,actionUrl,infoWindow,gridPanel,infoPanel,entityName,gridFields,formSql);    						
    					}
    				}	
            	},
            	{//创建编辑按钮
            		id: this.divId+'_update_button',
            		xtype: 'button',
            		text: findArrayValue(this.buttons,'name', "update_button",'text')?findArrayValue(this.buttons,'name', "update_button",'text'):'编辑',
            		icon: path+'/resources/extjs/examples/shared/icons/fam/edit.gif',
    				listeners: { 
    					click: function(){
							//加载编辑表单的信息项
							load4Form(path,actionUrl,editWindow,gridPanel,editPanel,entityName,gridFields,formSql);    						
    					}
    				}	
            	},
            	{//创建删除按钮
            		id: this.divId+'_delete_button',
            		text: findArrayValue(this.buttons,'name', "delete_button",'text')?findArrayValue(this.buttons,'name', "delete_button",'text'):'删除',
            		xtype: 'button',
            		icon: path+'/resources/extjs/examples/shared/icons/fam/delete.gif',
    				listeners: { 
    					click: function(){
    						var selModel = gridPanel.getSelectionModel();
			                if (selModel.hasSelection()) {
			                	Ext.MessageBox.show({
							           title: '提示',
							           msg: '确认删除吗？',
							           icon:Ext.MessageBox.QUESTION,
							           buttons:Ext.Msg.YESNO,
							           closable:true,
							           fn: function (button) {
			                        if (button == "yes") {
			                            var selected = selModel.getSelections();
			
										var o_whereClause = new Object();
								        for(var i = 0 ; i < gridFields.length ; i ++){
											if(gridFields[i].whereClause == true || gridFields[i].name == 'uid' || gridFields[i].name == 'id'){
												var field_name = gridFields[i].name;
												var field_value = selected[0].data[gridFields[i].name];
												
												o_whereClause[field_name] = field_value;
											}
										}
					                	var keyName = findArrayValue(initLoadFields,'name', 'uid','field');//查找名为“uid”列的field属性的属性值
										
										Ext.Ajax.request({
										    url : path+actionUrl+'!delete.action',
										    method : 'post',
										    params : {
										       jsonObject : Ext.encode(o_whereClause),
										       entityName: entityName,
										       keyName: keyName
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
										    	}
										    	if(treeMenuPanel){
				    		               			treeMenuPanel.getRootNode().reload();
        											treeMenuPanel.expandAll();
										    	}

										        gridStore.load({ 
											        params:{
											        	start:0,
											        	limit:pageSize
											        }
											    });
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
            	},'->',
            	{//创建查询按钮
            		id: this.divId+'_search_button',
            		text: '查询',
            		xtype: 'button',
            		icon: path+'/resources/images/icon/search.gif',
    				listeners: { 
    					click: function(){
							//创建查询信息项	    					
							var data = getQueryFields(gridFields)
							//打开查询窗口	    					
							new com.lxq.js.query(gridStore,data,pageSize).openSimpleQueryWindow();				
    					}
    				}
            	},
            	{//创建高级查询按钮
            		id: this.divId+'_extend_search_button',
            		text: '高级查询',
            		xtype: 'button',
            		icon: path+'/resources/images/icon/search.gif',
    				listeners: { 
    					click: function(){
							//创建查询信息项	    					
							var data = getQueryFields(gridFields)
							//打开查询窗口	
							new com.lxq.js.query(gridStore,data,pageSize).openAdvancedQueryWindow();    					
    					}
    				}
            	},
            	{//创建导出按钮
            		id: this.divId+'_export_button',
            		text: '导出',
            		xtype: 'button',
            		icon: path+'/resources/extjs/examples/shared/icons/fam/excel.gif',
    				listeners: { 
				   		click: function(){
							var queryClause = gridStore.baseParams.queryClause?gridStore.baseParams.queryClause:'';//查询和高级查询时生成的查询条件
							var sort = gridStore.sortInfo.field;//排序字段	
							var dir = gridStore.sortInfo.direction;//排序方式	
							
							var fields = Ext.encode(cancelHiddenFields(gridFields));//列表中的列信息
							//下载excel文件,采用post提交防止乱码
							doPost({
							    url: path+actionUrl+'!export.action',
							    params: {
							       fields: fields, 
							       entityName: entityName,
							       gridSql: gridSql,
							       queryClause: queryClause, 
							       sort: sort,
							       dir: dir,
							       fileName: fileName
							   }
							});
    					}
    				}	
            	},
            	{//防止出现下拉条时，最后一个按钮显示不全
					xtype: 'tbtext',
                    text: '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
            	}
            ]
        }); 
		
		this.tb = tb;
		
		this.cancelButtons(this.tb , this.buttons);
		
		var sm = new Ext.grid.CheckboxSelectionModel({singleSelect: typeof(this.singleSelect) == 'undefined'?true:this.singleSelect});
		
		/**创建选择模式*/
	    var gridPanel = new Ext.grid.GridPanel({
	        store: gridStore,
	        disableSelection: true,
	        loadMask: true,
	        tbar: tb,
	        sm: sm,
	        height : gridHeight?gridHeight:Ext.get("center").getHeight()-Ext.get("south").getHeight()-20,
	        renderTo:this.divId,//渲染gridPanel组件到“topic-grid”元素中
	        stripeRows: true,
	        cm: new Ext.grid.ColumnModel(this.initColumnModel(gridFields,sm)),//初始化ColumnModel
	        viewConfig: {
	            emptyText: '没有记录',
	            forceFit:true,
                enableRowBody:true,
                showPreview:true
	        },
	        bbar: new Ext.PagingToolbar({//定义底部工具栏
	            pageSize: pageSize,
	            store: gridStore,
	            displayInfo: true,
	            displayMsg: '当前为第 {0} - {1}条记录&nbsp;&nbsp;&nbsp;&nbsp;共 {2}条&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;',
	            emptyMsg: "没有记录&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;",
			    buttons : [{  
			      text : "全选",  
			      handler : function() {  
			        var rsm = gridPanel.getSelectionModel();  
			        rsm.selectAll();  
			      }  
			    },{  
			      text : "反选",  
			      handler : function() {  
			        var rsm = gridPanel.getSelectionModel();  
			        for (var i = gridPanel.getView().getRows().length - 1; i >= 0; i--) {  
			          if (rsm.isSelected(i)) {  
			            rsm.deselectRow(i);  
			          } else {  
			            rsm.selectRow(i, true);  
			          }  
			        }  
			      }  
			    }]   
	        })
     
	    });

	    this.gridPanel = gridPanel;
	    
		//------创建表单工具栏,并创建“保存”、“取消”按钮--------------------------------------------------------

		var edit_tb = new Ext.Toolbar({
	        items: [
	        {//创建“保存”按钮
	       		text: '保存',
	       		xtype: 'button',
	       		icon: path+'/resources/extjs/examples/shared/icons/save.gif',
				handler: function() {
					var keyName = findArrayValue(initLoadFields,'name', 'uid','field');//查找名为“uid”列的field属性的属性值
	          		submitForm('edit',path,actionUrl,editWindow,editPanel,entityName,keyName,gridStore,pageSize);
		     	}	
	       	},
	        {//创建“取消”按钮
	       		text: '取消',
	       		xtype: 'button',
	       		icon: path+'/resources/images/icon/cancel.png',
				handler: function() {
			      	editWindow.hide();
		        }
	       	}
	       ]
		});
		var new_tb = new Ext.Toolbar({
	        items: [
	        {//创建“保存”按钮
	       		text: '保存',
	       		xtype: 'button',
	       		icon: path+'/resources/extjs/examples/shared/icons/save.gif',
				handler: function() {
					var keyName = findArrayValue(initLoadFields,'name', 'uid','field');//查找名为“uid”列的field属性的属性值
	          		submitForm('new',path,actionUrl,newWindow,newPanel,entityName,keyName,gridStore,pageSize);
		     	}	
	       	},
	        {//创建“取消”按钮
	       		text: '取消',
	       		xtype: 'button',
	       		icon: path+'/resources/images/icon/cancel.png',
				handler: function() {
			      	newWindow.hide();
		        }
	       	}
	       ]
		});

		
//------编辑表单和详情表单，需要填充数据的表单项----------------------------------

		var initLoadFields = this.initloadFields(formFields);
		var loadFieldNames = this.initloadFieldNames(this.initloadFields(formFields));
//------创建新增表单和窗口-------------------------------------------------------

		/**创建新增表单*/
		var newPanel = new Ext.FormPanel({
		    labelAlign: this.labelAlign,
		    frame:true,
		    bodyStyle:'padding:5px 5px 0',
		    autoScroll: true,
		    items: this.initNewFields(formFields)
		});
		
		this.newPanel = newPanel;
		/**创建新增表单窗口*/
		var newWindow = new Ext.Window({
			modal: true,
			title: this.title+'--新增',
			width: this.formWidth,
			height: this.formHeight,
			autoScroll:true,
			tbar: ['->',new_tb],
			closeAction: 'hide',
			items: [newPanel]
		});
		
//------创建编辑表单和窗口-------------------------------------------------------

		/**创建编辑表单*/
		var editPanel = new Ext.FormPanel({
		    labelAlign: this.labelAlign,
		    frame:true,
		    bodyStyle:'padding:5px 5px 0',
		    autoScroll: true,
		    reader: new Ext.data.JsonReader
		    (
			    {
					successProperty: 'success',
					root: 'info'
				},
				loadFieldNames
			),
		    items: this.initEditFields(formFields)
		});
		
		/**创建编辑表单窗口*/
		var editWindow = new Ext.Window({
			modal: true,
			title: this.title+'--编辑',
			width: this.formWidth,
			height: this.formHeight,
			autoScroll:true,
			tbar: ['->',edit_tb],
			closeAction: 'hide',
			items: [editPanel]
		});

//------创建详情表单和窗口-------------------------------------------------------

		/**创建详情表单*/
		var infoPanel = new Ext.FormPanel({
		    labelAlign: this.labelAlign,
		    frame:true,
		    bodyStyle:'padding:5px 5px 0',
		    autoScroll: true,
		    reader: new Ext.data.JsonReader({
				successProperty: 'success',
				root: 'info'
			},loadFieldNames
			),
			items:this.initInfoFields(formFields)
		});
		
		/**创建详情表单窗口*/
		var infoWindow = new Ext.Window({
			modal: true,
			title: this.title+'--详细信息',
			width: this.formWidth,
			height: this.formHeight,
			autoScroll:true,
			closeAction: 'hide',
			items: [infoPanel]
		});
	};
	/**重新加载grid数据*/
	this.reloadGrid = function(queryClause){
		this.gridStore.baseParams.queryClause=queryClause;
		this.gridStore.load({ 
	        params:{
	        	start:0,
	        	limit:pageSize
	        }  
	    });
	};
	
	/**获取gridpanel组件*/
	this.getGridPanel = function(){
		return this.gridPanel;
	}
	
	/**获取newpanel组件*/
	this.getNewPanel = function(){
		return this.newPanel;
	}
	
	/**获取GridStore组件*/
	this.getGridStore = function(){
		return this.gridStore;
	}
	
	/**获取ToolsBar组件*/
	this.getToolBar = function(){
		return this.tb;
	}
}