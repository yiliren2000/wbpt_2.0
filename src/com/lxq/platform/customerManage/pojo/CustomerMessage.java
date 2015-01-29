package com.lxq.platform.customerManage.pojo;

import java.util.Set;

import com.lxq.platform.systemManage.pojo.CodeLibrary;

/***********************************************************************
 * Module:  CustomerMessage.java
 * Author:  Administrator
 * Purpose: Defines the Class CustomerMessage
 ***********************************************************************/

/**
 * 客户信息
 * 
 * @pdOid c1a81c19-37ee-4430-995f-3eddaa30a623
 */
public class CustomerMessage {
	/**
	 * 主键
	 * 
	 * @pdOid 3ceda34c-99ac-4adf-8adc-06f7af41309b
	 */
	private int uid;
	/**
	 * 客户编号
	 * 
	 * @pdOid ac922afc-446a-44f3-8dfa-94c133232fcf
	 */
	private String customerNo;
	/**
	 * 客户姓名
	 * 
	 * @pdOid cd9899c9-bdb8-48bb-aeec-8bf4b9c94068
	 */
	private String name;
	/**
	 * 客户性别
	 * 
	 * @pdOid 510430ea-1e5b-482b-b8fa-6a177033f050
	 */
	private CodeLibrary gender;
	/**
	 * 联系电话
	 * 
	 * @pdOid 8661bafa-4e24-4e8e-9bc3-f319f2e0315b
	 */
	private String phone;
	/**
	 * 客户类型
	 * 
	 * @pdOid 04141c6e-9f81-4b0a-a0b2-186431b6d062
	 */
	private CodeLibrary customerType;
	/**
	 * 身份证号
	 * 
	 * @pdOid 47d01cfd-3239-45ed-a24d-aa47cbee0dc5
	 */
	private String identityCard;
	/**
	 * 身份证扫描件
	 * 
	 * @pdOid 02cfe63a-9494-4d48-be61-1a4ccf7b79c9
	 */
	private String IDScanCopy;
	/**
	 * 客户备注
	 * 
	 * @pdOid d11c97a2-f4d0-48da-89c3-64d04cdfed19
	 */
	private String rmark;
	/**
	 * 客户联系地址
	 * 
	 * @pdOid 552dbf82-9cca-414a-b7d2-d7564122b36c
	 */
	private String address;
	/**
	 * 选房条件
	 * 
	 * @pdOid 552dbf82-9cca-414a-b7d2-d7564122b36c
	 */
	private Set<ChooseCondition> chooseCondition;
    public int getUid() {
        return uid;
    }
    public void setUid(int uid) {
        this.uid = uid;
    }
    public String getCustomerNo() {
        return customerNo;
    }
    public void setCustomerNo(String customerNo) {
        this.customerNo = customerNo;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public CodeLibrary getGender() {
        return gender;
    }
    public void setGender(CodeLibrary gender) {
        this.gender = gender;
    }
    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public CodeLibrary getCustomerType() {
        return customerType;
    }
    public void setCustomerType(CodeLibrary customerType) {
        this.customerType = customerType;
    }
    public String getIdentityCard() {
        return identityCard;
    }
    public void setIdentityCard(String identityCard) {
        this.identityCard = identityCard;
    }
    public String getIDScanCopy() {
        return IDScanCopy;
    }
    public void setIDScanCopy(String iDScanCopy) {
        IDScanCopy = iDScanCopy;
    }
    public String getRmark() {
        return rmark;
    }
    public void setRmark(String rmark) {
        this.rmark = rmark;
    }
    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }
	public Set<ChooseCondition> getChooseCondition() {
		return chooseCondition;
	}
	public void setChooseCondition(Set<ChooseCondition> chooseCondition) {
		this.chooseCondition = chooseCondition;
	}
}