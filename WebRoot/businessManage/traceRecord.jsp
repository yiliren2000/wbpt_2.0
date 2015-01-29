<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp"%>
<%@ taglib uri="/WEB-INF/platformTags.tld" prefix="pt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<c:set var="entityName" value="com.lxq.platform.businessManage.pojo.TraceRecord"></c:set>
    
<html>
    <head>
        <script type="text/javascript">
            var params = {
                            
                /**panel渲染元素**/
                divId : '${pageId}',
                
                /**项目名称**/
                path: '${path}',
            
                /**导出文件的名称**/
                fileName: '跟进记录列表',

                /**弹出窗口标题**/
                title: "系统跟进记录",
                
                /**实体对象名称**/
                entityName: '${entityName}',
                
                /**action地址**/
                 actionUrl: "/baseAction",
                
                /**每页显示的记录数**/
                pageSize: 15,
                
                /**grid 的sql from 语句**/
                gridSql: 'from trace_record', 
                
                /**form 的sql from 语句**/
                formSql: 'from trace_record', 
                
                /**查询条件**/
                queryClause: '1=2',
                
                /**排序字段**/
                sort: 'traceDesc',
                
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
                    type: 'combo',
                    name: 'traceType',
                    field: 'getItemText(traceType)',
                    header: '跟进类型',
                    sortable: true,
                    searchable: true,
                    codeNo:'traceType'
                },{
                    type: 'combo',
                    name: 'businessType',
                    field: 'getItemText(businessType)',
                    header: '业务类型',
                    sortable: true,
                    searchable: true,
                    codeNo:'businessType'
                },{
                    type: 'textfield',
                    name: 'traceDesc',
                    field: 'traceDesc',
                    header: '跟进说明',
                    sortable: true,
                    searchable: false
                },{
                    type: 'textfield',
                    name: 'tracePerson',
                    field: 'tracePerson',
                    header: '跟进人',
                    sortable: true,
                    searchable: false
                },{
                    type: 'textfield',
                    name: 'traceTime',
                    field: 'traceTime',
                    header: '跟进时间',
                    sortable: true,
                    searchable: false
                },{
                    type: 'textfield',
                    name: 'traceObj',
                    field: 'traceObj',
                    header: '跟进对象编号',
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
                    xtype: 'combo',
                    fieldLabel: '跟进类型',
                    name: 'traceType',
                    objectName: 'traceType.uid',
                    field: 'traceType',
                    editable : false,
                    codeNo:'traceType'
                },{
                    xtype: 'combo',
                    fieldLabel: '业务类型',
                    name: 'businessType',
                    objectName: 'businessType.uid',
                    field: 'businessType',
                    editable : false,
                    codeNo:'businessType'
                },{
                    xtype: 'textfield',
                    fieldLabel: '跟进说明',
                    name: 'traceDesc',
                    objectName: 'traceDesc',
                    field: 'traceDesc',
                    readOnly: false,
                    hidden: false
                },{
                    xtype: 'textfield',
                    fieldLabel: '跟进人',
                    name: 'tracePerson',
                    objectName: 'tracePerson',
                    field: 'tracePerson',
                    readOnly: false,
                    hidden: false
                },{
                    xtype: 'textfield',
                    fieldLabel: '跟进时间',
                    name: 'traceTime',
                    objectName: 'traceTime',
                    field: 'traceTime',
                    readOnly: false,
                    hidden: false
                },{
                    xtype: 'combo',
                    fieldLabel: '跟进对象编号',
                    name: 'traceObj',
                    objectName: 'traceObj',
                    field: 'traceObj',
                    readOnly: false,
                    hidden: false,
                    codeSql:'select uid , contracNo as text from contract_message'
                }],
                
                //new : 新增跟进记录,info ： 查看跟进记录,edit ：编辑跟进记录,cancel ：取消跟进记录，all ：所有跟进记录
                buttons:[
                    { name : 'add_button', visible : true},
                    { name : 'query_button', visible : true},
                    { name : 'update_button', text:'更新跟进记录信息' ,visible : true},
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
