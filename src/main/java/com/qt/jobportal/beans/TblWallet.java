/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qt.jobportal.beans;

/**
 *
 * @author Nikita
 */
public class TblWallet {
    private int serialNo;

    private int id; 
    private int candidateId;
    private String subscriptionPlan	;
    private String balance	;
    private String createdAt;

    private String modifiedAt;

    private String location;
    private String exception;

    public TblWallet() {
    }

    public TblWallet(int serialNo, String location, String exception) {
        this.serialNo = serialNo;
        this.location = location;
        this.exception = exception;
    }

    public TblWallet(int serialNo, int id, int candidateId, String subscriptionPlan, String balance, String createdAt, String modifiedAt) {
        this.serialNo = serialNo;
        this.id = id;
        this.candidateId = candidateId;
        this.subscriptionPlan = subscriptionPlan;
        this.balance = balance;
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

    public int getCandidateId() {
        return candidateId;
    }

    public void setCandidateId(int candidateId) {
        this.candidateId = candidateId;
    }

    public String getSubscriptionPlan() {
        return subscriptionPlan;
    }

    public void setSubscriptionPlan(String subscriptionPlan) {
        this.subscriptionPlan = subscriptionPlan;
    }

    public String getBalance() {
        return balance;
    }

    public void setBalance(String balance) {
        this.balance = balance;
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
