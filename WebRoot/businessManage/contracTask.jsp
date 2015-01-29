<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp"%>
<%@ taglib uri="/WEB-INF/platformTags.tld" prefix="pt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<c:set var="entityName" value="com.lxq.platform.businessManage.pojo.ContracTask"></c:set>
    
<html>
    <head>
        <script type="text/javascript">
            var params = {
                            
                /**panel渲染元素**/
                divId : '${pageId}',
                
                /**项目名称**/
                path: '${path}',
            
                /**导出文件的名称**/
                fileName: '合同任务列表',

                /**弹出窗口标题**/
                title: "系统合同任务",
                
                /**实体对象名称**/
                entityName: '${entityName}',
                
                /**action地址**/
                 actionUrl: "/baseAction",
                
                /**每页显示的记录数**/
                pageSize: 15,
                
                /**grid 的sql from 语句**/
                gridSql: 'from contrac_task', 
                
                /**form 的sql from 语句**/
                formSql: 'from contrac_task', 
                
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
                    type: 'combo',
                    name: 'taskType',
                    field: 'getItemText(taskType)',
                    header: '任务类型',
                    sortable: true,
                    searchable: true,
                    codeNo:'taskType'
                },{
                    type: 'combo',
                    name: 'taskStatus',
                    field: 'getItemText(taskStatus)',
                    header: '任务状态',
                    sortable: true,
                    searchable: true,
                    codeNo:'taskStatus'
                },{
                    type: 'textfield',
                    name: 'executePerson',
                    field: 'executePerson',
                    header: '执行人',
                    sortable: true,
                    searchable: false
                },{
                    type: 'textfield',
                    name: 'createPerson',
                    field: 'createPerson',
                    header: '创建人',
                    sortable: true,
                    searchable: false
                },{
                    type: 'textfield',
                    name: 'startTime',
                    field: 'startTime',
                    header: '开始时间',
                    sortable: true,
                    searchable: false
                },{
                    type: 'textfield',
                    name: 'endTime',
                    field: 'endTime',
                    header: '结束时间',
                    sortable: true,
                    searchable: false
                },{
                    type: 'textfield',
                    name: 'taskContent',
                    field: 'taskContent',
                    header: '任务内容',
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
                    readOnly : true,
                    hidden : true
                },{
                    xtype: 'textfield',
                    fieldLabel: '合同编号',
                    name: 'contracNo',
                    objectName: 'contracNo',
                    field: 'contracNo',
                    readOnly: false,
                    hidden: false
                },{
                    xtype: 'combo',
                    fieldLabel: '任务类型',
                    name: 'taskType',
                    objectName: 'taskType.uid',
                    field: 'taskType',
                    editable : false,
                    codeNo:'taskType'
                },{
                    xtype: 'combo',
                    fieldLabel: '任务状态',
                    name: 'taskStatus',
                    objectName: 'taskStatus.uid',
                    field: 'taskStatus',
                    editable : false,
                    codeNo:'taskStatus'
                },{
                    xtype: 'textfield',
                    fieldLabel: '执行人',
                    name: 'executePerson',
                    objectName: 'executePerson',
                    field: 'executePerson',
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
                    fieldLabel: '开始时间',
                    name: 'startTime',
                    objectName: 'startTime',
                    field: 'startTime',
                    readOnly: false,
                    hidden: false
                },{
                    xtype: 'textfield',
                    fieldLabel: '结束时间',
                    name: 'endTime',
                    objectName: 'endTime',
                    field: 'endTime',
                    readOnly: false,
                    hidden: false
                },{
                    xtype: 'textfield',
                    fieldLabel: '任务内容',
                    name: 'taskContent',
                    objectName: 'taskContent',
                    field: 'taskContent',
                    readOnly: false,
                    hidden: false
                }],
                
                //new : 新增合同任务,info ： 查看合同任务,edit ：编辑合同任务,cancel ：取消合同任务，all ：所有合同任务
                buttons:[
                    { name : 'add_button', visible : true},
                    { name : 'query_button', visible : true},
                    { name : 'update_button', text:'更新合同任务信息' ,visible : true},
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
