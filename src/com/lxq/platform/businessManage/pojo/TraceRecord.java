package com.lxq.platform.businessManage.pojo;

import com.lxq.platform.systemManage.pojo.CodeLibrary;

/***********************************************************************
 * Module:  TraceRecord.java
 * Author:  Administrator
 * Purpose: Defines the Class TraceRecord
 ***********************************************************************/

/**
 * 跟进记录
 * 
 * @pdOid 21dc6e30-865c-46a1-810e-9bb1d939cf83
 */
public class TraceRecord {
	/**
	 * 主键
	 * 
	 * @pdOid d0889ad2-6aca-4a2e-8963-7666a20de857
	 */
	private int uid;
	/**
	 * 跟进类型
	 * 
	 * @pdOid a2580289-9e07-413d-862a-d95af0687a2d
	 */
	private CodeLibrary traceType;
	/**
	 * 业务类型
	 * 
	 * @pdOid ec9fa172-5b17-4c07-8165-482a80981a81
	 */
	private CodeLibrary businessType;
	/**
	 * 跟进说明
	 * 
	 * @pdOid 70af697b-8395-49ac-9306-af48f1988038
	 */
	private String traceDesc;
	/**
	 * 跟进人
	 * 
	 * @pdOid aa3399e5-a0c5-4052-b7d5-8464e922708e
	 */
	private String tracePerson;
	/**
	 * 跟进时间
	 * 
	 * @pdOid e344e755-49ab-411d-9f64-69e9637a9a8b
	 */
	private String traceTime;
	/**
	 * 跟进对象编号
	 * 
	 * @pdOid 3c782991-3c83-457e-803b-4b3192e1ee49
	 */
	private int traceObj;

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public CodeLibrary getTraceType() {
		return traceType;
	}

	public void setTraceType(CodeLibrary traceType) {
		this.traceType = traceType;
	}

	public CodeLibrary getBusinessType() {
		return businessType;
	}

	public void setBusinessType(CodeLibrary businessType) {
		this.businessType = businessType;
	}

	public String getTraceDesc() {
		return traceDesc;
	}

	public void setTraceDesc(String traceDesc) {
		this.traceDesc = traceDesc;
	}

	public String getTracePerson() {
		return tracePerson;
	}

	public void setTracePerson(String tracePerson) {
		this.tracePerson = tracePerson;
	}

	public String getTraceTime() {
		return traceTime;
	}

	public void setTraceTime(String traceTime) {
		this.traceTime = traceTime;
	}

	public int getTraceObj() {
		return traceObj;
	}

	public void setTraceObj(int traceObj) {
		this.traceObj = traceObj;
	}
}