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
public class TblJobActivity {

    private int serialNo;
    private int id;
    private String candidateId;
    private int activity;
    private String jobTitle;
   
    private String employerName;
    private String vacancyId;
    
    private String employerId;
    private int deduction	;
    private int deduction_type;
    private int empDeduction	;
    private int empDeduction_type;
   
    private String createdAt;
    private String modifiedAt;

    private String location;
    private String exception;
    
    
    public TblJobActivity(){
        
    }

     public TblJobActivity(int serialNo, String location, String exception) {
        this.serialNo = serialNo;
        this.location = location;
        this.exception = exception;

    }

    public TblJobActivity(int serialNo, int id, String candidateId, int activity, String jobTitle,String employerId, String employerName,String vacancyId, String createdAt, String modifiedAt) {
        this.serialNo = serialNo;
        this.id = id;
        this.candidateId = candidateId;
        this.activity = activity;
        this.jobTitle = jobTitle;
        this.employerId = employerId;
        this.employerName = employerName;
        this.vacancyId = vacancyId;
        this.createdAt = createdAt;
        this.modifiedAt = modifiedAt;
    }

   
    public TblJobActivity(int serialNo, int id, String candidateId, String employerId, int deduction, int deduction_type, int empDeduction, int empDeduction_type, String createdAt, String modifiedAt) {
        this.serialNo = serialNo;
        this.id = id;
        this.candidateId = candidateId;
        this.employerId = employerId;
        this.deduction = deduction;
        this.deduction_type = deduction_type;
        this.empDeduction = empDeduction;
        this.empDeduction_type = empDeduction_type;
        this.createdAt = createdAt;
        this.modifiedAt = modifiedAt;
    }

    public TblJobActivity(int serialNo, int id, String candidateId, int deduction, int deduction_type, String createdAt, String modifiedAt) {
        this.serialNo = serialNo;
        this.id = id;
        this.candidateId = candidateId;
        this.deduction = deduction;
        this.deduction_type = deduction_type;
        this.createdAt = createdAt;
        this.modifiedAt = modifiedAt;
    }
    

    
     public TblJobActivity(int serialNo, int id, String employerId, int empDeduction, int empDeduction_type, String createdAt) {
        this.serialNo = serialNo;
        this.id = id;
        this.employerId = employerId;
        this.empDeduction = empDeduction;
        this.empDeduction_type = empDeduction_type;
        this.createdAt = createdAt;
       }    

    public TblJobActivity(int id, String candidateId, int activity, String jobTitle, String employerName, String vacancyId, String employerId, int deduction, int deduction_type, int empDeduction, int empDeduction_type, String createdAt, String modifiedAt) {
        this.id = id;
        this.candidateId = candidateId;
        this.activity = activity;
        this.jobTitle = jobTitle;
        this.employerName = employerName;
        this.vacancyId = vacancyId;
        this.employerId = employerId;
        this.deduction = deduction;
        this.deduction_type = deduction_type;
        this.empDeduction = empDeduction;
        this.empDeduction_type = empDeduction_type;
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
        return candidateId;
    }

    public void setCandidateId(String candidateId) {
        this.candidateId = candidateId;
    }

    public String getEmployerId() {
        return employerId;
    }

    public void setEmployerId(String employerId) {
        this.employerId = employerId;
    }

   
    public int getDeduction() {
        return deduction;
    }

    public void setDeduction(int deduction) {
        this.deduction = deduction;
    }

    public int getDeduction_type() {
        return deduction_type;
    }

    public void setDeduction_type(int deduction_type) {
        this.deduction_type = deduction_type;
    }

    public int  getEmpDeduction() {
        return empDeduction;
    }

    public void setEmpDeduction(int empDeduction) {
        this.empDeduction = empDeduction; 
    }
    
    public int getEmpDeduction_type() {
        return empDeduction_type;
    }

    public void setEmpDeduction_type(int empDeduction_type) {
        this.empDeduction_type = empDeduction_type;
    }

    public int getActivity() {
        return activity;
    }

    public void setActivity(int activity) {
        this.activity = activity;
    }

    public String getJobTitle() {
        return jobTitle;
    }

    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }

    public String getEmployerName() {
        return employerName;
    }

    public void setEmployerName(String employerName) {
        this.employerName = employerName;
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
    
   
    public String getVacancyId() {
        return vacancyId;
    }

    public void setVacancyId(String vacancyId) {
        this.vacancyId = vacancyId;
    }

    
    
    
}

