package com.lxq.platform.houseManage.pojo;

import com.lxq.platform.systemManage.pojo.CodeLibrary;

/***********************************************************************
 * Module:  HouseMessage.java
 * Author:  Administrator
 * Purpose: Defines the Class HouseMessage
 ***********************************************************************/

/**
 * 房源信息
 * 
 * @pdOid 31d43459-e987-40a7-80bf-482d1892b1a5
 */
public class HouseMessage {
	/**
	 * 主键
	 * 
	 * @pdOid 74d7bf14-b8d4-4ea1-bea6-f08cd9ebe303
	 */
	private int uid;
	/**
	 * 付款方式
	 * 
	 * @pdOid 9b406b1c-e987-41fa-ac08-af9ffdea7ac4
	 */
	private CodeLibrary payMode;
	/**
	 * 城市
	 * 
	 * @pdOid abfa2a75-479e-4937-a203-d53b326dcf7a
	 */
	private String city;
	/**
	 * 区县
	 * 
	 * @pdOid 8a2c90a8-df83-4a69-88d9-da593a697757
	 */
	private String county;
	/**
	 * 小区（街道）
	 * 
	 * @pdOid 51adb249-0295-44a2-8768-7868ebbe9a68
	 */
	private String zone;
	/**
	 * 栋号
	 * 
	 * @pdOid 48c283de-81b6-4385-b9ed-31f35e9dd735
	 */
	private String buildNo;
	/**
	 * 单元号
	 * 
	 * @pdOid 5409be70-ad35-4119-a724-276bd1f41abf
	 */
	private String unitNo;
	/**
	 * 总层
	 * 
	 * @pdOid 4ac3ea99-ba52-4ace-8b0f-088ec19d7ed5
	 */
	private String allFloor;
	/**
	 * 楼层
	 * 
	 * @pdOid 5ef1b621-c6d1-4e6d-800a-0aeb47c88a77
	 */
	private String floor;
	/**
	 * 门牌号
	 * 
	 * @pdOid 08385699-8b1a-432b-bac5-68e7c5f683a8
	 */
	private String doorNo;
	/**
	 * 朝向
	 * 
	 * @pdOid cf5a6b85-405f-4a6c-bdd7-ab1403a3b3a0
	 */
	private CodeLibrary direction;
	/**
	 * 建造年代
	 * 
	 * @pdOid 858dfb78-6dcf-4ac6-aee8-a10d2dc00a28
	 */
	private String buildYear;
	/**
	 * 房型
	 * 
	 * @pdOid b8bdbffc-3986-4778-aedb-cec521ff6bf1
	 */
	private CodeLibrary houseType;
	/**
	 * 装修程度
	 * 
	 * @pdOid 06747b20-6c91-4749-ae83-cb4199e8fc9b
	 */
	private CodeLibrary decorateDegree;
	/**
	 * 性质
	 * 
	 * @pdOid 772e4751-4a4b-49b3-bd8b-218e00a706f4
	 */
	private CodeLibrary property;
	/**
	 * 房产类型
	 * 
	 * @pdOid e50404a9-0f94-4b1e-98fa-4cd583a45675
	 */
	private CodeLibrary buildType;
	/**
	 * 产权类型
	 * 
	 * @pdOid c76df4dd-ce6f-4744-baaf-a5e4a0ba9ef5
	 */
	private CodeLibrary rightType;
	/**
	 * 产权年限
	 * 
	 * @pdOid 4db2cd0d-8212-4d3a-a633-e2dc67cb0a89
	 */
	private String rightYear;
	/**
	 * 建筑面积
	 * 
	 * @pdOid bc91919f-8198-4746-8610-3890d1498972
	 */
	private String buildArea;
	/**
	 * 使用面积
	 * 
	 * @pdOid 9138ac0a-b1d2-44dd-9744-1466df505991
	 */
	private String useArea;
	/**
	 * 来源
	 * 
	 * @pdOid bf3f6d3a-0674-4f19-a653-f1a83ab1342e
	 */
	private CodeLibrary source;
	/**
	 * 结构
	 * 
	 * @pdOid edeb6904-b1d2-4e6c-b0a4-f56385234866
	 */
	private CodeLibrary structure;
	/**
	 * 产证
	 * 
	 * @pdOid e1e25c73-fe23-4897-81b9-10e1c1aac4fc
	 */
	private String license;
	/**
	 * 设施
	 * 
	 * @pdOid c5b5e07e-3586-440b-b00b-d34bc0472a89
	 */
	private String facility;
	/**
	 * 交通情况
	 * 
	 * @pdOid 99751878-8991-4fbb-98bf-db6d7d8d2810
	 */
	private String traffic;
	/**
	 * 公开备注
	 * 
	 * @pdOid 0623d56f-e7b1-40e4-b072-dcede930fa8f
	 */
	private String pubilcRemark;
	/**
	 * 保密备注
	 * 
	 * @pdOid 58099804-56f9-4a6f-906b-f802cf73d396
	 */
	private String privateRemark;
	/**
	 * 钥匙编号
	 * 
	 * @pdOid b15e9cda-2472-4084-aa56-15c65a26e52d
	 */
	private String keyNo;
	/**
	 * 车库说明
	 * 
	 * @pdOid d09d87ec-95f4-47ee-89b5-43a0700edfa8
	 */
	private String garageDesc;
	/**
	 * 总价
	 * 
	 * @pdOid 45b8d7cd-24cc-4e69-840f-55c2f37b2b0e
	 */
	private String totalPrice;
	/**
	 * 发布时间
	 * 
	 * @pdOid bddf89ef-791e-40cc-a678-02d4f480ed04
	 */
	private String publishTime;
	/**
	 * 房源编号
	 * 
	 * @pdOid 08edd9e0-892c-49df-9c9c-95814aa97785
	 */
	private String houseNo;
	/**
	 * 状态
	 * 
	 * @pdOid 8d89b51f-7a91-4276-bc27-dd60bcdf69d1
	 */
	private CodeLibrary status;
	/**
	 * 价格条件
	 * 
	 * @pdOid da94e177-bac1-436a-ac50-e93ba5ce85cc
	 */
	private CodeLibrary priceCondition;
	/**
	 * 看房方式
	 * 
	 * @pdOid a30918b4-a71c-41fe-bb3b-5e8daef34bf4
	 */
	private CodeLibrary viewMethod;
	/**
	 * 单价
	 * 
	 * @pdOid 42d8fafe-e67e-4a1f-a1f2-6645ddf8de48
	 */
	private String unitPrice;
	/**
	 * 更新时间
	 * 
	 * @pdOid 01b0ce89-fed8-4344-bc38-45506def766d
	 */
	private String updateTime;
	/**
	 * 创建人
	 * 
	 * @pdOid 40cb30f5-7a20-444f-840e-27c4cb04fb95
	 */
	private String createPerson;
	/**
	 * 业主信息
	 * 
	 * @pdOid 7bb9fc5e-5b41-4838-a2fd-4abd3a59833b
	 */
	private OwnerMessage ownerMessage;
	/**
	 * 房源图片
	 * 
	 * @pdOid 7bb9fc5e-5b41-4838-a2fd-4abd3a59833b
	 */
	private String housePicture;
    public int getUid() {
        return uid;
    }
    public void setUid(int uid) {
        this.uid = uid;
    }
    public CodeLibrary getPayMode() {
        return payMode;
    }
    public void setPayMode(CodeLibrary payMode) {
        this.payMode = payMode;
    }
    public String getCity() {
        return city;
    }
    public void setCity(String city) {
        this.city = city;
    }
    public String getCounty() {
        return county;
    }
    public void setCounty(String county) {
        this.county = county;
    }
    public String getZone() {
        return zone;
    }
    public void setZone(String zone) {
        this.zone = zone;
    }
    public String getBuildNo() {
        return buildNo;
    }
    public void setBuildNo(String buildNo) {
        this.buildNo = buildNo;
    }
    public String getUnitNo() {
        return unitNo;
    }
    public void setUnitNo(String unitNo) {
        this.unitNo = unitNo;
    }
    public String getAllFloor() {
        return allFloor;
    }
    public OwnerMessage getOwnerMessage() {
		return ownerMessage;
	}
	public void setOwnerMessage(OwnerMessage ownerMessage) {
		this.ownerMessage = ownerMessage;
	}
	public void setAllFloor(String allFloor) {
        this.allFloor = allFloor;
    }
    public String getFloor() {
        return floor;
    }
    public void setFloor(String floor) {
        this.floor = floor;
    }
    public String getDoorNo() {
        return doorNo;
    }
    public void setDoorNo(String doorNo) {
        this.doorNo = doorNo;
    }
    public CodeLibrary getDirection() {
        return direction;
    }
    public void setDirection(CodeLibrary direction) {
        this.direction = direction;
    }
    public String getBuildYear() {
        return buildYear;
    }
    public void setBuildYear(String buildYear) {
        this.buildYear = buildYear;
    }
    public CodeLibrary getHouseType() {
        return houseType;
    }
    public void setHouseType(CodeLibrary houseType) {
        this.houseType = houseType;
    }
    public CodeLibrary getDecorateDegree() {
        return decorateDegree;
    }
    public void setDecorateDegree(CodeLibrary decorateDegree) {
        this.decorateDegree = decorateDegree;
    }
    public CodeLibrary getProperty() {
        return property;
    }
    public void setProperty(CodeLibrary property) {
        this.property = property;
    }
    public CodeLibrary getBuildType() {
        return buildType;
    }
    public void setBuildType(CodeLibrary buildType) {
        this.buildType = buildType;
    }
    public CodeLibrary getRightType() {
        return rightType;
    }
    public void setRightType(CodeLibrary rightType) {
        this.rightType = rightType;
    }
    public String getRightYear() {
        return rightYear;
    }
    public void setRightYear(String rightYear) {
        this.rightYear = rightYear;
    }
    public String getBuildArea() {
        return buildArea;
    }
    public void setBuildArea(String buildArea) {
        this.buildArea = buildArea;
    }
    public String getUseArea() {
        return useArea;
    }
    public void setUseArea(String useArea) {
        this.useArea = useArea;
    }
    public CodeLibrary getSource() {
        return source;
    }
    public void setSource(CodeLibrary source) {
        this.source = source;
    }
    public CodeLibrary getStructure() {
        return structure;
    }
    public void setStructure(CodeLibrary structure) {
        this.structure = structure;
    }
    public String getLicense() {
        return license;
    }
    public void setLicense(String license) {
        this.license = license;
    }
    public String getFacility() {
        return facility;
    }
    public void setFacility(String facility) {
        this.facility = facility;
    }
    public String getTraffic() {
        return traffic;
    }
    public void setTraffic(String traffic) {
        this.traffic = traffic;
    }
    public String getPubilcRemark() {
        return pubilcRemark;
    }
    public void setPubilcRemark(String pubilcRemark) {
        this.pubilcRemark = pubilcRemark;
    }
    public String getPrivateRemark() {
        return privateRemark;
    }
    public void setPrivateRemark(String privateRemark) {
        this.privateRemark = privateRemark;
    }
    public String getKeyNo() {
        return keyNo;
    }
    public void setKeyNo(String keyNo) {
        this.keyNo = keyNo;
    }
    public String getGarageDesc() {
        return garageDesc;
    }
    public void setGarageDesc(String garageDesc) {
        this.garageDesc = garageDesc;
    }
    public String getTotalPrice() {
        return totalPrice;
    }
    public void setTotalPrice(String totalPrice) {
        this.totalPrice = totalPrice;
    }
    public String getPublishTime() {
        return publishTime;
    }
    public void setPublishTime(String publishTime) {
        this.publishTime = publishTime;
    }
    public String getHouseNo() {
        return houseNo;
    }
    public void setHouseNo(String houseNo) {
        this.houseNo = houseNo;
    }
    public CodeLibrary getStatus() {
        return status;
    }
    public void setStatus(CodeLibrary status) {
        this.status = status;
    }
    public CodeLibrary getPriceCondition() {
        return priceCondition;
    }
    public void setPriceCondition(CodeLibrary priceCondition) {
        this.priceCondition = priceCondition;
    }
    public CodeLibrary getViewMethod() {
        return viewMethod;
    }
    public void setViewMethod(CodeLibrary viewMethod) {
        this.viewMethod = viewMethod;
    }
    public String getUnitPrice() {
        return unitPrice;
    }
    public void setUnitPrice(String unitPrice) {
        this.unitPrice = unitPrice;
    }
    public String getUpdateTime() {
        return updateTime;
    }
    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }
    public String getCreatePerson() {
        return createPerson;
    }
    public void setCreatePerson(String createPerson) {
        this.createPerson = createPerson;
    }
    public String getHousePicture() {
        return housePicture;
    }
    public void setHousePicture(String housePicture) {
        this.housePicture = housePicture;
    }
}