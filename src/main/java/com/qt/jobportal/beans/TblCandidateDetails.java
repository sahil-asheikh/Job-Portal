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
public class TblCandidateDetails {
     private int serialNo;

    private int id;
    private String candPublicId;
    private String candDetailsPublicId;
    private String summary;
    private String experienceDetails;
    private String experience;
    private String createdAt;
    private String modifiedAt;
    private String location;
    private String exception;

    public TblCandidateDetails(int serialNo, String location, String exception) {
        this.serialNo = serialNo;
        this.location = location;
        this.exception = exception;
    }

    public TblCandidateDetails(int serialNo, int id, String candDetailsPublicId, String candPublicId, String summary,String experience, String experienceDetails, String createdAt, String modifiedAt) {
        this.serialNo = serialNo;
        this.id = id;
        this.candDetailsPublicId = candDetailsPublicId ;
        this.candPublicId = candPublicId;
        this.summary = summary;
        this.experience = experience;
        this.experienceDetails = experienceDetails;
        this.createdAt = createdAt;
        this.modifiedAt = modifiedAt;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public TblCandidateDetails() {
    }

    public int getSerialNo() {
        return serialNo;
    }

    public String getCandDetailsPublicId() {
        return candDetailsPublicId;
    }

    public void setCandDetailsPublicId(String candDetailsPublicId) {
        this.candDetailsPublicId = candDetailsPublicId;
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

    public String getCandPublicId() {
        return candPublicId;
    }

    public void setCandPublicId(String candPublicId) {
        this.candPublicId = candPublicId;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getExperienceDetails() {
        return experienceDetails;
    }

    public void setExperienceDetails(String experienceDetails) {
        this.experienceDetails = experienceDetails;
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

    
}
