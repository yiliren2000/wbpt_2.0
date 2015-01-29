<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp"%>
<%@ taglib uri="/WEB-INF/platformTags.tld" prefix="pt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<c:set var="entityName" value="com.lxq.platform.businessManage.pojo.Contract"></c:set>
<c:set var="entityName2" value="com.lxq.platform.businessManage.pojo.ContracTask"></c:set>
    
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
                fileName: '合同列表',

                /**弹出窗口标题**/
                title: "系统合同",
                
                /**实体对象名称**/
                entityName: '${entityName}',
                
                /**action地址**/
                 actionUrl: "/baseAction",
                
                /**每页显示的记录数**/
                pageSize: 15,
                
                /**grid 的sql from 语句**/
                gridSql: 'from contract_message', 
                
                /**form 的sql from 语句**/
                formSql: 'from contract_message', 
                
                /**查询条件**/
                queryClause: '1=1',
                
                /**排序字段**/
                sort: 'contracNo',
                
                /**排序方式**/
                dir: 'asc', 
                
                /**弹出窗口的宽度**/
                formWidth: 900,
                
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
                    hidden: true
                },{
                    type: 'combo',
                    name: 'businessType',
                    field: 'getItemText(businessType)',
                    header: '业务类型',
                    sortable: true,
                    searchable: true,
                    codeNo:'businessClassify'
                },{
                    type: 'textfield',
                    name: 'houseNo',
                    field: 'houseNo',
                    header: '房源编号',
                    sortable: true,
                    searchable: false
                },{
                    type: 'textfield',
                    name: 'customerNo',
                    field: 'customerNo',
                    header: '客源编号',
                    sortable: true,
                    searchable: false
                },{
                    type: 'textfield',
                    name: 'contractSum',
                    field: 'contractSum',
                    header: '合同金额',
                    sortable: true,
                    searchable: false
                },{
                    type: 'textfield',
                    name: 'signDate',
                    field: 'signDate',
                    header: '签定日期',
                    sortable: true,
                    searchable: false
                },{
                    type: 'textfield',
                    name: 'signPerson',
                    field: 'signPerson',
                    header: '签约人员',
                    sortable: true,
                    searchable: false
                },{
                    type: 'textfield',
                    name: 'inputPerson',
                    field: 'inputPerson',
                    header: '登记人',
                    sortable: true,
                    searchable: false
                },{
                    type: 'textfield',
                    name: 'ownerName',
                    field: 'ownerName',
                    header: '业主姓名',
                    sortable: true,
                    searchable: false
                },{
                    type: 'textfield',
                    name: 'ownerPhone',
                    field: 'ownerPhone',
                    header: '业主电话',
                    sortable: true,
                    searchable: false
                },{
                    type: 'textfield',
                    name: 'ownerIdentityCard',
                    field: 'ownerIdentityCard',
                    header: '业主身份证号',
                    sortable: true,
                    searchable: false
                },{
                    type: 'textfield',
                    name: 'ownerIDScanCopy',
                    field: 'ownerIDScanCopy',
                    header: '业主身份证扫描件',
                    sortable: true,
                    searchable: false
                },{
                    type: 'textfield',
                    name: 'ownerAddress',
                    field: 'ownerAddress',
                    header: '业主联系地址',
                    sortable: true,
                    searchable: false
                },{
                    type: 'textfield',
                    name: 'ownerCommission',
                    field: 'ownerCommission',
                    header: '业主佣金',
                    sortable: true,
                    searchable: false
                },{
                    type: 'textfield',
                    name: 'customerCommission',
                    field: 'customerCommission',
                    header: '客户佣金',
                    sortable: true,
                    searchable: false
                },{
                    type: 'textfield',
                    name: 'attachItem',
                    field: 'attachItem',
                    header: '附加条款',
                    sortable: true,
                    searchable: false
                },{
                    type: 'textfield',
                    name: 'remark',
                    field: 'remark',
                    header: '备注信息',
                    sortable: true,
                    searchable: false
                },{
                    type: 'textfield',
                    name: 'contractScanCopy',
                    field: 'contractScanCopy',
                    header: '合同扫描件',
                    sortable: true,
                    searchable: false
                },{
                    type: 'textfield',
                    name: 'approveOpinion',
                    field: 'approveOpinion',
                    header: '审核意见',
                    sortable: true,
                    searchable: false
                },{
                    type: 'textfield',
                    name: 'inputDate',
                    field: 'inputDate',
                    header: '登记日期',
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
                    hidden: false,
                    columnWidth: 0.5
                },{
                    xtype: 'combo',
                    fieldLabel: '业务类型',
                    name: 'businessType',
                    objectName: 'businessType.uid',
                    field: 'businessType',
                    editable : false,
                    codeNo:'businessClassify',
                    columnWidth: 0.5
                },{
                    xtype: 'textfield',
                    fieldLabel: '房源编号',
                    name: 'houseNo',
                    objectName: 'houseNo',
                    field: 'houseNo',
                    readOnly: false,
                    hidden: false,
                    columnWidth: 0.5
                },{
                    xtype: 'textfield',
                    fieldLabel: '客源编号',
                    name: 'customerNo',
                    objectName: 'customerNo',
                    field: 'customerNo',
                    readOnly: false,
                    hidden: false,
                    columnWidth: 0.5
                },{
                    xtype: 'textfield',
                    fieldLabel: '合同金额',
                    name: 'contractSum',
                    objectName: 'contractSum',
                    field: 'contractSum',
                    readOnly: false,
                    hidden: false,
                    columnWidth: 0.5
                },{
                    xtype: 'textfield',
                    fieldLabel: '签定日期',
                    name: 'signDate',
                    objectName: 'signDate',
                    field: 'signDate',
                    readOnly: false,
                    hidden: false,
                    columnWidth: 0.5
                },{
                    xtype: 'textfield',
                    fieldLabel: '签约人员',
                    name: 'signPerson',
                    objectName: 'signPerson',
                    field: 'signPerson',
                    readOnly: false,
                    hidden: false,
                    columnWidth: 0.5
                },{
                    xtype: 'textfield',
                    fieldLabel: '登记人',
                    name: 'inputPerson',
                    objectName: 'inputPerson',
                    field: 'inputPerson',
                    readOnly: false,
                    hidden: false,
                    columnWidth: 0.5
                },{
                    xtype: 'textfield',
                    fieldLabel: '业主姓名',
                    name: 'ownerName',
                    objectName: 'ownerName',
                    field: 'ownerName',
                    readOnly: false,
                    hidden: false,
                    columnWidth: 0.5
                },{
                    xtype: 'textfield',
                    fieldLabel: '业主电话',
                    name: 'ownerPhone',
                    objectName: 'ownerPhone',
                    field: 'ownerPhone',
                    readOnly: false,
                    hidden: false,
                    columnWidth: 0.5
                },{
                    xtype: 'textfield',
                    fieldLabel: '业主身份证号',
                    name: 'ownerIdentityCard',
                    objectName: 'ownerIdentityCard',
                    field: 'ownerIdentityCard',
                    readOnly: false,
                    hidden: false,
                    columnWidth: 0.5
                },{
                    xtype: 'textfield',
                    fieldLabel: '业主身份证扫描件',
                    name: 'ownerIDScanCopy',
                    objectName: 'ownerIDScanCopy',
                    field: 'ownerIDScanCopy',
                    readOnly: false,
                    hidden: false,
                    columnWidth: 0.5
                },{
                    xtype: 'textfield',
                    fieldLabel: '业主联系地址',
                    name: 'ownerAddress',
                    objectName: 'ownerAddress',
                    field: 'ownerAddress',
                    readOnly: false,
                    hidden: false,
                    columnWidth: 0.5
                },{
                    xtype: 'textfield',
                    fieldLabel: '业主佣金',
                    name: 'ownerCommission',
                    objectName: 'ownerCommission',
                    field: 'ownerCommission',
                    readOnly: false,
                    hidden: false,
                    columnWidth: 0.5
                },{
                    xtype: 'textfield',
                    fieldLabel: '客户佣金',
                    name: 'customerCommission',
                    objectName: 'customerCommission',
                    field: 'customerCommission',
                    readOnly: false,
                    hidden: false,
                    columnWidth: 0.5
                },{
                    xtype: 'textfield',
                    fieldLabel: '附加条款',
                    name: 'attachItem',
                    objectName: 'attachItem',
                    field: 'attachItem',
                    readOnly: false,
                    hidden: false,
                    columnWidth: 0.5
                },{
                    xtype: 'textfield',
                    fieldLabel: '备注信息',
                    name: 'remark',
                    objectName: 'remark',
                    field: 'remark',
                    readOnly: false,
                    hidden: false,
                    columnWidth: 0.5
                },{
                    xtype: 'textfield',
                    fieldLabel: '合同扫描件',
                    name: 'contractScanCopy',
                    objectName: 'contractScanCopy',
                    field: 'contractScanCopy',
                    readOnly: false,
                    hidden: false,
                    columnWidth: 0.5
                },{
                    xtype: 'textfield',
                    fieldLabel: '审核意见',
                    name: 'approveOpinion',
                    objectName: 'approveOpinion',
                    field: 'approveOpinion',
                    readOnly: false,
                    hidden: false,
                    columnWidth: 0.5
                },{
                    xtype: 'textfield',
                    fieldLabel: '登记日期',
                    name: 'inputDate',
                    objectName: 'inputDate',
                    field: 'inputDate',
                    readOnly: false,
                    hidden: false,
                    columnWidth: 0.5
                }],
                
                //new : 新增合同,info ： 查看合同,edit ：编辑合同,cancel ：取消合同，all ：所有合同
                buttons:[
                    { name : 'add_button', visible : true},
                    { name : 'query_button', visible : true},
                    { name : 'update_button', text:'更新合同信息' ,visible : true},
                    { name : 'delete_button', visible : true},
                ]
            };          
            
            
            var contractMessage = new com.lxq.js.GridAndForm.BaseGridAndForm(params);
			contractMessage.initGridAndForm();	

            var params2 = {
                    
                    /**panel渲染元素**/
                    divId : '${pageId}_2',
                    
                    /**项目名称**/
                    path: '${path}',
                
                    /**导出文件的名称**/
                    fileName: '合同任务列表',

                    /**弹出窗口标题**/
                    title: "系统合同任务",
                    
                    /**实体对象名称**/
                    entityName: '${entityName2}',
                    
                    /**action地址**/
                     actionUrl: "/baseAction",
                    
                    /**每页显示的记录数**/
                    pageSize: 15,
                    
                    /**grid 的sql from 语句**/
                    gridSql: 'from contract_message a,contrac_task b where a.uid = b.contracNo',
                    
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
                        field: 'b.uid' ,
                        header: '主键',
                        searchable: false,
                        hidden: true
                    },{
                        type: 'textfield',
                        name: 'contracNo',
                        field: 'b.contracNo',
                        header: '合同编号',
                        hidden: true
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
                        readOnly: true,
                        hidden: true
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
			
			var contracTaskMessage = new com.lxq.js.GridAndForm.BaseGridAndForm(params2);
			contracTaskMessage.initGridAndForm();
			
			//----上下型页面，上页面行点击，下页面重新加载--------------
			var contractMessagePanel = contractMessage.getGridPanel();
			
			//当上面grid行点击时，重新加载下面grid的数据
			contractMessagePanel.on( "rowclick" , function( gridPanel,rowIndex,e){
			
				var selModel = gridPanel.getSelectionModel();
			    if (selModel.hasSelection()) {//有选中行
			        var selected = selModel.getSelections();//获取选择的列
			        
			        var key_value = selected[0].data.uid;//获取选中的第一列，名为“uid”的属性的属性值
					
					contracTaskMessage.getNewPanel().getForm().setValues({
						contracNo : key_value
					});
					
					//重新加载下面gird的数据 
					contracTaskMessage.reloadGrid(encodeURI("a.uid='"+key_value+"'"));
				}
			})
			
		</script>
	</head>
	<body>
		<div id='${pageId}_1'></div>
		<div id='${pageId}_2'></div>
	</body>
</html>