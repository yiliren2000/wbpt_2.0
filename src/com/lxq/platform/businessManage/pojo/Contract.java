package com.lxq.platform.businessManage.pojo;

import java.util.Set;

import com.lxq.platform.systemManage.pojo.CodeLibrary;

/***********************************************************************
 * Module:  Contract.java
 * Author:  Administrator
 * Purpose: Defines the Class Contract
 ***********************************************************************/

/**
 * 合同信息
 * 
 * @pdOid 57f45cb6-dd97-4a3d-88ed-bdbbf1603725
 */
public class Contract {
	/**
	 * 主键
	 * 
	 * @pdOid 592f482e-f62e-4dfe-b0a9-7021c743827c
	 */
	private int uid;
	/**
	 * 合同编号
	 * 
	 * @pdOid ddf52c57-a40f-4776-9869-92628e436fc2
	 */
	private String contracNo;
	/**
	 * 业务类型
	 * 
	 * @pdOid 78d91d60-0023-4f4e-a3bd-9ac23f284ae3
	 */
	private CodeLibrary businessType;
	/**
	 * 房源编号
	 * 
	 * @pdOid d3d60458-ab3c-4e19-b684-9c564597d4b5
	 */
	private String houseNo;
	/**
	 * 客源编号
	 * 
	 * @pdOid af6fcd57-95a0-47c9-af6f-0e1c62e20695
	 */
	private String customerNo;
	/**
	 * 合同金额
	 * 
	 * @pdOid 7523b5de-58e7-4ffe-8fd6-db0e7f5ed893
	 */
	private String contractSum;
	/**
	 * 签定日期
	 * 
	 * @pdOid 24c94e10-0894-4dd1-b95d-6fa08171d918
	 */
	private String signDate;
	/**
	 * 签约人员
	 * 
	 * @pdOid e2aa1f58-54f1-4dcf-9a23-97f46e62b9c3
	 */
	private String signPerson;
	/**
	 * 登记人
	 * 
	 * @pdOid 94ebcfc2-a9bb-447f-8074-36a11bd98c14
	 */
	private String inputPerson;
	/**
	 * 业主姓名
	 * 
	 * @pdOid 7e2c9222-07d0-441c-8515-709f94111e46
	 */
	private String ownerName;
	/**
	 * 业主电话
	 * 
	 * @pdOid 5a56f884-a331-4360-9721-d7b27259c620
	 */
	private String ownerPhone;
	/**
	 * 业主身份证号
	 * 
	 * @pdOid ea0a2df8-5314-4d3f-b717-76457e017fcc
	 */
	private String ownerIdentityCard;
	/**
	 * 业主身份证扫描件
	 * 
	 * @pdOid 71692fd6-81b1-4138-b3d2-2cd11c202fd1
	 */
	private String ownerIDScanCopy;
	/**
	 * 业主联系地址
	 * 
	 * @pdOid e745704f-f28d-4586-b67e-89b64368490e
	 */
	private String ownerAddress;
	/**
	 * 业主佣金
	 * 
	 * @pdOid 159c3ed3-d5b8-4a8e-9ce1-ec21e9e52825
	 */
	private String ownerCommission;
	/**
	 * 客户佣金
	 * 
	 * @pdOid 395912e0-0c1a-47ac-a099-00343665d937
	 */
	private String customerCommission;
	/**
	 * 附加条款
	 * 
	 * @pdOid d8791035-55ff-45b4-b9dd-45364098ed69
	 */
	private String attachItem;
	/**
	 * 备注信息
	 * 
	 * @pdOid 858484b7-1a7f-4243-86d3-7ba1ea6cd505
	 */
	private String remark;
	/**
	 * 合同扫描件
	 * 
	 * @pdOid 4aaf36aa-8fbf-4e8c-960a-51dbb7aa1c3e
	 */
	private String contractScanCopy;
	/**
	 * 审核意见
	 * 
	 * @pdOid 38ba8e7e-33e0-4542-9ef2-35aeead8fc02
	 */
	private String approveOpinion;
	/**
	 * 登记日期
	 * 
	 * @pdOid 9a9764ea-153e-414d-87fd-c1db1da7eb6e
	 */
	private String inputDate;
	/**
	 * 任务信息
	 * 
	 * @pdOid 9a9764ea-153e-414d-87fd-c1db1da7eb6e
	 */
	private Set<ContracTask> contractTask;
	/**
	 * 业绩信息
	 * 
	 * @pdOid 9a9764ea-153e-414d-87fd-c1db1da7eb6e
	 */
	private Set<ResultDistribute> resultDistribute;

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getContracNo() {
		return contracNo;
	}

