
/* global frm */

function subscriptionValidation() {


    var mobPattern = /^[789]{1}[0-9]{9}$/;
    var emailPattern = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;


    //Title validation           
    if (frm.txtTitle.value === "") {

        swal("Name !", "Please Enter Your Title", "error");
        frm.txtTitle.focus();
        return false;
    }
    if (!isNaN(frm.txtTitle.value)) {

        swal("Name !", "Should be Characters", "error");
        frm.txtTitle.focus();
        return false;
    }
    
 
   if (frm.txtTitle.value === "") {

        swal("Name !", "Please Enter Your Title", "error");
        frm.txtTitle.focus();
        return false;
    }
    if (!isNaN(frm.txtTitle.value)) {

        swal("Name !", "Should be Characters", "error");
        frm.txtTitle.focus();
        return false;
    }
  
 
 //Validity validation           
    if (frm.txtPrice.value === "") {

        swal("Price !", "Please Enter Price", "error");
        frm.txtPrice.focus();
        return false;
    }
    if (isNaN(frm.txtPrice.value)) {

        swal("Price !", "nvalid", "error");
        frm.txtPrice.focus();
        return false;
    }
    
    //Suggestion validation           
    if (frm. txtSuggestion.value === "") {
        swal("Suggestion !", "Please Enter Suggestion", "error");
        frm.txtSuggestion.focus();
        return false;
    }
    if (!isNaN(frm.txtSuggestion.value)) {
        swal("Suggestion !", "Should be Characters", "error");
        frm.txtSuggestion.focus();
        return false;
    }

   //Field1 validation           
    if (frm. txtField1.value === "") {
        swal("Field1 !", "Please Enter Field1", "error");
        frm.Field1.focus();
        return false;
    }
    if (!isNaN(frm.txtField1.value)) {
        swal("Field1 !", "Should be Characters", "error");
        frm.txtField1.focus();
        return false;
    }
    
    //Field2 validation           
    if (frm. txtField2.value === "") {

        swal("Field2 !", "Please Enter Field2", "error");
        frm.Field2.focus();
        return false;
    }
    if (!isNaN(frm.txtField2.value)) {

        swal("Field2 !", "Should be Characters", "error");
        frm.txtField2.focus();
        return false;
    }

//Field3 validation           
    if (frm. txtField3.value === "") {

        swal("Field3 !", "Please Enter Field3", "error");
        frm.Field3.focus();
        return false;
    }
    if (!isNaN(frm.txtField3.value)) {

        swal("Field3 !", "Should be Characters", "error");
        frm.txtField3.focus();
        return false;
    }
    
    //Visibility validation           
    if (frm. txtVisibility.value === "") {

        swal("Visibility !", "Please Enter Visibility", "error");
        frm.txtVisibility.focus();
        return false;
    }
    if (!isNaN(frm.txtVisibility.value)) {

        swal("Visibility !", "Valid visibility", "error");
        frm.txtVisibility.focus();
        return false;
    }

    
  if (frm.chkTerms.checked === false)
  {
        swal("Chechbox !", "You Must Agree Terms And Conditions Firstly", "error");
    return  false;
  }
   
}
