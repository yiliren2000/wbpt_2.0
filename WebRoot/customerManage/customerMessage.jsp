<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp"%>
<%@ taglib uri="/WEB-INF/platformTags.tld" prefix="pt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<c:set var="entityName" value="com.lxq.platform.customerManage.pojo.CustomerMessage"></c:set>
<c:set var="entityName2" value="com.lxq.platform.customerManage.pojo.ChooseCondition"></c:set>
    
<html>
    <head>
        <script type="text/javascript">
            var params = {
                            
                /**panel渲染元素**/
                divId : '${pageId}_1',
                
                gridHeight : (Ext.get("center").getHeight()-Ext.get("south").getHeight()-20)/2+20,
                
                /**项目名称**/
                path: '${path}',
            
                /**导出文件的名称**/
                fileName: '客户信息列表',

                /**弹出窗口标题**/
                title: "系统客户信息",
                
                /**实体对象名称**/
                entityName: '${entityName}',
                
                /**action地址**/
                 actionUrl: "/baseAction",
                
                /**每页显示的记录数**/
                pageSize: 15,
                
                /**grid 的sql from 语句**/
                gridSql: 'from customer_message', 
                
                /**form 的sql from 语句**/
                formSql: 'from customer_message', 
                
                /**查询条件**/
                queryClause: '1=2',
                
                /**排序字段**/
                sort: 'customerNo',
                
                /**排序方式**/
                dir: 'asc', 
                
                /**弹出窗口的宽度**/
                formWidth: 700,
                
                /**弹出窗口的高度**/
                formHeight: 400,
                
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
                    name: 'customerNo',
                    field: 'customerNo',
                    header: '客户编号',
                    sortable: true,
                    searchable: true
                },{
                    type: 'textfield',
                    name: 'name',
                    field: 'name',
                    header: '客户姓名',
                    sortable: true,
                    searchable: true
                },{
                    type: 'combo',
                    name: 'gender',
                    field: 'getItemText(gender)',
                    header: '客户性别',
                    sortable: true,
                    searchable: true,
                    codeNo:'gender'
                },{
                    type: 'textfield',
                    name: 'phone',
                    field: 'phone',
                    header: '联系电话',
                    sortable: true,
                    searchable: true
                },{
                    type: 'combo',
                    name: 'customerType',
                    field: 'getItemText(customerType)',
                    header: '客户类型',
                    sortable: true,
                    searchable: true,
                    codeNo:'customerType'
                },{
                    type: 'textfield',
                    name: 'identityCard',
                    field: 'identityCard',
                    header: '身份证号',
                    sortable: true,
                    searchable: true
                },{
                    type: 'textfield',
                    name: 'IDScanCopy',
                    field: 'IDScanCopy',
                    header: '身份证扫描件',
                    sortable: true,
                    searchable: true
                },{
                    type: 'textfield',
                    name: 'rmark',
                    field: 'rmark',
                    header: '客户备注',
                    sortable: true,
                    searchable: true
                },{
                    type: 'textfield',
                    name: 'address',
                    field: 'address',
                    header: '客户联系地址',
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
                    readOnly : true,
                    hidden : true
                },{
                    xtype: 'textfield',
                    fieldLabel: '客户编号',
                    name: 'customerNo',
                    objectName: 'customerNo',
                    field: 'customerNo',
                    readOnly: false,
                    hidden: false
                },{
                    xtype: 'textfield',
                    fieldLabel: '客户姓名',
                    name: 'name',
                    objectName: 'name',
                    field: 'name',
                    readOnly: false,
                    hidden: false
                },{
                    xtype: 'combo',
                    fieldLabel: '客户性别',
                    name: 'gender',
                    objectName: 'gender.uid',
                    field: 'gender',
                    readOnly: false,
                    hidden: false,
                    codeNo:'gender'
                },{
                    xtype: 'textfield',
                    fieldLabel: '联系电话',
                    name: 'phone',
                    objectName: 'phone',
                    field: 'phone',
                    readOnly: false,
                    hidden: false
                },{
                    xtype: 'combo',
                    fieldLabel: '客户类型',
                    name: 'customerType',
                    objectName: 'customerType.uid',
                    field: 'customerType',
                    readOnly: false,
                    hidden: false,
                    codeNo:'customerType'
                },{
                    xtype: 'textfield',
                    fieldLabel: '身份证号',
                    name: 'identityCard',
                    objectName: 'identityCard',
                    field: 'identityCard',
                    readOnly: false,
                    hidden: false
                },{
                    xtype: 'textfield',
                    fieldLabel: '身份证扫描件',
                    name: 'IDScanCopy',
                    objectName: 'IDScanCopy',
                    field: 'IDScanCopy',
                    readOnly: false,
                    hidden: false
                },{
                    xtype: 'textfield',
                    fieldLabel: '客户备注',
                    name: 'rmark',
                    objectName: 'rmark',
                    field: 'rmark',
                    readOnly: false,
                    hidden: false
                },{
                    xtype: 'textfield',
                    fieldLabel: '客户联系地址',
                    name: 'address',
                    objectName: 'address',
                    field: 'address',
                    readOnly: false,
                    hidden: false
                }],
                
                //new : 新增客户信息,info ： 查看客户信息,edit ：编辑客户信息,cancel ：取消客户信息，all ：所有客户信息
                buttons:[
                    { name : 'add_button', visible : true},
                    { name : 'query_button', visible : true},
                    { name : 'update_button', text:'更新客户信息' ,visible : true},
                    { name : 'delete_button', visible : true},
                ]
            };          
            
            var customerMessage = new com.lxq.js.GridAndForm.BaseGridAndForm(params);
			customerMessage.initGridAndForm();	

            var params2 = {
                    
                    /**panel渲染元素**/
                    divId : '${pageId}_2',
                    
                    /**项目名称**/
                    path: '${path}',
                
                    /**导出文件的名称**/
                    fileName: '选房条件列表',

                    /**弹出窗口标题**/
                    title: "系统选房条件",
                    
                    /**实体对象名称**/
                    entityName: '${entityName2}',
                    
                    /**action地址**/
                     actionUrl: "/baseAction",
                    
                    /**每页显示的记录数**/
                    pageSize: 15,
                    
                    /**grid 的sql from 语句**/
                    gridSql: 'from customer_message a,choose_condition b where a.uid = b.customerNo',
                    
                    /**form 的sql from 语句**/
                    formSql: 'from choose_condition', 
                    
                    /**查询条件**/
                    queryClause: '1=2',
                    
                    /**排序字段**/
                    sort: 'b.customerNo',
                    
                    /**排序方式**/
                    dir: 'asc', 
                    
                    /**弹出窗口的宽度**/
                    formWidth: 700,
                    
                    /**弹出窗口的高度**/
                    formHeight: 400,
                    
                    /**弹出窗口的表单项的文字标签的对齐方式**/
                    labelAlign: 'right',
                    
                    /**gird信息项**/
                    gridFields: [{
                        type: 'textfield',
                        name: 'uid',//必须有一个名称为“uid”的信息项,作为主键
                        field: 'b.uid' ,
                        header: '主键',
                        searchable: false,
                        hidden: true
                    },{
                        type: 'textfield',
                        name: 'county',
                        field: 'county',
                        header: '需求区县',
                        sortable: true,
                        searchable: true
                    },{
                        type: 'textfield',
                        name: 'zone',
                        field: 'zone',
                        header: '需求小区',
                        sortable: true,
                        searchable: true
                    },{
                        type: 'textfield',
                        name: 'plate',
                        field: 'plate',
                        header: '需求板块',
                        sortable: true,
                        searchable: true
                    },{
                        type: 'textfield',
                        name: 'street',
                        field: 'street',
                        header: '主要街道',
                        sortable: true,
                        searchable: true
                    },{
                        type: 'combo',
                        name: 'buildType',
                        field: 'getItemText(buildType)',
                        header: '客盘类型',
                        sortable: true,
                        searchable: true,
                        codeNo:'cusHouseType'
                    },{
                        type: 'textfield',
                        name: 'houseArea',
                        field: 'houseArea',
                        header: '房屋面积',
                        sortable: true,
                        searchable: true
                    },{
                        type: 'textfield',
                        name: 'floor',
                        field: 'floor',
                        header: '楼层',
                        sortable: true,
                        searchable: true
                    },{
                        type: 'combo',
                        name: 'customerStatus',
                        field: 'getItemText(customerStatus)',
                        header: '客源状态',
                        sortable: true,
                        searchable: true,
                        codeNo:'customerStatus'
                    },{
                        type: 'combo',
                        name: 'sourceType',
                        field: 'getItemText(sourceType)',
                        header: '房源类型',
                        sortable: true,
                        searchable: true,
                        codeNo:'houseType'
                    },{
                        type: 'textfield',
                        name: 'houseType',
                        field: 'houseType',
                        header: '户型',
                        sortable: true,
                        searchable: true
                    },{
                        type: 'combo',
                        name: 'decorateDegree',
                        field: 'getItemText(decorateDegree)',
                        header: '装修程度',
                        sortable: true,
                        searchable: true,
                        codeNo:'decorateDegree'
                    },{
                        type: 'combo',
                        name: 'direction',
                        field: 'getItemText(direction)',
                        header: '房屋朝向',
                        sortable: true,
                        searchable: true,
                        codeNo:'direction'
                    },{
                        type: 'combo',
                        name: 'rightType',
                        field: 'getItemText(rightType)',
                        header: '产权类型',
                        sortable: true,
                        searchable: true,
                        codeNo:'decorateDegree'
                    },{
                        type: 'textfield',
                        name: 'buildArea',
                        field: 'buildArea',
                        header: '建筑年代',
                        sortable: true,
                        searchable: true
                    },{
                        type: 'combo',
                        name: 'source',
                        field: 'getItemText(source)',
                        header: '来源',
                        sortable: true,
                        searchable: true,
                        codeNo:'source'
                    },{
                        type: 'textfield',
                        name: 'traffic',
                        field: 'traffic',
                        header: '交通状况',
                        sortable: true,
                        searchable: true
                    },{
                        type: 'textfield',
                        name: 'remark',
                        field: 'remark',
                        header: '客源备注',
                        sortable: true,
                        searchable: true
                    },{
                        type: 'textfield',
                        name: 'totalPrice',
                        field: 'totalPrice',
                        header: '总价格',
                        sortable: true,
                        searchable: true
                    },{
                        type: 'textfield',
                        name: 'unitPrice',
                        field: 'unitPrice',
                        header: '单价',
                        sortable: true,
                        searchable: true
                    },{
                        type: 'combo',
                        name: 'payMode',
                        field: 'getItemText(payMode)',
                        header: '付款方式',
                        sortable: true,
                        searchable: true,
                        codeNo:'payTypeDetail'
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
                        xtype: 'textfield',
                        fieldLabel: '客源编号',
                        name: 'customerNo',
                        objectName: 'customerNo',
                        field: 'customerNo',
                        readOnly: true,
                        hidden: true
                    },{
                        xtype: 'textfield',
                        fieldLabel: '需求区县',
                        name: 'county',
                        objectName: 'county',
                        field: 'county',
                        readOnly: false,
                        hidden: false
                    },{
                        xtype: 'textfield',
                        fieldLabel: '需求小区',
                        name: 'zone',
                        objectName: 'zone',
                        field: 'zone',
                        readOnly: false,
                        hidden: false
                    },{
                        xtype: 'textfield',
                        fieldLabel: '需求板块',
                        name: 'plate',
                        objectName: 'plate',
                        field: 'plate',
                        readOnly: false,
                        hidden: false
                    },{
                        xtype: 'textfield',
                        fieldLabel: '主要街道',
                        name: 'street',
                        objectName: 'street',
                        field: 'street',
                        readOnly: false,
                        hidden: false
                    },{
                        xtype: 'combo',
                        fieldLabel: '客盘类型',
                        name: 'buildType',
                        objectName: 'buildType.uid',
                        field: 'buildType',
                        readOnly: false,
                        hidden: false,
                        codeNo:'cusHouseType'
                    },{
                        xtype: 'textfield',
                        fieldLabel: '房屋面积',
                        name: 'houseArea',
                        objectName: 'houseArea',
                        field: 'houseArea',
                        readOnly: false,
                        hidden: false
                    },{
                        xtype: 'textfield',
                        fieldLabel: '楼层',
                        name: 'floor',
                        objectName: 'floor',
                        field: 'floor',
                        readOnly: false,
                        hidden: false
                    },{
                        xtype: 'combo',
                        fieldLabel: '客源状态',
                        name: 'customerStatus',
                        objectName: 'customerStatus.uid',
                        field: 'customerStatus',
                        readOnly: false,
                        hidden: false,
                        codeNo:'customerStatus'
                    },{
                        xtype: 'combo',
                        fieldLabel: '房源类型',
                        name: 'sourceType',
                        objectName: 'sourceType.uid',
                        field: 'sourceType',
                        readOnly: false,
                        hidden: false,
                        codeNo:'houseType'
                    },{
                        xtype: 'textfield',
                        fieldLabel: '户型',
                        name: 'houseType',
                        objectName: 'houseType.uid',
                        field: 'houseType',
                        readOnly: false,
                        hidden: false
                    },{
                        xtype: 'combo',
                        fieldLabel: '装修程度',
                        name: 'decorateDegree',
                        objectName: 'decorateDegree.uid',
                        field: 'decorateDegree',
                        readOnly: false,
                        hidden: false,
                        codeNo:'decorateDegree'
                    },{
                        xtype: 'combo',
                        fieldLabel: '房屋朝向',
                        name: 'direction',
                        objectName: 'direction.uid',
                        field: 'direction',
                        readOnly: false,
                        hidden: false,
                        codeNo:'direction'
                    },{
                        xtype: 'combo',
                        fieldLabel: '产权类型',
                        name: 'rightType',
                        objectName: 'rightType.uid',
                        field: 'rightType',
                        readOnly: false,
                        hidden: false,
                        codeNo:'rightType'
                    },{
                        xtype: 'textfield',
                        fieldLabel: '建筑年代',
                        name: 'buildArea',
                        objectName: 'buildArea',
                        field: 'buildArea',
                        readOnly: false,
                        hidden: false
                    },{
                        xtype: 'combo',
                        fieldLabel: '来源',
                        name: 'source',
                        objectName: 'source.uid',
                        field: 'source',
                        readOnly: false,
                        hidden: false,
                        codeNo:'source'
                    },{
                        xtype: 'textfield',
                        fieldLabel: '交通状况',
                        name: 'traffic',
                        objectName: 'traffic',
                        field: 'traffic',
                        readOnly: false,
                        hidden: false
                    },{
                        xtype: 'textfield',
                        fieldLabel: '客源备注',
                        name: 'remark',
                        objectName: 'remark',
                        field: 'remark',
                        readOnly: false,
                        hidden: false
                    },{
                        xtype: 'textfield',
                        fieldLabel: '总价格',
                        name: 'totalPrice',
                        objectName: 'totalPrice',
                        field: 'totalPrice',
                        readOnly: false,
                        hidden: false
                    },{
                        xtype: 'textfield',
                        fieldLabel: '单价',
                        name: 'unitPrice',
                        objectName: 'unitPrice',
                        field: 'unitPrice',
                        readOnly: false,
                        hidden: false
                    },{
                        xtype: 'combo',
                        fieldLabel: '付款方式',
                        name: 'payMode',
                        objectName: 'payMode.uid',
                        field: 'payMode',
                        readOnly: false,
                        hidden: false,
                        codeNo:'payTypeDetail'
                    }],
                    
                    //new : 新增选房条件,info ： 查看选房条件,edit ：编辑选房条件,cancel ：取消选房条件，all ：所有选房条件
                    buttons:[
                        { name : 'add_button', visible : true},
                        { name : 'query_button', visible : true},
                        { name : 'update_button', text:'更新选房条件信息' ,visible : true},
                        { name : 'delete_button', visible : true},
                    ]
                };          
			
			var chooseConditionMessage = new com.lxq.js.GridAndForm.BaseGridAndForm(params2);
			chooseConditionMessage.initGridAndForm();
			
			//----上下型页面，上页面行点击，下页面重新加载--------------
			var customerMessagePanel = customerMessage.getGridPanel();
			
			//当上面grid行点击时，重新加载下面grid的数据
			customerMessagePanel.on( "rowclick" , function( gridPanel,rowIndex,e){
			
				var selModel = gridPanel.getSelectionModel();
			    if (selModel.hasSelection()) {//有选中行
			        var selected = selModel.getSelections();//获取选择的列
			        
			        var key_value = selected[0].data.uid;//获取选中的第一列，名为“uid”的属性的属性值
					
					chooseConditionMessage.getNewPanel().getForm().setValues({
						customerNo : key_value
					});
					
					//重新加载下面gird的数据 
					chooseConditionMessage.reloadGrid(encodeURI("a.uid='"+key_value+"'"));
				}
			})
			
		</script>
	</head>
	<body>
		<div id='${pageId}_1'></div>
		<div id='${pageId}_2'></div>
	</body>
</html>