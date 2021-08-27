/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function OTPvalidation(){
 //otp
    if (frm.txtOTP.value === "") {
        swal("OTP !", "Please enter OTP", "error");
        frm.txtOTP.focus();
        return false;
    }
    if (isNaN(frm.txtOTP.value)) {
        swal("OTP !", "Enter Correct OTP", "error");
        frm.txtOTP.focus();
        return false;
    }
    return true;
}