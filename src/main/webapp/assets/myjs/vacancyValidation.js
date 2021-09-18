/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* global frm, form, fr */

function vacancyValidation() {

    var mobPattern = /^[789]{1}[0-9]{9}$/;
    var emailPattern = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;





    // Title validation      
    if (frm.txtTitle.value === "") {

        swal("Title!", "Please Enter Title", "error");
        frm.txtTitle.focus();
        return false;
    }
    if (!isNaN(frm.txtTitle.value)) {

        swal("Title!", "Should be Characters", "error");
        frm.txtTitle.focus();
        return false;
    }


    //No of Opening vali...
    if (frm.txtNoOfOpening.value === "") {

        swal("Number!", "Please Enter Number", "error");
        frm.txtNoOfOpening.focus();
        return false;
    }
    if (isNaN(frm.txtNoOfOpening.value)) {

        swal("Number!", "Should be Number", "error");
        frm.txtNoOfOpening.focus();
        return false;
    }
    //minimum Salary valid..

    if (frm.txtMinSalary.value === "") {

        swal("Salary !", "Please Enter Minimum Salary", "error");
        frm.txtMinSalary.focus();
        return false;
    }

    if (isNaN(frm.txtMinSalary.value)) {

        swal("Number!", "Should be Number", "error");
        frm.txtMinSalary.focus();
        return false;
    }

    // Maxsal vali...

    if (frm.txtMaxSalary.value === "") {

        swal("Salary !", "Please Enter maximum Salary", "error");
        frm.txtMaxSalary.focus();
        return false;
    }

    if (isNaN(frm.txtMaxSalary.value)) {

        swal("Number!", "Should be Number", "error");
        frm.txtMaxSalary.focus();
        return false;
    }



    // JobState vali...

    if (frm.txtJobInState.value === "") {

        swal("State !", "Enter State Name", "error");
        frm.txtJobInState.focus();
        return false;
    }
    if (!isNaN(frm.txtJobInState.value)) {

        swal("State !", "Should be Characters", "error");
        frm.txtJobInState.focus();
        return false;
    }
    // Job in City vali...

    if (frm.txtJobInCity.value === "") {
        // alert("Name Should Not Blank");
        swal("City !", "Enter City Name", "error");
        frm.txtJobInCity.focus();
        return false;
    }
    if (!isNaN(frm.txtJobInCity.value)) {

        swal("City !", "Should be Characters", "error");
        frm.txtJobInCity.focus();
        return false;
    }

    // Job In Area vali...

    if (frm.txtJobInArea.value === "") {

        swal("Area !", "Please Enter Job Area", "error");
        frm.txtJobInArea.focus();
        return false;
    }
    if (!isNaN(frm.txtJobInArea.value)) {

        swal("Area !", "Should be Characters", "error");
        frm.txtJobInArea.focus();
        return false;
    }
    // MinQualification vali...

    if (frm.txtMinQualification.value === "") {

        swal("Qualification !", "Please Enter Minimum Qualification", "error");
        frm.txtMinQualification.focus();
        return false;
    }
    if (!isNaN(frm.txtMinQualification.value)) {

        swal("Qualification !", "Should be Characters", "error");
        frm.txtMinQualification.focus();
        return false;
    }

    //experience valid..

    if (frm.txtExperience.value === "") {

        swal("Experience !", "Please Enter Your Company Name", "error");
        frm.txtExperience.focus();
        return false;
    }
//     if (!isNaN(frm.txtExperience.value)) {
//     
//     swal("Experience !", "Should be not Characters", "error");
//     frm.txtExperience.focus();
//     return false;
//     }


    // English Accu.. valid...
    if (frm.txtEnglishAccuracy.value === "") {

        swal("English !", "Please Enter Accuracy", "error");
        frm.txtEnglishAccuracy.focus();
        return false;
    }
    if (!isNaN(frm.txtEnglishAccuracy.value)) {

        swal("English !", "Should be Characters", "error");
        frm.txtEnglishAccuracy.focus();
        return false;
    }

    // Skill Set vali...

    if (frm.txtSkillSet.value === "") {

        swal("Skill !", "Please Enter Skill", "error");
        frm.txtSkillSet.focus();
        return false;
    }
    if (!isNaN(frm.txtSkillSet.value)) {

        swal("Skill !", "Should be Characters", "error");
        frm.txtSkillSet.focus();
        return false;
    }

    //Job Discription vali....
    if (frm.txtJobDescription.value === "") {

        swal("Description !", "Please Enter Job Description", "error");
        frm.txtJobDescription.focus();
        return false;
    }
    if (!isNaN(frm.txtJobDescription.value)) {

        swal("Description !", "Should be Characters", "error");
        frm.txtJobDescription.focus();
        return false;
    }
    /*
     
     if(form.txtJobTiming.value !=='' && !form.txtJobTiming.value.match(re)) {
     alert("Invalid time format: " + form.txtJobTiming.value);
     form.txtJobTiming.focus();
     return false;
     }*/


    //job timing vaid..
    if (frm.txtJobTiming.value === "") {

        swal("Timing !", "Please select JobTiming", "error");
        frm.txtJobTiming.focus();
        return false;
    }
    if (!isNaN(frm.txtJobTiming.value)) {

        swal("Timing !", "Should be charecter", "error");
        frm.txtJobTiming.focus();
        return false;
    }


    // Interview details vali...

    if (frm.txtInterviewDetail.value === "") {

        swal("Details !", "Please select JobTiming", "error");
        frm.txtInterviewDetail.focus();
        return false;
    }
    if (!isNaN(frm.txtInterviewDetail.value)) {

        swal("Details !", "Should be charecter", "error");
        frm.txtInterviewDetail.focus();
        return false;
    }

    // Company Name valid...

    if (frm.txtCompanyName.value === "") {

        swal("Name!", "Please Enter Company Name", "error");
        frm.txtCompanyName.focus();
        return false;
    }
    if (!isNaN(frm.txtCompanyName.value)) {

        swal("Name !", "Should be charecter", "error");
        frm.txtCompanyName.focus();
        return false;
    }

    // Contact Person valid..
    if (frm.txtContactPerson.value === "") {

        swal("Name!", "Please Enter Contact", "error");
        frm.txtContactPerson.focus();
        return false;
    }
    if (!isNaN(frm.txtContactPerson.value)) {

        swal("Name !", "Should be charecter", "error");
        frm.txtContactPerson.focus();
        return false;
    }

    // Phone no vali...   
    if (frm.txtPhoneNumber.value === "") {
        swal("Mobile !", "Please Enter Your Mobile Number", "error");
        frm.txtPhoneNumber.focus();
        return false;
    }
    if (isNaN(frm.txtPhoneNumber.value)) {
        swal("Mobile !", "Enter Correct Your Mobile Number", "error");
        frm.txtPhoneNumber.focus();
        return false;
    }
    if ((frm.txtPhoneNumber.value).length < 10 || (frm.txtPhoneNumber.value).length > 10) {
        swal("Mobile !", "Enter Correct Mobile Number", "error");
        frm.txtPhoneNumber.focus();
        return false;
    }
    if (!frm.txtPhoneNumber.value.match(/^[789]{1}[0-9]{9}$/)) {
        swal("Mobile !", "Enter Correct Mobile Number", "error");
        frm.txtPhoneNumber.focus();
        return false;
    }
    if (frm.txtPhoneNumber.value === "") {
        swal("Mobile !", "Enter Correct Mobile Number", "error");
        frm.txtPhoneNumber.focus();
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


    // Job Address Validation 
    if (frm.txtJobAddress.value === "") {
//     alert("Job Address Should Not Blank");
        swal("Address !", " Please Enter Address", "error");
        frm.txtJobAddress.focus();
        return false;
    }


    //T&C valid...
    if (frm.chkTerm.checked === false) {
        swal("Condition", " Please,You must agree to the term first", "error");
        return false;
    }
    return true;
}



var check = function ()
{
    var minsal = parseInt(document.getElementById("minsal").value);
    var maxsal = parseInt(document.getElementById("maxsal").value);


    if (minsal >= maxsal)
    {
        document.getElementById('message').style.color = 'red';
        document.getElementById('message').innerHTML = 'must be greater than minimum salary';

    } else {
        document.getElementById('message').style.color = '';
        document.getElementById('message').innerHTML = '';
    }
}


