<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp"%>
<%@ taglib uri="/WEB-INF/platformTags.tld" prefix="pt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

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
                fileName: '权限列表',

                /**弹出窗口标题**/
                title: "系统权限",
                
                /**实体对象名称**/
                entityName: '${entityName}',
                
                /**action地址**/
                actionUrl: "/goalManage/goalAdjustAction",
                
                /**每页显示的记录数**/
                pageSize: 15,
                
                /**grid 的sql from 语句**/
                gridSql: 'from performance_goal', 
                
                /**form 的sql from 语句**/
                formSql: 'from performance_goal', 
                
                /**查询条件**/
                queryClause: '1=2',
                
                /**排序字段**/
                sort: 'dateBatch,getDeptId(ownerDept)',
                
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
                    name: 'dateBatch',
                    field: 'getDateBatch(dateBatch)' ,
                    header: '期次',
                    sortable: true,
                    searchable: false
                },{
                    type: 'textfield',
                    name: 'ownerDeptName',
                    field: 'getDeptName(ownerDept)' ,
                    header: '部门名称',
                    sortable: true,
                    searchable: true
                },{
                    type: 'textfield',
                    name: 'isMajor',
                    field: 'getItemText(isMajor)' ,
                    header: '是否重点目标',
                    sortable: true,
                    searchable: false,
                    hidden: true
                },{
                    type: 'textfield',
                    name: 'content',
                    field: 'content' ,
                    header: '目标内容',
                    sortable: true,
                    searchable: true,
                    renderer: showTip
                },{
                    type: 'numberfield',
                    name: 'finalScore',
                    field: 'finalScore' ,
                    header: '目标得分',
                    sortable: true,
                    searchable: false
                },{
                    type: 'textfield',
                    name: 'finishStatus',
                    field: 'getItemText(finishStatus)' ,
                    header: '完成情况',
                    sortable: true,
                    searchable: false
                },{
                    type: 'textfield',
                    name: 'addScoreReason',
                    field: 'addScoreReason' ,
                    header: '加减分原因',
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
                    xtype:'textfield',
                    fieldLabel: '所属期次',
                    name:'dateBatchUid',
                    objectName: 'dateBatch.uid',
                    field: 'dateBatch',
                    readOnly:true,
                    hidden: true,
                    style:'background:#E6E6E6'
                },{
                    xtype:'textfield',
                    fieldLabel: '所属期次',
                    name:'dateBatchText',
                    objectName: 'dateBatch.dateBatch',
                    field: 'getDateBatch(dateBatch)',
                    readOnly:true,
                    style:'background:#E6E6E6'
                },{
                    xtype: 'textarea',
                    fieldLabel: '目标内容',
                    name:'content',
                    field: 'content',
                    height:200,
                    allowBlank: false,
                    width: 400,
                    height : 70
                },{
                    xtype: 'textfield',
                    fieldLabel: '当前得分',
                    name:'finalScore',
                    field: 'finalScore',
                    allowBlank: false
                },{
                    xtype: 'numberfield',
                    fieldLabel: '加减分值',
                    name:'adjustScore',
                    field: 'adjustScore',
                    allowBlank: false,
                    queryable: false
                },{
                    xtype: 'textarea',
                    fieldLabel: '加分原因',
                    name:'addScoreReason',
                    field: 'addScoreReason',
                    allowBlank: true,
                    hidden: true
                },{
                    xtype: 'textarea',
                    fieldLabel: '加减分原因',
                    name:'adjustReason',
                    field: 'adjustReason',
                    allowBlank: false,
                    queryable: false,
                    width: 400,
                    height : 100
                }],
                
                //new : 新增权限,info ： 查看权限,edit ：编辑权限,cancel ：取消权限，all ：所有权限
                buttons:[
                    { name : 'add_button', visible : false},
                    { name : 'query_button', visible : false},
                    { name : 'update_button', text:'调整得分' ,visible : true},
                    { name : 'delete_button', visible : false},
                ]
            };          
            
            new com.lxq.js.GridAndForm.BaseGridAndForm(params).initGridAndForm();

        </script>
    </head>
    <body>
        <div id='${pageId}'></div>
    </body>
</html>
