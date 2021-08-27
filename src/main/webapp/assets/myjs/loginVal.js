/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/* global frm */


function LoginValidation() {

    var mobPattern = /^[789]{1}[0-9]{9}$/;
    var emailPattern = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;


    // Phone no vali...   
    if (frm.txtPhoneNo.value === "") {
        swal("Mobile !", "Please Enter Your Mobile Number", "error");
        frm.txtPhoneNo.focus();
        return false;
    }
    if (isNaN(frm.txtPhoneNo.value)) {
        swal("Mobile !", "Enter Correct Your Mobile Number", "error");
        frm.txtPhoneNo.focus();
        return false;
    }
    if ((frm.txtPhoneNo.value).length < 10 || (frm.txtPhoneNo.value).length > 10) {
        swal("Mobile !", "invalid Mobile Number", "error");
        frm.txtPhoneNo.focus();
        return false;
    }
    if (!frm.txtPhoneNo.value.match(mobPattern)) {
        swal("Mobile !", "Enter Correct Mobile Number", "error");
        frm.txtPhoneNo.focus();
        return false;
    }
    if (frm.txtPhoneNo.value === "") {
        swal("Mobile !", "Enter Correct Mobile Number", "error");
        frm.txtPhoneNo.focus();
        return false;
    }

    //Password Validation
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
 if (frm.txtPhone.value === "") {
        swal("Mobile !", "Please enter mobile number", "error");
        frm.txtPhone.focus();
        return false;
    }
    if (isNaN(frm.txtPhone.value)) {
        swal("Mobile !", "Enter Correct Mobile Number", "error");
        frm.txtPhone.focus();
        return false;
    }
    return true;
}