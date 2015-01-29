package com.lxq.platform.businessManage.pojo;

import com.lxq.platform.systemManage.pojo.CodeLibrary;

/***********************************************************************
 * Module:  ResultDistribute.java
 * Author:  Administrator
 * Purpose: Defines the Class ResultDistribute
 ***********************************************************************/

/**
 * 业绩分成表
 * 
 * @pdOid 85bb1232-64bd-4e0a-833f-34ee87de0323
 */
public class ResultDistribute {
	/**
	 * 主键
	 * 
	 * @pdOid 6e724fa6-dc08-46bc-8c73-d867d51882b2
	 */
	private int uid;
	/**
	 * 合同编号
	 * 
	 * @pdOid d561cc0b-bda1-43dd-bdff-996ea76699b0
	 */
	private String contracNo;
	/**
	 * 佣金总额
	 * 
	 * @pdOid 9cdc3d97-5a2a-410b-80b8-ca92fa87d92d
	 */
	private String commissionSum;
	/**
	 * 可分业绩
	 * 
	 * @pdOid 81a98670-9da1-4180-a219-4eda4c9c1b0c
	 */
	private String validResult;
	/**
	 * 业绩归属人
	 * 
	 * @pdOid b1ea3eaf-bf11-4053-b181-b644bd355774
	 */
	private String resultOwner;
	/**
	 * 分成比例
	 * 
	 * @pdOid ebbdb77b-80b8-4ce7-b8fd-fd082b51eca3
	 */
	private String resultRatio;
	/**
	 * 业绩日期
	 * 
	 * @pdOid 734c2991-98c0-4263-99a7-0c652bbad36f
	 */
	private String resultDate;
	/**
	 * 分成说明
	 * 
	 * @pdOid ca968b5e-6e44-406a-8614-432b38f2ec4e
	 */
	private String distributeDesc;
	/**
	 * 业绩类型
	 * 
	 * @pdOid 86606b6d-67c7-4b82-a2c3-0823b7bc857c
	 */
	private CodeLibrary resultType;
	/**
	 * 合同信息
	 * 
	 * @pdOid 86606b6d-67c7-4b82-a2c3-0823b7bc857c
	 */
	private Contract contract;

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

	public String getCommissionSum() {
		return commissionSum;
	}

	public void setCommissionSum(String commissionSum) {
		this.commissionSum = commissionSum;
	}

	public String getValidResult() {
		return validResult;
	}

	public void setValidResult(String validResult) {
		this.validResult = validResult;
	}

	public String getResultOwner() {
		return resultOwner;
	}

	public void setResultOwner(String resultOwner) {
		this.resultOwner = resultOwner;
	}

	public String getResultRatio() {
		return resultRatio;
	}

	public void setResultRatio(String resultRatio) {
		this.resultRatio = resultRatio;
	}

	public String getResultDate() {
		return resultDate;
	}

	public void setResultDate(String resultDate) {
		this.resultDate = resultDate;
	}

	public String getDistributeDesc() {
		return distributeDesc;
	}

	public void setDistributeDesc(String distributeDesc) {
		this.distributeDesc = distributeDesc;
	}

	public CodeLibrary getResultType() {
		return resultType;
	}

	public void setResultType(CodeLibrary resultType) {
		this.resultType = resultType;
	}

	public Contract getContract() {
		return contract;
	}

	public void setContract(Contract contract) {
		this.contract = contract;
	}
}