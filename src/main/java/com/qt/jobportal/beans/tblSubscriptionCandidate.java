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
public class tblSubscriptionCandidate {
     private int serialNo;

    private int id;
    private String subCandPublicId;
    private String title;
    private int price;
    private String validity;
    private int per_apply_price;
    private String suggestion;
    
    private int visibility;
    private String createdAt;
    private String modifiedAt;

    private String location;
    private String exception;

    public tblSubscriptionCandidate() {
    }

    public tblSubscriptionCandidate(int serialNo, String location, String exception) {
        this.serialNo = serialNo;
        this.location = location;
        this.exception = exception;
    }

    public tblSubscriptionCandidate(int serialNo, int id,String subCandPublicId, String title, int price, String validity, int per_apply_price, String suggestion, int visibility, String createdAt, String modifiedAt) {
        this.serialNo = serialNo;
        this.id = id;
        this.subCandPublicId = subCandPublicId;
        this.title = title;
        this.price = price;
        this.validity = validity;
        this.per_apply_price = per_apply_price;
        this.suggestion = suggestion;
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

    public String getSubCandPublicId() {
        return subCandPublicId;
    }

    public void setSubCandPublicId(String subCandPublicId) {
        this.subCandPublicId = subCandPublicId;
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

    public String getValidity() {
        return validity;
    }

    public void setValidity(String validity) {
        this.validity = validity;
    }

    public int getPer_apply_price() {
        return per_apply_price;
    }

    public void setPer_apply_price(int per_apply_price) {
        this.per_apply_price = per_apply_price;
    }

   
    public String getSuggestion() {
        return suggestion;
    }

    public void setSuggestion(String suggestion) {
        this.suggestion = suggestion;
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
