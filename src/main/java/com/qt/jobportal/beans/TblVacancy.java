/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qt.jobportal.beans;

/**
 *
 * @author Lenovo
 */
public class TblVacancy {

    private int serialNo;
    private int id;
    private String vacancyPublicId;
    private String EmployerId;
    private String title;
    private int minSalary;
    private int maxSalary;
    private int noOfOpening;
    private String jobState;
    private String jobCity;
    private String jobArea;
    private String jobAddress;
    private String jobDescription;
    private String minQualification;
    private String experience;
    private String gender;
    private String englishAccuracy;

    private String skillSet;
    private String jobTiming;
    private String interviewDetails;
    private String companyName;
    private String contactPerson;
    private String phoneNo;
    private String emailId;
    private int jobStatus;
    private int jobHide;
    private String createdAt;
    private String modifiedAt;
    private String location;
    private String exception;

    public TblVacancy() {
    }

    public TblVacancy(int serialNo, String location, String exception) {
        this.serialNo = serialNo;
        this.location = location;
        this.exception = exception;

    }

    public TblVacancy(int serialNo, int id,String vacancyPublicId,String EmployerId, String title, int minSalary, int maxSalary, int noOfOpening, String jobState, String jobCity, String jobArea, String jobAddress, String jobDescription, String minQualification, String experience, String gender, String englishAccuracy, String skillSet, String jobTiming, String interviewDetails, String companyName, String contactPerson, String phoneNo, String emailId, int jobStatus, int jobHide, String createdAt, String modifiedAt) {
        this.serialNo = serialNo;
        this.id = id;
        this.vacancyPublicId = vacancyPublicId;
        this.EmployerId = EmployerId;
        this.title = title;
        this.minSalary = minSalary;
        this.maxSalary = maxSalary;
        this.noOfOpening = noOfOpening;
        this.jobState = jobState;
        this.jobCity = jobCity;
        this.jobArea = jobArea;
        this.jobAddress = jobAddress;
        this.jobDescription = jobDescription;
        this.minQualification = minQualification;
        this.experience = experience;
        this.gender = gender;
        this.englishAccuracy = englishAccuracy;
        this.skillSet = skillSet;
        this.jobTiming = jobTiming;
        this.interviewDetails = interviewDetails;
        this.companyName = companyName;
        this.contactPerson = contactPerson;
        this.phoneNo = phoneNo;
        this.emailId = emailId;
        this.jobStatus = jobStatus;
        this.jobHide = jobHide;
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

    public String getVacancyPublicId() {
        return vacancyPublicId;
    }

    public void setVacancyPublicId(String vacancyPublicId) {
        this.vacancyPublicId = vacancyPublicId;
    }

    

    public String getEmployerId() {
        return EmployerId;
    }

    public void setEmployerId(String EmployerId) {
        this.EmployerId = EmployerId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getMinSalary() {
        return minSalary;
    }

    public void setMinSalary(int minSalary) {
        this.minSalary = minSalary;
    }

    public int getMaxSalary() {
        return maxSalary;
    }

    public void setMaxSalary(int maxSalary) {
        this.maxSalary = maxSalary;
    }

    public int getNoOfOpening() {
        return noOfOpening;
    }

    public void setNoOfOpening(int noOfOpening) {
        this.noOfOpening = noOfOpening;
    }

    public String getJobState() {
        return jobState;
    }

    public void setJobState(String jobState) {
        this.jobState = jobState;
    }

    public String getJobCity() {
        return jobCity;
    }

    public void setJobCity(String jobCity) {
        this.jobCity = jobCity;
    }

    public String getJobArea() {
        return jobArea;
    }

    public void setJobArea(String jobArea) {
        this.jobArea = jobArea;
    }

    public String getJobAddress() {
        return jobAddress;
    }

    public void setJobAddress(String jobAddress) {
        this.jobAddress = jobAddress;
    }

    public String getJobDescription() {
        return jobDescription;
    }

    public void setJobDescription(String jobDescription) {
        this.jobDescription = jobDescription;
    }

    public String getMinQualification() {
        return minQualification;
    }

    public void setMinQualification(String minQualification) {
        this.minQualification = minQualification;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getEnglishAccuracy() {
        return englishAccuracy;
    }

    public void setEnglishAccuracy(String englishAccuracy) {
        this.englishAccuracy = englishAccuracy;
    }

    public String getSkillSet() {
        return skillSet;
    }

    public void setSkillSet(String skillSet) {
        this.skillSet = skillSet;
    }

    public String getJobTiming() {
        return jobTiming;
    }

    public void setJobTiming(String jobTiming) {
        this.jobTiming = jobTiming;
    }

    public String getInterviewDetails() {
        return interviewDetails;
    }

    public void setInterviewDetails(String interviewDetails) {
        this.interviewDetails = interviewDetails;
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

    public int getJobStatus() {
        return jobStatus;
    }

    public void setJobStatus(int jobStatus) {
        this.jobStatus = jobStatus;
    }

    public int getJobHide() {
        return jobHide;
    }

    public void setJobHide(int jobHide) {
        this.jobHide = jobHide;
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
