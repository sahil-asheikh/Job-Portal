
/* global frm */

function employerVal() {


    var mobPattern = /^[789]{1}[0-9]{9}$/;
    var emailPattern = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;


    // Company Name validation           
    if (frm.txtCompanyName.value === "") {

        swal("Name !", "Please Enter Your Company Name", "error");
        frm.txtCompanyName.focus();
        return false;
    }
    if (!isNaN(frm.txtCompanyName.value)) {

        swal("Name !", "Should be Characters", "error");
        frm.txtCompanyName.focus();
        return false;
    }
    // Contact Person validation           
    if (frm.txtContactPerson.value === "") {

        swal("Name !", "Please Enter Your Contact Person", "error");
        frm.txtContactPerson.focus();
        return false;
    }
    if (!isNaN(frm.txtContactPerson.value)) {

        swal("Name !", "Should be Characters", "error");
        frm.txtContactPerson.focus();
        return false;
    }

    // phone no. validation
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
    //Email Validation
    if (frm.txtEmailId.value === "") {
        swal("Email !", "Please Enter Email Id", "error");
        frm.txtEmailId.focus();
        return false;
    }
    if (!frm.txtEmailId.value.match(emailPattern)) {
        swal("Email !", "Enter Correct Email Id", "error");
        frm.txtEmailId.focus();
        return false;
    }


    //Password Validation
    if (frm.txtPassword.value === "") {
        swal("Password !", "Enter Password", "error");
        frm.txtPassword.focus();
        return false;
    }
    if ((frm.txtPassword.value).length < 4) {
        swal("Password", " minimum 4 characters", "error");
        frm.txtPassword.focus();
        return false;
    }

    // Job Address Validation 
    if (frm.txtJobAddress.value === "") {
         alert("Job Address Should Not Blank");
        swal("Address !", "Enter Address", "error");
        frm.txtJobAddress.focus();
        return false;
    }

//Check box
function toggle(checked) {
    var elm = document.getElementById('checkbox');
    if (checked != elm.checked) {
        elm.click();
    }
}
    //Agency / Shop / Company / firm VAlidation
    if (frm.txtAgency.value === "") {
        swal("Agency Name !", "Enter Agency/Shop Name", "error");
        frm.txtAgency.focus();
        return false;
    }


    // City VAlidation
    if (frm.txtCity.value === "") {
        // alert("Name Should Not Blank");
        swal("City !", "Enter City Name", "error");
        frm.txtCity.focus();
        return false;
    }
    if (!isNaN(frm.txtCity.value)) {

        swal("City !", "Should be Characters", "error");
        frm.txtCity.focus();
        return false;
    }

    if (frm.txtState.value === "") {

        swal("State !", "Enter State Name", "error");
        frm.txtState.focus();
        return false;
    }
    if (!isNaN(frm.txtCity.value)) {

        swal("State !", "Should be Characters", "error");
        frm.txtCity.focus();
        return false;
    }

    return true;

}

//password ConfirmPassword
var check = function ()
{
    if (document.getElementById('password').value === document.getElementById('confirm_password').value)
    {
        document.getElementById('message').style.color = 'green';
        document.getElementById('message').innerHTML = 'Password Matched';
    } else {
        document.getElementById('message').style.color = 'red';
        document.getElementById('message').innerHTML = 'Not Mached';
    }
}

var checkNum = function ()
{
    if (!(frm.txtName.value === "")) {
        if (!isNaN(frm.txtName.value)) {
            swal("Name !", "Should be Characters", "error");
            frm.txtName.focus();
            frm.txtName.innerHTML = "eeee";

            return false;

        }
    }
}