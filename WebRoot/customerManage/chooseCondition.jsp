<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp"%>
<%@ taglib uri="/WEB-INF/platformTags.tld" prefix="pt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<c:set var="entityName" value="com.lxq.platform.customerManage.pojo.ChooseCondition"></c:set>
    
<html>
    <head>
        <script type="text/javascript">
            var params = {
                            
                /**panel渲染元素**/
                divId : '${pageId}',
                
                /**项目名称**/
                path: '${path}',
            
                /**导出文件的名称**/
                fileName: '选房条件列表',

                /**弹出窗口标题**/
                title: "系统选房条件",
                
                /**实体对象名称**/
                entityName: '${entityName}',
                
                /**action地址**/
                 actionUrl: "/baseAction",
                
                /**每页显示的记录数**/
                pageSize: 15,
                
                /**grid 的sql from 语句**/
                gridSql: 'from choose_condition', 
                
                /**form 的sql from 语句**/
                formSql: 'from choose_condition', 
                
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
                    header: '客源编号',
                    sortable: true,
                    searchable: true
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
                    hidden: false
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
                    { name : 'add_button', visible : false},
                    { name : 'query_button', visible : true},
                    { name : 'update_button', text:'更新选房条件信息' ,visible : true},
                    { name : 'delete_button', visible : true},
                ]
            };          
            
            new com.lxq.js.GridAndForm.BaseGridAndForm(params).initGridAndForm();

        </script>
    </head>
    <body>
        <div id='${pageId}'></div>
    </body>
</html>
