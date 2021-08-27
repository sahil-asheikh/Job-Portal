/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function ResetPassValidation(){
 //Password Validation
    if (frm.txtNewPass.value === "") {
        swal("Password !", "Enter Password", "error");
        frm.txtNewPass.focus();
        return false;
    }
    if ((frm.txtNewPass.value).length < 2 || (frm.txtPassword.value).length < 4) {
        swal("Password", " minimum 4 characters", "error");
        frm.txtNewPass.focus();
        return false;
    }
return true;
}