	public void setContracNo(String contracNo) {
		this.contracNo = contracNo;
	}

	public CodeLibrary getBusinessType() {
		return businessType;
	}

	public void setBusinessType(CodeLibrary businessType) {
		this.businessType = businessType;
	}

	public String getHouseNo() {
		return houseNo;
	}

	public void setHouseNo(String houseNo) {
		this.houseNo = houseNo;
	}

	public String getCustomerNo() {
		return customerNo;
	}

	public void setCustomerNo(String customerNo) {
		this.customerNo = customerNo;
	}

	public String getContractSum() {
		return contractSum;
	}

	public void setContractSum(String contractSum) {
		this.contractSum = contractSum;
	}

	public String getSignDate() {
		return signDate;
	}

	public void setSignDate(String signDate) {
		this.signDate = signDate;
	}

	public String getSignPerson() {
		return signPerson;
	}

	public void setSignPerson(String signPerson) {
		this.signPerson = signPerson;
	}

	public String getInputPerson() {
		return inputPerson;
	}

	public void setInputPerson(String inputPerson) {
		this.inputPerson = inputPerson;
	}

	public String getOwnerName() {
		return ownerName;
	}

	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}

	public String getOwnerPhone() {
		return ownerPhone;
	}

	public void setOwnerPhone(String ownerPhone) {
		this.ownerPhone = ownerPhone;
	}

	public String getOwnerIdentityCard() {
		return ownerIdentityCard;
	}

	public void setOwnerIdentityCard(String ownerIdentityCard) {
		this.ownerIdentityCard = ownerIdentityCard;
	}

	public String getOwnerIDScanCopy() {
		return ownerIDScanCopy;
	}

	public void setOwnerIDScanCopy(String ownerIDScanCopy) {
		this.ownerIDScanCopy = ownerIDScanCopy;
	}

	public String getOwnerAddress() {
		return ownerAddress;
	}

	public void setOwnerAddress(String ownerAddress) {
		this.ownerAddress = ownerAddress;
	}

	public String getOwnerCommission() {
		return ownerCommission;
	}

	public void setOwnerCommission(String ownerCommission) {
		this.ownerCommission = ownerCommission;
	}

	public String getCustomerCommission() {
		return customerCommission;
	}

	public void setCustomerCommission(String customerCommission) {
		this.customerCommission = customerCommission;
	}

	public String getAttachItem() {
		return attachItem;
	}

	public void setAttachItem(String attachItem) {
		this.attachItem = attachItem;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getContractScanCopy() {
		return contractScanCopy;
	}

	public void setContractScanCopy(String contractScanCopy) {
		this.contractScanCopy = contractScanCopy;
	}

	public String getApproveOpinion() {
		return approveOpinion;
	}

	public void setApproveOpinion(String approveOpinion) {
		this.approveOpinion = approveOpinion;
	}

	public String getInputDate() {
		return inputDate;
	}

	public void setInputDate(String inputDate) {
		this.inputDate = inputDate;
	}

	public Set<ContracTask> getContractTask() {
		return contractTask;
	}

	public void setContractTask(Set<ContracTask> contractTask) {
		this.contractTask = contractTask;
	}

	public Set<ResultDistribute> getResultDistribute() {
		return resultDistribute;
	}

	public void setResultDistribute(Set<ResultDistribute> resultDistribute) {
		this.resultDistribute = resultDistribute;
	}
}