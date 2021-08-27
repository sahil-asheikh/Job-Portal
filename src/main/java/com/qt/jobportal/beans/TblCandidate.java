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
public class TblCandidate {

    private int serialNo;
    private int id;
    private String candPublicId;
    private String subscriptionId;
    private int balance;
    private String fullName;
    private String state;
    private String phone_No;
    private String city;
    private String address;
    private int age;
    private String gender;
    private String qualification;
    private String schoolMedium;
    private String englishSkill;
    private String fresherExperience;
    private String jobRole;
    private String skillSet;
    private String createdAt;
    private String modifiedAt;
    private String password;
    private String emailId;
    private int authentication;
    private int attempts;
    private String validPassword;
    private String newPassword;
    private String confirmPassword;
    
    private String location;
    private String exception;

    //constructor
    public TblCandidate() {
    }

    public TblCandidate(int serialNo, String location, String exception) {
        this.serialNo = serialNo;
        this.location = location;
        this.exception = exception;
    }

    public TblCandidate(int serialNo, int id,String candPublicId,String subscriptionId,int balance , String fullName, String state,String phone_No,  String city, String address, int age, String gender, String qualification, String schoolMedium, String englishSkill, String fresherExperience, String jobRole, String skillSet, String createdAt, String modifiedAt, String password, String emailId, int authentication, int attempts) {

        this.serialNo = serialNo;
        this.id = id;
        this.candPublicId = candPublicId;
        this.subscriptionId = subscriptionId;
        this.balance = balance;
        this.fullName = fullName;
        this.state = state;
        this.phone_No = phone_No;
        this.city = city;
        this.address = address;
        this.age = age;
        this.gender = gender;
        this.qualification = qualification;
        this.schoolMedium = schoolMedium;
        this.englishSkill = englishSkill;
        this.fresherExperience = fresherExperience;
        this.jobRole = jobRole;
        this.skillSet = skillSet;
        this.createdAt = createdAt;
        this.modifiedAt = modifiedAt;
        this.password = password;
        this.emailId = emailId;
        this.authentication = authentication;
        this.attempts = attempts;
        
    }

    //Getter Setter 
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

    public String getCandPublicId() {
        return candPublicId;
    }

    public void setCandPublicId(String candPublicId) {
        this.candPublicId = candPublicId;
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

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
    
    public String getPhone_No() {
        return phone_No;
    }

    public void setPhone_No(String phone_No) {
        this.phone_No = phone_No;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getQualification() {
        return qualification;
    }

    public void setQualification(String qualification) {
        this.qualification = qualification;
    }

    public String getSchoolMedium() {
        return schoolMedium;
    }

    public void setSchoolMedium(String schoolMedium) {
        this.schoolMedium = schoolMedium;
    }

    public String getEnglishSkill() {
        return englishSkill;
    }

    public void setEnglishSkill(String englishSkill) {
        this.englishSkill = englishSkill;
    }

    public String getFresherExperience() {
        return fresherExperience;
    }

    public void setFresherExperience(String fresherExperience) {
        this.fresherExperience = fresherExperience;
    }

    public String getJobRole() {
        return jobRole;
    }

    public void setJobRole(String jobRole) {
        this.jobRole = jobRole;
    }

    public String getSkillSet() {
        return skillSet;
    }

    public void setSkillSet(String skillSet) {
        this.skillSet = skillSet;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmailId() {
        return emailId;
    }

    public void setEmailId(String emailId) {
        this.emailId = emailId;
    }

    public int getAuthentication() {
        return authentication;
    }

    public void setAuthentication(int authentication) {
        this.authentication = authentication;
    }

    public int getAttempts() {
        return attempts;
    }

    public void setAttempts(int attempts) {
        this.attempts = attempts;
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
