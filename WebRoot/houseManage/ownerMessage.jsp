<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp"%>
<%@ taglib uri="/WEB-INF/platformTags.tld" prefix="pt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<c:set var="entityName1" value="com.lxq.platform.houseManage.pojo.OwnerMessage"></c:set>
<c:set var="entityName2" value="com.lxq.platform.houseManage.pojo.HouseMessage"></c:set>
    
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
                fileName: '业主列表',

                /**弹出窗口标题**/
                title: "系统业主",
                
                /**实体对象名称**/
                entityName: '${entityName1}',
                
                /**action地址**/
                 actionUrl: "/baseAction",
                
                /**每页显示的记录数**/
                pageSize: 15,
                
                /**grid 的sql from 语句**/
                gridSql: 'from owner_message', 
                
                /**form 的sql from 语句**/
                formSql: 'from owner_message', 
                
                /**查询条件**/
                queryClause: '1=2',
                
                /**排序字段**/
                sort: 'name',
                
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
                    name: 'name',
                    field: 'name',
                    header: '姓名',
                    sortable: true,
                    searchable: true
                },{
                    type: 'combo',
                    name: 'gender',
                    field: 'getItemText(gender)',
                    header: '性别',
                    sortable: true,
                    searchable: true,
                    codeNo: 'gender'
                },{
                    type: 'combo',
                    name: 'ownerType',
                    field: 'getItemText(ownerType)',
                    header: '业主类型',
                    sortable: true,
                    searchable: true,
                    codeNo: 'ownerType'
                },{
                    type: 'textfield',
                    name: 'phone',
                    field: 'phone',
                    header: '电话',
                    sortable: true,
                    searchable: true
                },{
                    type: 'textfield',
                    name: 'identityCard',
                    field: 'identityCard',
                    header: '身份证号码',
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
                    name: 'ownerMemo',
                    field: 'ownerMemo',
                    header: '业主备注',
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
                    fieldLabel: '姓名',
                    name: 'name',
                    objectName: 'name',
                    field: 'name',
                    readOnly: false,
                    hidden: false
                },{
                    xtype: 'combo',
                    fieldLabel: '性别',
                    name: 'gender',
                    objectName: 'gender.uid',
                    field: 'gender',
                    readOnly: false,
                    hidden: false,
                    codeNo:'gender'
                },{
                    xtype: 'combo',
                    fieldLabel: '业主类型',
                    name: 'ownerType',
                    objectName: 'ownerType.uid',
                    field: 'ownerType',
                    readOnly: false,
                    hidden: false,
                    codeNo:'ownerType'
                },{
                    xtype: 'textfield',
                    fieldLabel: '电话',
                    name: 'phone',
                    objectName: 'phone',
                    field: 'phone',
                    readOnly: false,
                    hidden: false
                },{
                    xtype: 'textfield',
                    fieldLabel: '身份证号码',
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
                    fieldLabel: '业主备注',
                    name: 'ownerMemo',
                    objectName: 'ownerMemo',
                    field: 'ownerMemo',
                    readOnly: false,
                    hidden: false
                }],
                
                //new : 新增业主,info ： 查看业主,edit ：编辑业主,cancel ：取消业主，all ：所有业主
                buttons:[
                    { name : 'add_button', visible : true},
                    { name : 'query_button', visible : true},
                    { name : 'update_button', text:'更新业主信息' ,visible : true},
                    { name : 'delete_button', visible : true},
                ]
            };          
            
            var ownerMessage = new com.lxq.js.GridAndForm.BaseGridAndForm(params);
			ownerMessage.initGridAndForm();	

            var params2 = {
							
			    /**panel渲染元素**/
                divId : '${pageId}_2',
                
                gridHeight : (Ext.get("center").getHeight()-Ext.get("south").getHeight()-20)/2-20,
                
                /**项目名称**/
                path: '${path}',
            
                /**导出文件的名称**/
                fileName: '房源列表',

                /**弹出窗口标题**/
                title: "系统房源",
                
                /**实体对象名称**/
                entityName: '${entityName2}',
                
                /**action地址**/
                 actionUrl: "/baseAction",
                
                /**每页显示的记录数**/
                pageSize: 15,
                
                 /**grid 的sql from 语句**/
                gridSql: 'from house_message a,owner_message b where a.ownerMessage = b.uid',
                
                /**form 的sql from 语句**/
                formSql: 'from house_message', 
                
                /**查询条件**/
                queryClause: '1=2',
                
                /**排序字段**/
                sort: 'houseNo',
                
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
                    field: 'a.uid' ,
                    header: '主键',
                    searchable: false,
                    hidden: true
                },{
                    type: 'combo',
                    name: 'payMode',
                    field: 'getItemText(payMode)',
                    header: '付款方式',
                    sortable: true,
                    searchable: true,
                    codeNo:'payType'
                },{
                    type: 'textfield',
                    name: 'city',
                    field: 'city',
                    header: '城市',
                    sortable: true,
                    searchable: true
                },{
                    type: 'textfield',
                    name: 'county',
                    field: 'county',
                    header: '区县',
                    sortable: true,
                    searchable: true
                },{
                    type: 'textfield',
                    name: 'zone',
                    field: 'zone',
                    header: '小区（街道）',
                    sortable: true,
                    searchable: true
                },{
                    type: 'textfield',
                    name: 'buildNo',
                    field: 'buildNo',
                    header: '栋号',
                    sortable: true,
                    searchable: true
                },{
                    type: 'textfield',
                    name: 'unitNo',
                    field: 'unitNo',
                    header: '单元号',
                    sortable: true,
                    searchable: true
                },{
                    type: 'textfield',
                    name: 'allFloor',
                    field: 'allFloor',
                    header: '总层',
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
                    type: 'textfield',
                    name: 'doorNo',
                    field: 'doorNo',
                    header: '门牌号',
                    sortable: true,
                    searchable: true
                },{
                    type: 'combo',
                    name: 'direction',
                    field: 'getItemText(direction)',
                    header: '朝向',
                    sortable: true,
                    searchable: true,
                    codeNo:'direction'
                },{
                    type: 'textfield',
                    name: 'buildYear',
                    field: 'buildYear',
                    header: '建造年代',
                    sortable: true,
                    searchable: true
                },{
                    type: 'combo',
                    name: 'houseType',
                    field: 'getItemText(houseType)',
                    header: '房型',
                    sortable: true,
                    searchable: true,
                    codeNo:'houseType'
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
                    name: 'property',
                    field: 'getItemText(property)',
                    header: '性质',
                    sortable: true,
                    searchable: true,
                    codeNo:'houseQuality'
                },{
                    type: 'combo',
                    name: 'buildType',
                    field: 'getItemText(buildType)',
                    header: '房产类型',
                    sortable: true,
                    searchable: true,
                    codeNo:'houseType'
                },{
                    type: 'combo',
                    name: 'rightType',
                    field: 'getItemText(rightType)',
                    header: '产权类型',
                    sortable: true,
                    searchable: true,
                    codeNo:'rightType'
                },{
                    type: 'textfield',
                    name: 'rightYear',
                    field: 'rightYear',
                    header: '产权年限',
                    sortable: true,
                    searchable: true
                },{
                    type: 'textfield',
                    name: 'buildArea',
                    field: 'buildArea',
                    header: '建筑面积',
                    sortable: true,
                    searchable: true
                },{
                    type: 'textfield',
                    name: 'useArea',
                    field: 'useArea',
                    header: '使用面积',
                    sortable: true,
                    searchable: true,
                    hidden: true
                },{
                    type: 'combo',
                    name: 'source',
                    field: 'getItemText(source)',
                    header: '来源',
                    sortable: true,
                    searchable: true,
                    hidden: true,
                    codeNo:'source'
                },{
                    type: 'combo',
                    name: 'structure',
                    field: 'getItemText(structure)',
                    header: '结构',
                    sortable: true,
                    searchable: true,
                    hidden: true,
                    codeNo:'structure'
                },{
                    type: 'textfield',
                    name: 'license',
                    field: 'license',
                    header: '产证',
                    sortable: true,
                    searchable: true,
                    hidden: true
                },{
                    type: 'textfield',
                    name: 'facility',
                    field: 'func_getStr(facility)',
                    header: '设施'
                },{
                    type: 'textfield',
                    name: 'traffic',
                    field: 'traffic',
                    header: '交通情况',
                    sortable: true,
                    searchable: true,
                    hidden: true
                },{
                    type: 'textfield',
                    name: 'pubilcRemark',
                    field: 'pubilcRemark',
                    header: '公开备注',
                    sortable: true,
                    searchable: true,
                    hidden: true
                },{
                    type: 'textfield',
                    name: 'privateRemark',
                    field: 'privateRemark',
                    header: '保密备注',
                    sortable: true,
                    searchable: true,
                    hidden: true
                },{
                    type: 'textfield',
                    name: 'keyNo',
                    field: 'keyNo',
                    header: '钥匙编号',
                    sortable: true,
                    searchable: true,
                    hidden: true
                },{
                    type: 'textfield',
                    name: 'garageDesc',
                    field: 'garageDesc',
                    header: '车库说明',
                    sortable: true,
                    searchable: true,
                    hidden: true
                },{
                    type: 'textfield',
                    name: 'totalPrice',
                    field: 'totalPrice',
                    header: '总价',
                    sortable: true,
                    searchable: true,
                    hidden: true
                },{
                    type: 'textfield',
                    name: 'publishTime',
                    field: 'publishTime',
                    header: '发布时间',
                    sortable: true,
                    searchable: true,
                    hidden: true
                },{
                    type: 'textfield',
                    name: 'houseNo',
                    field: 'houseNo',
                    header: '房源编号',
                    sortable: true,
                    searchable: true,
                    hidden: true
                },{
                    type: 'combo',
                    name: 'status',
                    field: 'getItemText(status)',
                    header: '状态',
                    sortable: true,
                    searchable: true,
                    hidden: true,
                    codeNo:'businessStatus'
                },{
                    type: 'textfield',
                    name: 'priceCondition',
                    field: 'priceCondition',
                    header: '价格条件',
                    sortable: true,
                    searchable: true,
                    hidden: true
                },{
                    type: 'combo',
                    name: 'viewMethod',
                    field: 'getItemText(viewMethod)',
                    header: '看房方式',
                    sortable: true,
                    searchable: true,
                    hidden: true,
                    codeNo:'viewMethod'
                },{
                    type: 'textfield',
                    name: 'unitPrice',
                    field: 'unitPrice',
                    header: '单价',
                    sortable: true,
                    searchable: true,
                    hidden: true
                },{
                    type: 'textfield',
                    name: 'updateTime',
                    field: 'updateTime',
                    header: '更新时间',
                    sortable: true,
                    searchable: true,
                    hidden: true
                },{
                    type: 'textfield',
                    name: 'createPerson',
                    field: 'createPerson',
                    header: '创建人',
                    sortable: true,
                    searchable: true,
                    hidden: true
                },{
                    type: 'textfield',
                    name: 'housePicture',
                    field: 'housePicture',
                    header: '房源图片',
                    sortable: true,
                    searchable: true,
                    hidden: true
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
                    fieldLabel: '业主',
                    name: 'ownerMessage',
                    objectName: 'ownerMessage.uid',
                    field: 'ownerMessage',
                    readOnly: true,
                    hidden: true
                },{
                    xtype: 'combo',
                    fieldLabel: '付款方式',
                    name: 'payMode',
                    objectName: 'payMode.uid',
                    field: 'payMode',
                    readOnly: false,
                    hidden: false,
                    codeNo:'payType'
                },{
                    xtype: 'textfield',
                    fieldLabel: '城市',
                    name: 'city',
                    objectName: 'city',
                    field: 'city',
                    readOnly: false,
                    hidden: false
                },{
                    xtype: 'textfield',
                    fieldLabel: '区县',
                    name: 'county',
                    objectName: 'county',
                    field: 'county',
                    readOnly: false,
                    hidden: false
                },{
                    xtype: 'textfield',
                    fieldLabel: '小区（街道）',
                    name: 'zone',
                    objectName: 'zone',
                    field: 'zone',
                    readOnly: false,
                    hidden: false
                },{
                    xtype: 'textfield',
                    fieldLabel: '栋号',
                    name: 'buildNo',
                    objectName: 'buildNo',
                    field: 'buildNo',
                    readOnly: false,
                    hidden: false
                },{
                    xtype: 'textfield',
                    fieldLabel: '单元号',
                    name: 'unitNo',
                    objectName: 'unitNo',
                    field: 'unitNo',
                    readOnly: false,
                    hidden: false
                },{
                    xtype: 'textfield',
                    fieldLabel: '总层',
                    name: 'allFloor',
                    objectName: 'allFloor',
                    field: 'allFloor',
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
                    xtype: 'textfield',
                    fieldLabel: '门牌号',
                    name: 'doorNo',
                    objectName: 'doorNo',
                    field: 'doorNo',
                    readOnly: false,
                    hidden: false
                },{
                    xtype: 'combo',
                    fieldLabel: '朝向',
                    name: 'direction',
                    objectName: 'direction.uid',
                    field: 'direction',
                    readOnly: false,
                    hidden: false,
                    codeNo:'direction'
                },{
                    xtype: 'textfield',
                    fieldLabel: '建造年代',
                    name: 'buildYear',
                    objectName: 'buildYear',
                    field: 'buildYear',
                    readOnly: false,
                    hidden: false
                },{
                    xtype: 'combo',
                    fieldLabel: '房型',
                    name: 'houseType',
                    objectName: 'houseType.uid',
                    field: 'houseType',
                    readOnly: false,
                    hidden: false,
                    codeNo:'houseType'
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
                    fieldLabel: '性质',
                    name: 'property',
                    objectName: 'property.uid',
                    field: 'property',
                    readOnly: false,
                    hidden: false,
                    codeNo:'houseQuality'
                },{
                    xtype: 'combo',
                    fieldLabel: '房产类型',
                    name: 'buildType',
                    objectName: 'buildType.uid',
                    field: 'buildType',
                    readOnly: false,
                    hidden: false,
                    codeNo:'houseType'
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
                    fieldLabel: '产权年限',
                    name: 'rightYear',
                    objectName: 'rightYear',
                    field: 'rightYear',
                    readOnly: false,
                    hidden: false
                },{
                    xtype: 'textfield',
                    fieldLabel: '建筑面积',
                    name: 'buildArea',
                    objectName: 'buildArea',
                    field: 'buildArea',
                    readOnly: false,
                    hidden: false
                },{
                    xtype: 'textfield',
                    fieldLabel: '使用面积',
                    name: 'useArea',
                    objectName: 'useArea',
                    field: 'useArea',
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
                    xtype: 'combo',
                    fieldLabel: '结构',
                    name: 'structure',
                    objectName: 'structure.uid',
                    field: 'structure',
                    readOnly: false,
                    hidden: false,
                    codeNo:'structure'
                },{
                    xtype: 'textfield',
                    fieldLabel: '产证',
                    name: 'license',
                    objectName: 'license',
                    field: 'license',
                    readOnly: false,
                    hidden: false
                },{
                    xtype: 'lovcombo',
                    fieldLabel: '设施',
                    name: 'facility',
                    objectName: 'facility',
                    field: 'facility',
                    readOnly: false,
                    hidden: false,
                    codeNo:'facility'
                },{
                    xtype: 'textfield',
                    fieldLabel: '交通情况',
                    name: 'traffic',
                    objectName: 'traffic',
                    field: 'traffic',
                    readOnly: false,
                    hidden: false
                },{
                    xtype: 'textfield',
                    fieldLabel: '公开备注',
                    name: 'pubilcRemark',
                    objectName: 'pubilcRemark',
                    field: 'pubilcRemark',
                    readOnly: false,
                    hidden: false
                },{
                    xtype: 'textfield',
                    fieldLabel: '保密备注',
                    name: 'privateRemark',
                    objectName: 'privateRemark',
                    field: 'privateRemark',
                    readOnly: false,
                    hidden: false
                },{
                    xtype: 'textfield',
                    fieldLabel: '钥匙编号',
                    name: 'keyNo',
                    objectName: 'keyNo',
                    field: 'keyNo',
                    readOnly: false,
                    hidden: false
                },{
                    xtype: 'textfield',
                    fieldLabel: '车库说明',
                    name: 'garageDesc',
                    objectName: 'garageDesc',
                    field: 'garageDesc',
                    readOnly: false,
                    hidden: false
                },{
                    xtype: 'textfield',
                    fieldLabel: '总价',
                    name: 'totalPrice',
                    objectName: 'totalPrice',
                    field: 'totalPrice',
                    readOnly: false,
                    hidden: false
                },{
                    xtype: 'textfield',
                    fieldLabel: '发布时间',
                    name: 'publishTime',
                    objectName: 'publishTime',
                    field: 'publishTime',
                    readOnly: false,
                    hidden: false
                },{
                    xtype: 'textfield',
                    fieldLabel: '房源编号',
                    name: 'houseNo',
                    objectName: 'houseNo',
                    field: 'houseNo',
                    readOnly: false,
                    hidden: false
                },{
                    xtype: 'combo',
                    fieldLabel: '状态',
                    name: 'status',
                    objectName: 'status.uid',
                    field: 'status',
                    readOnly: false,
                    hidden: false,
                    codeNo:'businessStatus'
                },{
                    xtype: 'combo',
                    fieldLabel: '价格条件',
                    name: 'priceCondition',
                    objectName: 'priceCondition.uid',
                    field: 'priceCondition',
                    readOnly: false,
                    hidden: false,
                    codeNo:'priceCondition'
                },{
                    xtype: 'combo',
                    fieldLabel: '看房方式',
                    name: 'viewMethod',
                    objectName: 'viewMethod.uid',
                    field: 'viewMethod',
                    readOnly: false,
                    hidden: false,
                    codeNo:'viewMethod'
                },{
                    xtype: 'textfield',
                    fieldLabel: '单价',
                    name: 'unitPrice',
                    objectName: 'unitPrice',
                    field: 'unitPrice',
                    readOnly: false,
                    hidden: false
                },{
                    xtype: 'textfield',
                    fieldLabel: '更新时间',
                    name: 'updateTime',
                    objectName: 'updateTime',
                    field: 'updateTime',
                    readOnly: false,
                    hidden: false
                },{
                    xtype: 'textfield',
                    fieldLabel: '创建人',
                    name: 'createPerson',
                    objectName: 'createPerson',
                    field: 'createPerson',
                    readOnly: false,
                    hidden: false
                },{
                    xtype: 'textfield',
                    fieldLabel: '房源图片',
                    name: 'housePicture',
                    objectName: 'housePicture',
                    field: 'housePicture',
                    readOnly: false,
                    hidden: false
                }],
                
                //new : 新增房源,info ： 查看房源,edit ：编辑房源,cancel ：取消房源，all ：所有房源
                buttons:[
                    { name : 'add_button', visible : true},
                    { name : 'query_button', visible : true},
                    { name : 'update_button', text:'更新房源信息' ,visible : true},
                    { name : 'delete_button', visible : true},
                ]
            };
			
			var houseMessage = new com.lxq.js.GridAndForm.BaseGridAndForm(params2);
			houseMessage.initGridAndForm();
			
			//----上下型页面，上页面行点击，下页面重新加载--------------
			var ownerMessagePanel = ownerMessage.getGridPanel();
			
			//当上面grid行点击时，重新加载下面grid的数据
			ownerMessagePanel.on( "rowclick" , function( gridPanel,rowIndex,e){
			
				var selModel = gridPanel.getSelectionModel();
			    if (selModel.hasSelection()) {//有选中行
			        var selected = selModel.getSelections();//获取选择的列
			        
			        var key_value = selected[0].data.uid;//获取选中的第一列，名为“uid”的属性的属性值
					
					houseMessage.getNewPanel().getForm().setValues({
						ownerMessage : key_value
					});
					
					//重新加载下面gird的数据 
					houseMessage.reloadGrid(encodeURI("b.uid='"+key_value+"'"));
				}
			})
			
		</script>
	</head>
	<body>
		<div id='${pageId}_1'></div>
		<div id='${pageId}_2'></div>
	</body>
</html>
