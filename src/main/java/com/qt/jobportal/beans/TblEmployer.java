/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qt.jobportal.beans;

/**
 *
 * @author Asus
 */
public class TblEmployer {

    private int serialNo;
    private int id;
    private String subscriptionId;
    private int balance;
    private String companyName;
    private String companyPublicId;     // adding new variable or Create getter Setter or add into costructor also
    private String contactPerson;
    private String phoneNo;
    private String emailId;
    private String password;
    private String jobAddress;
    private String subscription;
    private double walletAmount;
    private int attempts;
    private int authentication;
    private String createdAt;
    private String modifiedAt;
    private String validPassword;
    private String newPassword;
    private String confirmPassword;
    
    private String location;
    private String exception;

    public TblEmployer() {

    }

    public TblEmployer(int serialNo, int id, String companyPublicId, String subscriptionId,int balance, String companyName, String contactPerson, String phoneNo, String emailId, String password, String jobAddress, int attempts, int authentication, String createdAt, String modifiedAt) {
        this.serialNo = serialNo;
        this.id = id;
        this.companyPublicId = companyPublicId;
        this.subscriptionId = subscriptionId;
        this.balance = balance;
        this.companyName = companyName;
        this.contactPerson = contactPerson;
        this.phoneNo = phoneNo;
        this.emailId = emailId;
        this.password = password;
        this.jobAddress = jobAddress;
        this.attempts = attempts;
        this.authentication = authentication;
        this.createdAt = createdAt;
        this.modifiedAt = modifiedAt;
        }

    public TblEmployer(int serialNo, String location, String exception) {
        this.serialNo = serialNo;
        this.location = location;
        this.exception = exception;
    }

    public String getCompanyPublicId() {
        return companyPublicId;
    }

    public void setCompanyPublicId(String companyPublicId) {
        this.companyPublicId = companyPublicId;
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

    public String getSubscriptionId() {
        return subscriptionId;
    }

    public void setSubscriptionId(String subscriptionId) {
        this.subscriptionId = subscriptionId;
    }

    public int getBalance() {
        return balance;
    }

    public void setBalance(int balance) {
        this.balance = balance;
    }

    
    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getContactPerson() {
        return contactPerson;
    }

    public void setContactPerson(String contactPerson) {
        this.contactPerson = contactPerson;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }

    public String getEmailId() {
        return emailId;
    }

    public void setEmailId(String emailId) {
        this.emailId = emailId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getJobAddress() {
        return jobAddress;
    }

    public void setJobAddress(String jobAddress) {
        this.jobAddress = jobAddress;
    }

    public String getSubscription() {
        return subscription;
    }

    public void setSubscription(String subscription) {
        this.subscription = subscription;
    }

    public double getWalletAmount() {
        return walletAmount;
    }

    public void setWalletAmount(double walletAmount) {
        this.walletAmount = walletAmount;
    }

    public int getAttempts() {
        return attempts;
    }

    public void setAttempts(int attempts) {
        this.attempts = attempts;
    }

    public int getAuthentication() {
        return authentication;
    }

    public void setAuthentication(int authentication) {
        this.authentication = authentication;
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

    public String getValidPassword() {
        return validPassword;
    }

    public void setValidPassword(String validPassword) {
        this.validPassword = validPassword;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
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
