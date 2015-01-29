package com.lxq.platform.houseManage.pojo;

import java.util.Set;

import com.lxq.platform.systemManage.pojo.CodeLibrary;

/***********************************************************************
 * Module:  OwnerMessage.java
 * Author:  Administrator
 * Purpose: Defines the Class OwnerMessage
 ***********************************************************************/

/**
 * 业主信息
 * 
 * @pdOid 12596792-c6e8-4966-8f99-b06ebe60da92
 */
public class OwnerMessage {
	/**
	 * 主键
	 * 
	 * @pdOid 21c8587d-2be5-4824-8360-cb9dde3d41fb
	 */
	private int uid;
	/** @pdOid ee670913-5ecc-4970-8d46-e5cf42a9a480 */
	private String name;
	/** @pdOid 41fa960f-637d-4d74-91f7-5133d8ae2ffe */
	private CodeLibrary gender;
	/** @pdOid fb2ec9c0-8b91-400a-9f97-cb3e2561677e */
	private CodeLibrary ownerType;
	/** @pdOid 50dca1b1-b3c2-4cdb-946c-53eff0f5bea4 */
	private String phone;
	/** @pdOid 70fabf0d-4f81-40d4-8c4a-82bb48d38327 */
	private String identityCard;
	/** @pdOid 1933e7ec-c5af-48e6-b29c-fdcf024f10ad */
	private String IDScanCopy;
	/** @pdOid a51e68db-3424-4907-a70e-24f3c97bd36e */
	private String ownerMemo;
	private Set<HouseMessage> houseMessage;
    public int getUid() {
        return uid;
    }
    public void setUid(int uid) {
        this.uid = uid;
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
    public CodeLibrary getOwnerType() {
        return ownerType;
    }
    public void setOwnerType(CodeLibrary ownerType) {
        this.ownerType = ownerType;
    }
    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
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
    public String getOwnerMemo() {
        return ownerMemo;
    }
    public void setOwnerMemo(String ownerMemo) {
        this.ownerMemo = ownerMemo;
    }
	public Set<HouseMessage> getHouseMessage() {
		return houseMessage;
	}
	public void setHouseMessage(Set<HouseMessage> houseMessage) {
		this.houseMessage = houseMessage;
	}
}