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
public class TblSystemSetting {
     private int serialNo;

    private int id;
    private String jobSkills;
    private String jobRole;
   
      private String location;
    private String exception;

    public TblSystemSetting() {
    }

    public TblSystemSetting(int serialNo, String location, String exception) {
        this.serialNo = serialNo;
        this.location = location;
        this.exception = exception;
    }

    
    public TblSystemSetting(int serialNo, int id, String jobSkills, String jobRole) {
        this.serialNo = serialNo;
        this.id = id;
        this.jobSkills = jobSkills;
        this.jobRole = jobRole;
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

    public String getJobSkills() {
        return jobSkills;
    }

    public void setJobSkills(String jobSkills) {
        this.jobSkills = jobSkills;
    }

    public String getJobRole() {
        return jobRole;
    }

    public void setJobRole(String jobRole) {
        this.jobRole = jobRole;
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
