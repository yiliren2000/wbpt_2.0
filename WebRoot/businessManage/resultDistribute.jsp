<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp"%>
<%@ taglib uri="/WEB-INF/platformTags.tld" prefix="pt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<c:set var="entityName" value="com.lxq.platform.businessManage.pojo.ResultDistribute"></c:set>
    
<html>
    <head>
        <script type="text/javascript">
            var params = {
                            
                /**panel渲染元素**/
                divId : '${pageId}',
                
                /**项目名称**/
                path: '${path}',
            
                /**导出文件的名称**/
                fileName: '利润分成列表',

                /**弹出窗口标题**/
                title: "系统利润分成",
                
                /**实体对象名称**/
                entityName: '${entityName}',
                
                /**action地址**/
                 actionUrl: "/baseAction",
                
                /**每页显示的记录数**/
                pageSize: 15,
                
                /**grid 的sql from 语句**/
                gridSql: 'from result_distribute', 
                
                /**form 的sql from 语句**/
                formSql: 'from result_distribute', 
                
                /**查询条件**/
                queryClause: '1=2',
                
                /**排序字段**/
                sort: 'contracNo',
                
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
                    name: 'contracNo',
                    field: 'contracNo',
                    header: '合同编号',
                    sortable: true,
                    searchable: false
                },{
                    type: 'textfield',
                    name: 'commissionSum',
                    field: 'commissionSum',
                    header: '佣金总额',
                    sortable: true,
                    searchable: false
                },{
                    type: 'textfield',
                    name: 'validResult',
                    field: 'validResult',
                    header: '可分业绩',
                    sortable: true,
                    searchable: false
                },{
                    type: 'textfield',
                    name: 'resultOwner',
                    field: 'resultOwner',
                    header: '业绩归属人',
                    sortable: true,
                    searchable: false
                },{
                    type: 'textfield',
                    name: 'resultRatio',
                    field: 'resultRatio',
                    header: '分成比例',
                    sortable: true,
                    searchable: false
                },{
                    type: 'textfield',
                    name: 'resultDate',
                    field: 'resultDate',
                    header: '业绩日期',
                    sortable: true,
                    searchable: false
                },{
                    type: 'textfield',
                    name: 'distributeDesc',
                    field: 'distributeDesc',
                    header: '分成说明',
                    sortable: true,
                    searchable: false
                },{
                    type: 'combo',
                    name: 'resultType',
                    field: 'getItemText(resultType)',
                    header: '业绩类型',
                    sortable: true,
                    searchable: true,
                    codeNo:'resultDesc'
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
                    xtype: 'combo',
                    fieldLabel: '合同编号',
                    name: 'contracNo',
                    objectName: 'contracNo',
                    field: 'contracNo',
                    readOnly: false,
                    hidden: false,
                    codeSql:'select uid , contracNo as text from contract_message'
                },{
                    xtype: 'textfield',
                    fieldLabel: '佣金总额',
                    name: 'commissionSum',
                    objectName: 'commissionSum',
                    field: 'commissionSum',
                    readOnly: false,
                    hidden: false
                },{
                    xtype: 'textfield',
                    fieldLabel: '可分业绩',
                    name: 'validResult',
                    objectName: 'validResult',
                    field: 'validResult',
                    readOnly: false,
                    hidden: false
                },{
                    xtype: 'textfield',
                    fieldLabel: '业绩归属人',
                    name: 'resultOwner',
                    objectName: 'resultOwner',
                    field: 'resultOwner',
                    readOnly: false,
                    hidden: false
                },{
                    xtype: 'textfield',
                    fieldLabel: '分成比例',
                    name: 'resultRatio',
                    objectName: 'resultRatio',
                    field: 'resultRatio',
                    readOnly: false,
                    hidden: false
                },{
                    xtype: 'textfield',
                    fieldLabel: '业绩日期',
                    name: 'resultDate',
                    objectName: 'resultDate',
                    field: 'resultDate',
                    readOnly: false,
                    hidden: false
                },{
                    xtype: 'textfield',
                    fieldLabel: '分成说明',
                    name: 'distributeDesc',
                    objectName: 'distributeDesc',
                    field: 'distributeDesc',
                    readOnly: false,
                    hidden: false
                },{
                    xtype: 'combo',
                    fieldLabel: '业绩类型',
                    name: 'resultType',
                    objectName: 'resultType.uid',
                    field: 'resultType',
                    editable : false,
                    codeNo:'resultDesc'
                }],
                
                //new : 新增利润分成,info ： 查看利润分成,edit ：编辑利润分成,cancel ：取消利润分成，all ：所有利润分成
                buttons:[
                    { name : 'add_button', visible : true},
                    { name : 'query_button', visible : true},
                    { name : 'update_button', text:'更新利润分成信息' ,visible : true},
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
