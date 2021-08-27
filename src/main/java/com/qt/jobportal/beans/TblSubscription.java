/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qt.jobportal.beans;

/**
 *
 * @author win8.1
 */
public class TblSubscription {

    private int serialNo;

    private int id;
    private String subscription_id;
    private String title;
    private int price;
    private int validity_in_days;
    private int active_job_limit;
    private int responseLimit;
    private int databaseLimit;
    private int callLimit;
    private String suggestion;
    private int job_post_deduction;
    private int response_deduction;
    private String field3;
    private int visibility;
    private String createdAt;
    private String modifiedAt;

    private String location;
    private String exception;

   public TblSubscription() {
    }

    
    
    public TblSubscription(int serialNo, String location, String exception) {
        this.serialNo = serialNo;
        this.location = location;
        this.exception = exception;
    }

    public TblSubscription(int serialNo, int id,String subscription_id, String title, int price, int validity_in_days, int active_job_limit, int responseLimit, int databaseLimit, int callLimit, String suggestion, int job_post_deduction, int response_deduction, String field3, int visibility, String createdAt, String modifiedAt) {
        this.serialNo = serialNo;
        this.id = id;
        this.subscription_id = subscription_id;
        this.title = title;
        this.price = price;
        this.validity_in_days = validity_in_days;
        this.active_job_limit = active_job_limit;
        this.responseLimit = responseLimit;
        this.databaseLimit = databaseLimit;
        this.callLimit = callLimit;
        this.suggestion = suggestion;
        this.job_post_deduction = job_post_deduction;
        this.response_deduction = response_deduction;
        this.field3 = field3;
        this.visibility = visibility;
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

    public String getSubscription_id() {
        return subscription_id;
    }

    public void setSubscription_id(String subscription_id) {
        this.subscription_id = subscription_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getValidity_in_days() {
        return validity_in_days;
    }

    public void setValidity_in_days(int validity_in_days) {
        this.validity_in_days = validity_in_days;
    }

    public int getActive_job_limit() {
        return active_job_limit;
    }

    public void setActive_job_limit(int active_job_limit) {
        this.active_job_limit = active_job_limit;
    }

    public int getResponseLimit() {
        return responseLimit;
    }

    public void setResponseLimit(int responseLimit) {
        this.responseLimit = responseLimit;
    }

    public int getDatabaseLimit() {
        return databaseLimit;
    }

    public void setDatabaseLimit(int databaseLimit) {
        this.databaseLimit = databaseLimit;
    }

    public int getCallLimit() {
        return callLimit;
    }

    public void setCallLimit(int callLimit) {
        this.callLimit = callLimit;
    }

    public String getSuggestion() {
        return suggestion;
    }

    public void setSuggestion(String suggestion) {
        this.suggestion = suggestion;
    }

    public int getJob_post_deduction() {
        return job_post_deduction;
    }

    public void setJob_post_deduction(int job_post_deduction) {
        this.job_post_deduction = job_post_deduction;
    }

    public int getResponse_deduction() {
        return response_deduction;
    }

    public void setResponse_deduction(int response_deduction) {
        this.response_deduction = response_deduction;
    }

    
    public String getField3() {
        return field3;
    }

    public void setField3(String field3) {
        this.field3 = field3;
    }

    public int getVisibility() {
        return visibility;
    }

    public void setVisibility(int visibility) {
        this.visibility = visibility;
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
