package com.qt.jobportal.beans;

public class TblEmployerDetails {

    private int id;
    private String employer_detail_id;
    private String employer_id;
    private String company_summary;
    private String website;
    private String company_state;
    private String company_city;
    private String company_address;

    public TblEmployerDetails() {
    }

    public TblEmployerDetails(String employer_detail_id, String employer_id, String company_summary, String website, String company_state, String company_city, String company_address) {
        this.employer_detail_id = employer_detail_id;
        this.employer_id = employer_id;
        this.company_summary = company_summary;
        this.website = website;
        this.company_state = company_state;
        this.company_city = company_city;
        this.company_address = company_address;
    }
    
    

    public TblEmployerDetails(int id, String employer_detail_id, String employer_id, String company_summary, String website, String company_state, String company_city, String company_address) {
        this.id = id;
        this.employer_detail_id = employer_detail_id;
        this.employer_id = employer_id;
        this.company_summary = company_summary;
        this.website = website;
        this.company_state = company_state;
        this.company_city = company_city;
        this.company_address = company_address;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmployer_detail_id() {
        return employer_detail_id;
    }

    public void setEmployer_detail_id(String employer_detail_id) {
        this.employer_detail_id = employer_detail_id;
    }

    public String getEmployer_id() {
        return employer_id;
    }

    public void setEmployer_id(String employer_id) {
        this.employer_id = employer_id;
    }

    public String getCompany_summary() {
        return company_summary;
    }

    public void setCompany_summary(String company_summary) {
        this.company_summary = company_summary;
    }
    
    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public String getCompany_state() {
        return company_state;
    }

    public void setCompany_state(String company_state) {
        this.company_state = company_state;
    }

    public String getCompany_city() {
        return company_city;
    }

    public void setCompany_city(String company_city) {
        this.company_city = company_city;
    }

    public String getCompany_address() {
        return company_address;
    }

    public void setCompany_address(String company_address) {
        this.company_address = company_address;
    }

}
