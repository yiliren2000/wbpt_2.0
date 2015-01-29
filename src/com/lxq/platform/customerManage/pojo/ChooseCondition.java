package com.lxq.platform.customerManage.pojo;

import com.lxq.platform.systemManage.pojo.CodeLibrary;

/***********************************************************************
 * Module:  ChooseCondition.java
 * Author:  Administrator
 * Purpose: Defines the Class ChooseCondition
 ***********************************************************************/

/**
 * 选房条件
 * 
 * @pdOid 1057fed9-2c48-4549-a1cd-f83782410511
 */
public class ChooseCondition {
	/**
	 * 主键
	 * 
	 * @pdOid 0a4b9a3d-48d0-49eb-a0f5-5115d222fac9
	 */
	private int uid;
	/**
	 * 客源编号
	 * 
	 * @pdOid 3894beac-3022-43db-bc80-907b82a75e2b
	 */
	private String customerNo;
	/**
	 * 需求区县
	 * 
	 * @pdOid a0739678-886c-4e77-816b-06e63d44b108
	 */
	private String county;
	/**
	 * 需求小区
	 * 
	 * @pdOid 8bcf03fe-f95a-474b-b4c4-a0fde5ee148c
	 */
	private String zone;
	/**
	 * 需求板块
	 * 
	 * @pdOid 08523de4-07ed-4d87-ba67-498402ff5c7e
	 */
	private String plate;
	/**
	 * 主要街道
	 * 
	 * @pdOid dca02208-5c96-4991-912d-261a36996ab2
	 */
	private String street;
	/**
	 * 客盘类型
	 * 
	 * @pdOid 1ce96f2f-70c4-49b0-a6d7-7ba7ea2cb5c6
	 */
	private CodeLibrary buildType;
	/**
	 * 房屋面积
	 * 
	 * @pdOid 14fed9ad-6c37-4c1f-87fe-8314f26f0eed
	 */
	private String houseArea;
	/**
	 * 楼层
	 * 
	 * @pdOid 129cad88-a4e0-4f37-aac5-cf9a28f5e3e4
	 */
	private String floor;
	/**
	 * 客源状态
	 * 
	 * @pdOid 304ef532-777b-4b28-88bb-a843f4c045c5
	 */
	private CodeLibrary customerStatus;
	/**
	 * 房源类型
	 * 
	 * @pdOid b2e277ba-ade8-4243-9257-b1c77549c599
	 */
	private CodeLibrary sourceType;
	/**
	 * 户型
	 * 
	 * @pdOid 94c35516-87b5-478a-84c1-7c272d317946
	 */
	private CodeLibrary houseType;
	/**
	 * 装修程度
	 * 
	 * @pdOid b1a14a75-c5f7-49e4-aa75-c90e15a18b10
	 */
	private CodeLibrary decorateDegree;
	/**
	 * 房屋朝向
	 * 
	 * @pdOid 41064a0d-785d-4f4b-89a1-ce89f5b85c65
	 */
	private CodeLibrary direction;
	/**
	 * 产权类型
	 * 
	 * @pdOid 830e3f15-cad3-4eb3-b236-de04550f8211
	 */
	private CodeLibrary rightType;
	/**
	 * 建筑年代
	 * 
	 * @pdOid 31a1a512-c421-41d2-a215-7740d99586ec
	 */
	private String buildArea;
	/**
	 * 来源
	 * 
	 * @pdOid f44aa6c4-6ca7-4007-a45a-1d40157b7357
	 */
	private CodeLibrary source;
	/**
	 * 交通状况
	 * 
	 * @pdOid 05a55df6-1637-43b0-8071-9352317c2eb5
	 */
	private String traffic;
	/**
	 * 客源备注
	 * 
	 * @pdOid e03de5b2-7a33-4e39-96ae-199e7cdc9181
	 */
	private String remark;
	/**
	 * 总价格
	 * 
	 * @pdOid 7275aaba-201e-47a6-8897-b4988dfc5966
	 */
	private String totalPrice;
	/**
	 * 单价
	 * 
	 * @pdOid 6a4db0d3-a582-4207-aafe-d95be41d4fc5
	 */
	private String unitPrice;
	/**
	 * 付款方式
	 * 
	 * @pdOid 41d3a0b2-3ffe-4980-addd-fa35af8a055a
	 */
	private CodeLibrary payMode;
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
    public String getPlate() {
        return plate;
    }
    public void setPlate(String plate) {
        this.plate = plate;
    }
    public String getStreet() {
        return street;
    }
    public void setStreet(String street) {
        this.street = street;
    }
    public CodeLibrary getBuildType() {
        return buildType;
    }
    public void setBuildType(CodeLibrary buildType) {
        this.buildType = buildType;
    }
    public String getHouseArea() {
        return houseArea;
    }
    public void setHouseArea(String houseArea) {
        this.houseArea = houseArea;
    }
    public String getFloor() {
        return floor;
    }
    public void setFloor(String floor) {
        this.floor = floor;
    }
    public CodeLibrary getCustomerStatus() {
        return customerStatus;
    }
    public void setCustomerStatus(CodeLibrary customerStatus) {
        this.customerStatus = customerStatus;
    }
    public CodeLibrary getSourceType() {
        return sourceType;
    }
    public void setSourceType(CodeLibrary sourceType) {
        this.sourceType = sourceType;
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
    public CodeLibrary getDirection() {
        return direction;
    }
    public void setDirection(CodeLibrary direction) {
        this.direction = direction;
    }
    public CodeLibrary getRightType() {
        return rightType;
    }
    public void setRightType(CodeLibrary rightType) {
        this.rightType = rightType;
    }
    public String getBuildArea() {
        return buildArea;
    }
    public void setBuildArea(String buildArea) {
        this.buildArea = buildArea;
    }
    public CodeLibrary getSource() {
        return source;
    }
    public void setSource(CodeLibrary source) {
        this.source = source;
    }
    public String getTraffic() {
        return traffic;
    }
    public void setTraffic(String traffic) {
        this.traffic = traffic;
    }
    public String getRemark() {
        return remark;
    }
    public void setRemark(String remark) {
        this.remark = remark;
    }
    public String getTotalPrice() {
        return totalPrice;
    }
    public void setTotalPrice(String totalPrice) {
        this.totalPrice = totalPrice;
    }
    public String getUnitPrice() {
        return unitPrice;
    }
    public void setUnitPrice(String unitPrice) {
        this.unitPrice = unitPrice;
    }
    public CodeLibrary getPayMode() {
        return payMode;
    }
    public void setPayMode(CodeLibrary payMode) {
        this.payMode = payMode;
    }
}