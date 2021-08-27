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

public class TblCandidatePlan {
    private int serialNo;
    private int id;
    private String CandidateId;
    private String planTitle;
    private int planAmout;
    private int availableBalance;
    private String validityInDays;
    private String startDate;
    private String endDate;
    private int perApplyDeduction;
    private String planSuggestion;
    private String createdAt;
    private String modifiedAt;
    private String location;
    private String exception;

    public TblCandidatePlan() {
    }

    
    public TblCandidatePlan(int serialNo, String location, String exception) {
        this.serialNo = serialNo;
        this.location = location;
        this.exception = exception;
    }

    public TblCandidatePlan(int serialNo, int id, String CandidateId, String planTitle, int planAmout, int availableBalance, String validityInDays, String startDate, String endDate, int perApplyDeduction, String planSuggestion, String createdAt, String modifiedAt) {
        this.serialNo = serialNo;
        this.id = id;
        this.CandidateId = CandidateId;
        this.planTitle = planTitle;
        this.planAmout = planAmout;
        this.availableBalance = availableBalance;
        this.validityInDays = validityInDays;
        this.startDate = startDate;
        this.endDate = endDate;
        this.perApplyDeduction = perApplyDeduction;
        this.planSuggestion = planSuggestion;
        this.createdAt = createdAt;
        this.modifiedAt = modifiedAt;
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

    public String getCandidateId() {
        return CandidateId;
    }

    public void setCandidateId(String CandidateId) {
        this.CandidateId = CandidateId;
    }

    public String getPlanTitle() {
        return planTitle;
    }

    public void setPlanTitle(String planTitle) {
        this.planTitle = planTitle;
    }

    public int getPlanAmout() {
        return planAmout;
    }

    public void setPlanAmout(int planAmout) {
        this.planAmout = planAmout;
    }

    public int getAvailableBalance() {
        return availableBalance;
    }

    public void setAvailableBalance(int availableBalance) {
        this.availableBalance = availableBalance;
    }

    public String getValidityInDays() {
        return validityInDays;
    }

    public void setValidityInDays(String validityInDays) {
        this.validityInDays = validityInDays;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public int getPerApplyDeduction() {
        return perApplyDeduction;
    }

    public void setPerApplyDeduction(int perApplyDeduction) {
        this.perApplyDeduction = perApplyDeduction;
    }

    public String getPlanSuggestion() {
        return planSuggestion;
    }

    public void setPlanSuggestion(String planSuggestion) {
        this.planSuggestion = planSuggestion;
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
