package com.lxq.platform.businessManage.pojo;

import com.lxq.platform.userManage.pojo.User;

public class Remind {
    
    /**主键*/
    private int uid;
	
    /**任务内容*/
    private String content;
    
    /**开始时间*/
    private String startTime;
    
    /**结束时间*/
    private String endTime;
    
    /**所属用户*/
    private User owner;

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public User getOwner() {
        return owner;
    }

    public void setOwner(User owner) {
        this.owner = owner;
    }
    
}