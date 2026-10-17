package com.example.case_study.enity;

import java.util.Date;

public class Message {
    private int id;
    private int senderId;
    private int receiverId;
    private String content;
    private boolean isRead;
    private Date createTime;

    public Message() {
    }

    public Message(int senderId, int receiverId, String content, boolean isRead, Date createTime) {
        this.senderId = senderId;
        this.receiverId = receiverId;
        this.content = content;
        this.isRead = isRead;
        this.createTime = createTime;
    }

    public Message(int id, int senderId, int receiverId, String content, boolean isRead, Date createTime) {
        this.id = id;
        this.senderId = senderId;
        this.receiverId = receiverId;
        this.content = content;
        this.isRead = isRead;
        this.createTime = createTime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSenderId() {
        return senderId;
    }

    public void setSenderId(int senderId) {
        this.senderId = senderId;
    }

    public int getReceiverId() {
        return receiverId;
    }

    public void setReceiverId(int receiverId) {
        this.receiverId = receiverId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public boolean isRead() {
        return isRead;
    }

    public void setRead(boolean read) {
        isRead = read;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
