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
public class tblEmployerPlan {
    
    private int serialNo;

    private int id;
    private String employer_id;
    private String subscription_id;
    private String plan_title;
    private int plan_amt;
    private int available_balance;
    private int job_post_deduction;
    private int response_deduction;
    private int validity_in_days;
    private String start_date;
    private String end_date;
    private String plan_suggestion;
    private String createdAt;
    private String modifiedAt;

    private String location;
    private String exception;

    public tblEmployerPlan() {
    }

    public tblEmployerPlan(int serialNo, String location, String exception) {
        this.serialNo = serialNo;
        this.location = location;
        this.exception = exception;
    }

    public tblEmployerPlan(int serialNo, int id, String employer_id,String subscription_id, String plan_title, int plan_amt, int available_balance, int job_post_deduction, int response_deduction, int validity_in_days, String start_date, String end_date, String plan_suggestion, String createdAt, String modifiedAt) {
        this.serialNo = serialNo;
        this.id = id;
        this.employer_id = employer_id;
        this.subscription_id = subscription_id;
        this.plan_title = plan_title;
        this.plan_amt = plan_amt;
        this.available_balance = available_balance;
        this.job_post_deduction = job_post_deduction;
        this.response_deduction = response_deduction;
        this.validity_in_days = validity_in_days;
        this.start_date = start_date;
        this.end_date = end_date;
        this.plan_suggestion = plan_suggestion;
        this.createdAt = createdAt;
        this.modifiedAt = modifiedAt;
    }

    public tblEmployerPlan(int serialNo, int id, String employer_id, String subscription_id, String plan_title, int plan_amt, int validity_in_days, String plan_suggestion, String createdAt, String modifiedAt) {
        this.serialNo = serialNo;
        this.id = id;
        this.employer_id = employer_id;
        this.subscription_id = subscription_id;
        this.plan_title = plan_title;
        this.plan_amt = plan_amt;
        this.validity_in_days = validity_in_days;
        this.plan_suggestion = plan_suggestion;
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

    public String getEmployer_id() {
        return employer_id;
    }

    public void setEmployer_id(String employer_id) {
        this.employer_id = employer_id;
    }

    public String getSubscription_id() {
        return subscription_id;
    }

    public void setSubscription_id(String subscription_id) {
        this.subscription_id = subscription_id;
    }

    
    public String getPlan_title() {
        return plan_title;
    }

    public void setPlan_title(String plan_title) {
        this.plan_title = plan_title;
    }

    public int getPlan_amt() {
        return plan_amt;
    }

    public void setPlan_amt(int plan_amt) {
        this.plan_amt = plan_amt;
    }

    public int getAvailable_balance() {
        return available_balance;
    }

    public void setAvailable_balance(int available_balance) {
        this.available_balance = available_balance;
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

    public int getValidity_in_days() {
        return validity_in_days;
    }

    public void setValidity_in_days(int validity_in_days) {
        this.validity_in_days = validity_in_days;
    }

    public String getStart_date() {
        return start_date;
    }

    public void setStart_date(String start_date) {
        this.start_date = start_date;
    }

    public String getEnd_date() {
        return end_date;
    }

    public void setEnd_date(String end_date) {
        this.end_date = end_date;
    }

    public String getPlan_suggestion() {
        return plan_suggestion;
    }

    public void setPlan_suggestion(String plan_suggestion) {
        this.plan_suggestion = plan_suggestion;
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
