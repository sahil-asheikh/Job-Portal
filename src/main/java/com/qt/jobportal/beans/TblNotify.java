/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qt.jobportal.beans;

/**
 *
 * @author Zoya
 */
public class TblNotify {
    private int serialNo;
    private int id;
    private String notifyPublicId;
    private String Name;
     private String emailId;
    private String jobCategory;
    private String createdAt;
    private String modifiedAt;
    private String location;
    private String exception;

    public TblNotify(int serialNo, String notifyPublicId, String Name, String emailId, String jobCategory, String createdAt, String modifiedAt) {
        this.serialNo = serialNo;
        
        this.notifyPublicId = notifyPublicId;
        this.Name = Name;
        this.emailId = emailId;
        this.jobCategory = jobCategory;
        this.createdAt = createdAt;
        this.modifiedAt = modifiedAt;
    }

    public TblNotify(int serialNo, String location, String exception) {
        this.serialNo = serialNo;
        this.location = location;
        this.exception = exception;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getException() {
        return exception;
    }

    public void setException(String exception) {
        this.exception = exception;
    }
   
   

    public TblNotify() {
    }

    public String getNotifyPublicId() {
        return notifyPublicId;
    }

    public void setNotifyPublicId(String notifyPublicId) {
        this.notifyPublicId = notifyPublicId;
    }

   

    public int getSerialNo() {
        return serialNo;
    }

    public void setSerialNo(int serialNo) {
        this.serialNo = serialNo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public String getModifiedAt() {
        return modifiedAt;
    }

    public void setModifiedAt(String modifiedAt) {
        this.modifiedAt = modifiedAt;
    }

    public String getEmailId() {
        return emailId;
    }

    public void setEmailId(String emailId) {
        this.emailId = emailId;
    }

    public String getJobCategory() {
        return jobCategory;
    }

    public void setJobCategory(String jobCategory) {
        this.jobCategory = jobCategory;
    }

  

   
}
