/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



function candidateValidation() {


    var mobPattern = /^[789]{1}[0-9]{9}$/;
    var emailPattern = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;


    // Full  Name validation           
    if (frm.txtFullName.value === "") {

        swal("Name !", "Please Enter Your Full Name", "error");
        frm.txtFullName.focus();
        return false;
    }
    if (!isNaN(frm.txtFullName.value)) {

        swal("Name !", "Should be Characters", "error");
        frm.txtFullName.focus();
        return false;
    }
    
    if ((frm.txtFullName.value).length <2) {

        swal("Name !", "Size of Name Shold be Greater than or equal to 2", "error");
        frm.txtFullName.focus();
        return false;
    }
    
    // Phone number Validation
    if (frm.txtPhoneNo.value === "") {
        swal("Mobile !", "Please enter mobile number", "error");
        frm.txtPhoneNo.focus();
        return false;
    }
    if (isNaN(frm.txtPhoneNo.value)) {
        swal("Mobile !", "Enter Correct Mobile Number", "error");
        frm.txtPhoneNo.focus();
        return false;
    }
    if ((frm.txtPhoneNo.value).length < 10 || (frm.txtPhoneNo.value).length > 10) {
        swal("Mobile !", "Enter Correct Mobile Number", "error");
        frm.txtPhoneNo.focus();
        return false;
    }
    if (!frm.txtPhoneNo.value.match(/^[789]{1}[0-9]{9}$/)) {
        swal("Mobile !", "Enter Correct Mobile Number", "error");
        frm.txtPhoneNo.focus();
        return false;
    }
    if (frm.txtPhoneNo.value === "") {
        swal("Mobile !", "Enter Correct Mobile Number", "error");
        frm.txtPhoneNo.focus();
        return false;
    }
    
    //State Validation
     if (frm.txtState.value === "") {

        swal("State !", "Enter State Name", "error");
        frm.txtState.focus();
        return false;
    }
    if (!isNaN(frm.txtState.value)) {

        swal("State !", "Should be Characters", "error");
        frm.txtCity.focus();
        return false;
    } 
 
    // City Validation
   if (frm.txtCity.value === "") {
       swal("City !", "Enter City Name", "error");
        frm.txtCity.focus();
        return false;
    }
    if (!isNaN(frm.txtCity.value)) {

        swal("City !", "Should be Characters", "error");
        frm.txtCity.focus();
        return false;
    }      
    
     if (frm.txtAddress.value === "") {
       swal("Address !", "Enter Address Name", "error");
        frm.txtAddress.focus();
        return false;
    }
    if (!isNaN(frm.txtAddress.value)) {

        swal("Address !", "Enter the valid address", "error");
        frm.txtAddress.focus();
        return false;
    }      
    
    if (frm.txtAge.value === "") {
        swal("Age !", "Enter the age ", "error");
        frm.txtAge.focus();
        return false;
    }
   
    
    if (((frm.txtAge.value)< 18) || ((frm.txtAge.value)> 45)) {        
        swal("Age !", "You are not valid for register", "error");
        frm.txtAge.focus();
        return false;
    }  
 
//    if (((frm.txtAge.value)>= 18) || ((frm.txtAge.value)<= 45)) {        
//        swal("Age !", "You are valid for register", "error");
//        frm.txtAge.focus();
//        return false;
//    }  
    
  
  if (frm.txtAge.value === "") {
        swal("Age !", "Enter Correct ", "error");
        frm.txtAge.focus();
        return false;
    }
     
    if (frm.slQualification.value === "") {
       swal("Qualification !", "Enter  your Qualification ", "error");
        frm.slQualification.focus();
        return false;
    }
    
    if (!isNaN(frm.slQualification.value)) {

        swal("Qualification !", "Please Enter qualification", "error");
        frm.slQualification.focus();
        return false;
    }      
    
    
     
    if (frm.slSchoolMedium.value === "") {
       swal("School Medium !", "Enter  your School Medium ", "error");
        frm.slSchoolMedium.focus();
        return false;
    }
    
    if (!isNaN(frm.slSchoolMedium.value)) {

        swal("School Medium !", "Please Enter Medium", "error");
        frm.slSchoolMedium.focus();
        return false;
    }      
    
     
    if (frm.slEnglishAccuracy.value === "") {
       swal("English Accuracy !", "Enter  your English Accuracy ", "error");
        frm.slEnglishAccuracy.focus();
        return false;
    }
    
    if (!isNaN(frm.slEnglishAccuracy.value)) {

        swal("English Accuracy !", "Please Enter your English Accuracy", "error");
        frm.slEnglishAccuracy.focus();
        return false;
    }      
    
    
    if (frm.rdFE.value === "") {
       swal("Fresher/Experience !", "Enter   whether your are Fresher or Experience ", "error");
        frm.rdFE.focus();
        return false;
    }
    
    if (!isNaN(frm.rdFE.value)) {

        swal("Fresher/Experience!", "Please Enter whether your are Fresher or Experience", "error");
        frm.rdFE.focus();
        return false;
    }
  
     if (frm.txtPassword.value === "") {
        swal("Password !", "Enter Password", "error");
        frm.txtPassword.focus();
        return false;
    }
    if ((frm.txtPassword.value).length < 2 || (frm.txtPassword.value).length < 4) {
        swal("Password", " minimum 4 characters", "error");
        frm.txtPassword.focus();
        return false;
    }   
      
        //Email Validation
    if (frm.txtEmailId.value === "") {
        swal("Email !", "Please enter email id", "error");
        frm.txtEmail.focus();
        return false;
    }
    if (!frm.txtEmailId.value.match(emailPattern)) {
        swal("Email !", "Enter Correct Email id", "error");
        frm.txtEmail.focus();
        return false;
    }
    
   
    if(frm.chkTerms.checked === false)
{
           swal("CheckBox!", "You must agree to the terms first.", "error");
 return false;


 }
 
}