/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function ForgetPassValidation() {
    
     var mobPattern = /^[789]{1}[0-9]{9}$/;
     
    //phone number
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

