/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qt.jobportal.controllers;

import com.qt.jobportal.beans.TblCandidate;
import com.qt.jobportal.beans.TblCandidateDetails;
import com.qt.jobportal.beans.TblCandidatePlan;
import com.qt.jobportal.commons.Utils;
import com.qt.jobportal.models.CandidateModel;
import com.qt.jobportal.models.SubscriptionCandidateModel;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author win8.1
 */
@WebServlet(name = "CandidateController", urlPatterns = {"/CandidateController"})

@MultipartConfig        // have to user to get the name of the file
public class CandidateController extends HttpServlet {

    CandidateModel model = new CandidateModel();
    TblCandidate beans = new TblCandidate();
    String msg = null;
    SubscriptionCandidateModel sub = new SubscriptionCandidateModel();
    String path = "D:\\QaswaTech\\WORKSPACE\\files\\" + File.separator; // path where all the resumes will save

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        System.out.println(request.getParameter("action"));

        switch (action) {
            case "insert":
                candidateInsert(request, response);
                break;
            case "update":
                candidateUpdate(request, response);
                break;
            case "delete":
                candidateDelete(request, response);
                break;
            case "login":
                candidateLogin(request, response);
                break;
            case "logout":
                HttpSession session = request.getSession();
                session.invalidate();
                response.sendRedirect("index.jsp");
                break;
            case "passwordUpdate":
                passwordUpdate(request, response);
                break;
            case "summary":
                addSummary(request, response);
                break;
            case "experience":
                addExperience(request, response);
                break;
            case "signUp":
                signUpCandidate(request, response);
                break;
            case "uploadResume":
                uploadResume(request, response);
                break;
            case "deleteResume":
                deleteResume(request, response);
                break;
            case "editResume":
                editResume(request, response);
                break;
            case "viewResume":
                viewResume(request, response);
                break;
            case "pricing":
                getSubscription(request, response);
                break;
            case "saveAboutMe":
                saveAboutMe(request, response);
                break;
            case "saveJobRole":
                saveJobRole(request, response);
                break;
            case "saveEducationDetails":
                saveEducationDetails(request, response);
                break;
            case "saveExperianceDetails":
                saveExperianceDetails(request, response);
                break;
            case "saveSkills":
                saveSkills(request, response);
                break;
            case "savePersonalDetails":
                savePersonalDetails(request, response);
                break;
            default:
                break;
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void candidateInsert(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int balance;
        balance = 0;

        int bal = sub.SubscriptionCandAmountEmp(request.getParameter("txtSubscription"));
        // employer.setSubscriptionPlan(sub.SubscriptionAmountEmp(request.getParameter("txtSubscription"))));
        beans.setBalance(bal);

        String publicId = Utils.generatePublicId(30);
        beans.setCandPublicId(publicId);

        beans.setFullName(request.getParameter("txtFullName"));
        beans.setSubscriptionId(request.getParameter("txtSubscription"));
//            beans.setBalance(Integer.parseInt(request.getParameter("txtBalance")));
//     
        System.out.println(request.getParameter("txtState"));
        beans.setState(request.getParameter("txtState"));
        beans.setPhone_No(request.getParameter("txtPhoneNo"));
        beans.setCity(request.getParameter("txtCity"));
        beans.setAddress(request.getParameter("txtAddress"));
        beans.setAge(Integer.parseInt(request.getParameter("txtAge")));
        beans.setGender(request.getParameter("rdGender"));
        beans.setQualification(request.getParameter("slQualification"));
        beans.setSchoolMedium(request.getParameter("slSchoolMedium"));
        beans.setEnglishSkill(request.getParameter("slEnglishAccuracy"));
        beans.setFresherExperience(request.getParameter("rdFE"));
        beans.setJobRole(request.getParameter("txtJobRole"));
        beans.setSkillSet(request.getParameter("txtSkillSet"));
        beans.setPassword(request.getParameter("txtPassword"));
        beans.setEmailId(request.getParameter("txtEmailId"));

        msg = model.insert(beans);
        response.sendRedirect("index.jsp?message=" + msg);

    }

    private void candidateUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {

        beans.setCandPublicId(request.getParameter("id"));
        beans.setSubscriptionId(request.getParameter("txtSubscription"));

        beans.setFullName(request.getParameter("txtFullName"));
        beans.setState(request.getParameter("txtState"));
        beans.setPhone_No(request.getParameter("txtPhoneNo"));
        beans.setCity(request.getParameter("txtCity"));
        beans.setAddress(request.getParameter("txtAddress"));
        beans.setAge(Integer.parseInt(request.getParameter("txtAge")));
        beans.setGender(request.getParameter("rdGender"));
        beans.setQualification(request.getParameter("slQualification"));
        beans.setSchoolMedium(request.getParameter("slSchoolMedium"));
        beans.setEnglishSkill(request.getParameter("slEnglishAccuracy"));
        beans.setFresherExperience(request.getParameter("rdFE"));
        beans.setJobRole(request.getParameter("txtJobRole"));
        beans.setSkillSet(request.getParameter("txtSkillSet"));
        beans.setPassword(request.getParameter("txtPassword"));
        beans.setEmailId(request.getParameter("txtEmailId"));

        msg = model.update(beans);
        response.sendRedirect("candidate/profile.jsp?id=" + beans.getCandPublicId() + "&message=" + msg);

    }

    private void candidateDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {

        if (request.getParameter("cid") == null || request.getParameter("cid").equals("")) {
            msg = "Id should not be empty!";
        } else {

            beans.setCandPublicId(request.getParameter("cid"));
            msg = model.delete(beans);
            response.sendRedirect("admin/candidateShow.jsp?message=" + msg);
        }
    }

    private void candidateLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        beans.setPhone_No(request.getParameter("txtPhoneNo"));
        beans.setPassword(request.getParameter("txtPassword"));
        int status = model.doLogin(beans, request);
        switch (status) {
            case -1:
                msg = "Please Register Yourself";
                break;
            case 0:
                msg = "You are Blocked! Please Contact to admin";
                break;
            case 1:
                msg = "Login Successfully";
                break;
            case 2:
                msg = "You have Entered wrong password";
                break;
        }
        String pageName = request.getParameter("page");
        if (pageName == null) {
            response.sendRedirect("candidateLogin.jsp?msg=" + msg);
        } else {
            response.sendRedirect(pageName + "?msg=" + msg);

        }
    }

    //candidate login update
    private void passwordUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {

        if (request.getParameter("newPassword").equals(request.getParameter("confirmPassword"))) {
            String empId = request.getParameter("id");

            beans.setCandPublicId(request.getParameter("id"));

            beans.setValidPassword(request.getParameter("validPassword"));

            beans.setNewPassword(request.getParameter("newPassword"));
            beans.setConfirmPassword(request.getParameter("confirmPassword"));

            msg = model.updatePassword(beans);
            response.sendRedirect("candidate/profile.jsp?id=" + empId + "&message=" + msg);

        } else {
            msg = "Password Not Matched";
            response.sendRedirect("candidate/updatePassword.jsp?message=" + msg);

        }
    }

    private void addSummary(HttpServletRequest request, HttpServletResponse response) throws IOException {
        TblCandidateDetails candidateDetail = new TblCandidateDetails();
        String publicId = Utils.generatePublicId(30);
        candidateDetail.setCandDetailsPublicId(publicId);
        candidateDetail.setCandPublicId(request.getParameter("candidateId"));
        candidateDetail.setSummary(request.getParameter("txtSummary"));
        msg = model.insertSummary(candidateDetail);
        response.sendRedirect("candidate/profile.jsp?id=" + request.getParameter("CandidateId") + "&message=" + msg);
    }

    private void addExperience(HttpServletRequest request, HttpServletResponse response) throws IOException {
        TblCandidateDetails candidateDetail = new TblCandidateDetails();
        String publicId = Utils.generatePublicId(30);
        candidateDetail.setCandDetailsPublicId(publicId);
        candidateDetail.setCandPublicId(request.getParameter("candidateId"));
        candidateDetail.setExperienceDetails(request.getParameter("txtExperience"));
        msg = model.experienceDetail(candidateDetail);
        response.sendRedirect("candidate/profile.jsp?id=" + request.getParameter("CandidateId") + "&message=" + msg);
    }

//    method to sign up the candidate signUpCandidate
    private void signUpCandidate(HttpServletRequest request, HttpServletResponse response) throws IOException {

        TblCandidate bn = new TblCandidate();

        String candidateID = Utils.generatePublicId(30);
        bn.setCandPublicId(candidateID);
        bn.setFullName(request.getParameter("txtFullName"));
        bn.setPhone_No(request.getParameter("txtPhoneNo"));
        bn.setEmailId(request.getParameter("txtEmailId"));
        bn.setPassword(request.getParameter("txtPassword"));

        CandidateModel modal = new CandidateModel();
        msg = modal.candSignUp(bn);

        response.sendRedirect("candidateLogin.jsp?message=" + msg);

    }

//    method to  Upload Resume
    private void uploadResume(HttpServletRequest request, HttpServletResponse response) throws IOException {

        try {
//            fetching userID using session
            HttpSession session = request.getSession(false);
            String userID = session.getAttribute("CandidateId").toString();

//            creating the object of Parts to get and read the resume name
            Part part = request.getPart("resumeFile");  //Part allows a particular implementation to use, for example, file renaming, file name fetch etc.
            String fileUploaded = part.getSubmittedFileName();  // getting the name of a file using Part Class

//          creating a unique for resume
            String fileName = Utils.generatePublicId(10) + fileUploaded;

//          Storing pdf into the
            if (fileUploaded != null) {
//              invoking the method to save the file name into the database
                int i = CandidateModel.uploadResume(fileName, userID);     // updating the file name into the database
//              checking if file name is stored or not
                if (i == 1) {
//                  file's name is stored into the database now upload the file into the folder

//                    getting the name of the resume using Parts
                    InputStream is = part.getInputStream(); //it is used for reading a file, image, audio, video, webpage, etc.
                    byte[] data = new byte[is.available()]; //getting InputStream values into byte
                    is.read(data);      // reads the resume name

                    //FileOutputStream is used for writing streams of raw bytes such as image data, file data
                    FileOutputStream fos = new FileOutputStream(path + fileName);   // creating object with path and fileName parameters
                    fos.write(data);    // storing file at the path location
                    fos.close();    // closing the FileOutputStream

//                  renaming the resume with the unique name same as stored in database i.e. fileName
                    File file = new File(path + fileUploaded);  // Create an object of the File class to Replace the file path with path of the directory
                    File rename = new File(path + fileName);    // Create an object of the File class to Replace the file path with path of the directory
                    file.renameTo(rename);   //executing the file to change the name

                    msg = "Resume Uploaded";

                } else {
                    msg = "File not uploaded";
                }
            } else {
                msg = "Please upload File";
            }
        } catch (Exception e) {
            e.printStackTrace();
            msg = "an error occurred while saving your resume";
        } finally {
            response.sendRedirect("candidate/profile.jsp?id=" + request.getParameter("CandidateId") + "&message=" + msg);
        }

    }

//    method to delete resume
    private void deleteResume(HttpServletRequest request, HttpServletResponse response) throws IOException {

//        fetching the userID using session
        HttpSession session = request.getSession(false);
        String userID = session.getAttribute("CandidateId").toString();

        String fileName = CandidateModel.retrieveResumename(userID);

        try {
//            checking if resume is uploaded or not
            if (CandidateModel.resumeAvailable(userID)) {
//                this method will null the value of resumePath column in the database
                int i = CandidateModel.deleteResume(userID);
                if (i == 1) {
//                    creating the object of the file of path+fileName location
                    File file = new File(path + fileName);
//                    deleting the file using delete() function
                    if (file.delete()) {
//                        passing the null value to the database to store into resumePath as a delete resume path
                        String emptyFileName = "";
//                        change the path in the database null
                        i = CandidateModel.uploadResume(emptyFileName, userID);
                        msg = "Resume Deleted";
                    } else {
                        msg = "Failed to delete Resume";
                    }
                } else {
                    msg = "Failed to delete Resume SQL ISSUE";
                }

            } else {
                msg = "Something went wrong Check";
            }

        } catch (Exception e) {
            e.printStackTrace();
            msg = "an error occurred while deleting your resume";
        } finally {
            response.sendRedirect("candidate/profile.jsp?id=" + request.getParameter("CandidateId") + "&message=" + msg);
        }

    }

//    method to edit the resume
//        in this method we'll delete the resume and then upload the new resume with the same name and update that into the database
    private void editResume(HttpServletRequest request, HttpServletResponse response) throws FileNotFoundException, IOException {

//        fetching the userID using session
        HttpSession session = request.getSession(false);
        String userID = session.getAttribute("CandidateId").toString();

        String fileName = CandidateModel.retrieveResumename(userID);

        try {
//            this is the same method that we have used to delete the resume
//            we are not using method direct because we have to delete and if file is deleted then have to save new file
//            checking if resume is available in the database or not
            if (CandidateModel.resumeAvailable(userID)) {
//                deleting the path of the resume at the database
                int i = CandidateModel.deleteResume(userID);
                if (i == 1) {
//                    getting the file from path+fileName location
                    File file = new File(path + fileName);
//                    deleting the file using delete() function
                    if (file.delete()) {
//                        if file is deleted then updating the datbase's resumePath with null value as a deleted resumePath
                        String emptyFileName = "";
                        i = CandidateModel.uploadResume(emptyFileName, userID);

//            creating the object of Parts to get and read the resume name
                        Part part = request.getPart("resumeFile");  //Part allows a particular implementation to use, for example, file renaming, file name fetch etc.
                        String fileUploaded = part.getSubmittedFileName();  // getting the name of a file using Part Class
                        System.out.println("FILE NAME: " + fileUploaded);

//          Storing pdf into the
                        if (fileUploaded != null) {
//              invoking the method to save the file name into the database
                            String renameFile = Utils.generatePublicId(10) + fileUploaded;
                            i = CandidateModel.uploadResume(renameFile, userID);     // updating the file name into the database
//              checking if file name is stored or not
                            if (i == 1) {
//                  file's name is stored into the database now upload the file into the folder
//                    getting the name of the resume using Parts
                                InputStream is = part.getInputStream(); //it is used for reading a file, image, audio, video, webpage, etc.
                                byte[] data = new byte[is.available()]; //getting InputStream values into byte
                                is.read(data);      // reads the resume name

                                //FileOutputStream is used for writing streams of raw bytes such as image data, file data
                                FileOutputStream fos = new FileOutputStream(path + fileUploaded);   // creating object with path and fileName parameters
                                fos.write(data);    // storing file at the path location
                                fos.close();    // closing the FileOutputStream

//                  renaming the resume with the unique name same as stored in database i.e. fileName
                                file = new File(path + fileUploaded);  // Create an object of the File class to Replace the file path with path of the directory
                                File rename = new File(path + renameFile);    // Create an object of the File class to Replace the file path with path of the directory
                                file.renameTo(rename);   //executing the file to change the name

                                msg = "Resume Updated";

                            } else {
                                msg = "File not Updated";
                            }
                        } else {
                            msg = "Please upload File";
                        }
                    } else {
                        msg = "Failed to delete Resume";
                    }
                } else {
                    msg = "Failed to delete Resume SQL ISSUE";
                }

            } else {
                msg = "Something went wrong Check";
            }

        } catch (Exception e) {
            e.printStackTrace();
            msg = "an error occurred while deleting your resume";
        } finally {
            response.sendRedirect("candidate/profile.jsp?id=" + request.getParameter("CandidateId") + "&message=" + msg);
        }

    }

//    method to view Resume viewResume or Download resume
    private void viewResume(HttpServletRequest request, HttpServletResponse response) throws IOException {

    }

//    method to purchase subscription
    private void getSubscription(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String candidateID = request.getParameter("candidateId");
        String subscriptionId = request.getParameter("subscriptionId");
        int i = 0;
        TblCandidatePlan subscriptionCandidate = SubscriptionCandidateModel.selectSubscriptionPlan(subscriptionId);

        String plan_title = subscriptionCandidate.getPlanTitle();
        int plan_amount = subscriptionCandidate.getPlanAmout();
        String validity_in_days = subscriptionCandidate.getValidityInDays();
        int availableBalance = SubscriptionCandidateModel.getBalance(candidateID) + plan_amount;
        String start_date = LocalDate.now().toString();
        String end_date = LocalDate.now().plusDays(Integer.parseInt(validity_in_days)).toString();

//        switch (validity_in_days) {
//            case "3 month":
//                end_date = LocalDate.now().plusMonths(3).toString();
//                break;
//            case "4 month":
//                end_date = LocalDate.now().plusMonths(4).toString();
//                break;
//            case "6 month":
//                end_date = LocalDate.now().plusMonths(6).toString();
//                break;
//            case "12 month":
//                end_date = LocalDate.now().plusMonths(12).toString();
//                break;
//            default:
//                end_date = "00-00-0000";
//                break;
//        }
        int per_apply_deduction = subscriptionCandidate.getPerApplyDeduction();
        String plan_suggestion = subscriptionCandidate.getPlanSuggestion();

//                setting the values
        TblCandidatePlan getPlan = new TblCandidatePlan();
        getPlan.setCandidateId(candidateID);
        getPlan.setPlanTitle(plan_title);
        getPlan.setPlanAmout(plan_amount);
        getPlan.setAvailableBalance(availableBalance);
        getPlan.setValidityInDays(validity_in_days);
        getPlan.setStartDate(start_date);
        getPlan.setEndDate(end_date);
        getPlan.setPerApplyDeduction(per_apply_deduction);
        getPlan.setPlanSuggestion(plan_suggestion);

        i = SubscriptionCandidateModel.purchaseSubscription(getPlan, subscriptionId, availableBalance);

//        }
        if (i == 1) {
            msg = "Your plan has been purchased";
        } else {
            msg = "Failed to puchase your plan";
        }

        response.sendRedirect("candidate/profile.jsp?id=" + request.getParameter("candidateId") + "&message=" + msg);

    }

//    method to save About me/ summary
    private void saveAboutMe(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String cid = request.getParameter("id");
        String aboutMe = request.getParameter("aboutMe");

        try {
            TblCandidateDetails candidate = new TblCandidateDetails();

            candidate.setCandDetailsPublicId(Utils.generatePublicId(30));
            candidate.setCandPublicId(cid);
            candidate.setSummary(aboutMe);

            CandidateModel candidateModal = new CandidateModel();
            msg = candidateModal.insertSummary(candidate);

        } catch (Exception e) {
            e.printStackTrace();
            msg = "an error occurred while deleting your resume";
        } finally {
            response.sendRedirect("candidate/profile.jsp?id=" + request.getParameter("id") + "&message=" + msg);
        }

    }

//    method to update the job role
    private void saveJobRole(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String cid = request.getParameter("id");
        String jobRole = request.getParameter("jobRole");

        try {
            TblCandidate candidate = new TblCandidate();

            candidate.setCandPublicId(cid);
            candidate.setJobRole(jobRole);

            CandidateModel candidateModal = new CandidateModel();
            msg = candidateModal.updateJobRole(candidate);

        } catch (Exception e) {
            e.printStackTrace();
            msg = "an error occurred while deleting your resume";
        } finally {
            response.sendRedirect("candidate/profile.jsp?id=" + request.getParameter("id") + "&message=" + msg);
        }

    }

//    method to update the education details
    private void saveEducationDetails(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String cid = request.getParameter("id");
        String qualification = request.getParameter("qualification");
        String schoolName = request.getParameter("schoolMedium");

        try {
            TblCandidate candidate = new TblCandidate();

            candidate.setCandPublicId(cid);
            candidate.setQualification(qualification);
            candidate.setSchoolMedium(schoolName);

            CandidateModel candidateModal = new CandidateModel();
            msg = candidateModal.updateEduDetails(candidate);

        } catch (Exception e) {
            e.printStackTrace();
            msg = "an error occurred while deleting your resume";
        } finally {
            response.sendRedirect("candidate/profile.jsp?id=" + request.getParameter("id") + "&message=" + msg);
        }

    }

//    method to update the experiance details
    private void saveExperianceDetails(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String cid = request.getParameter("id");
        String experianceYear = request.getParameter("experienceYear");
        String experianceDetails = request.getParameter("aboutexperianceDetail");

        try {
            TblCandidateDetails candidate = new TblCandidateDetails();

            candidate.setCandPublicId(cid);
            candidate.setExperience(experianceYear);
            candidate.setExperienceDetails(experianceDetails);

            CandidateModel candidateModal = new CandidateModel();
            msg = candidateModal.updateExperinceDetails(candidate);

        } catch (Exception e) {
            e.printStackTrace();
            msg = "an error occurred while deleting your resume";
        } finally {
            response.sendRedirect("candidate/profile.jsp?id=" + request.getParameter("id") + "&message=" + msg);
        }

    }

//    method to update skills
    private void saveSkills(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String cid = request.getParameter("id");
        String englishSkills = request.getParameter("englishFluency");

        String jobSkills[] = request.getParameterValues("txtSkillSet");

        String skill = "";
        for (String sk : jobSkills) {
            skill += sk;
        }

        try {
            TblCandidate candidate = new TblCandidate();
            candidate.setEnglishSkill(englishSkills);
            candidate.setSkillSet(skill);
            candidate.setCandPublicId(cid);
            msg = CandidateModel.updateSkills(candidate);
        } catch (Exception e) {
            e.printStackTrace();
            msg = "an error occurred";
        } finally {
            response.sendRedirect("candidate/profile.jsp?id=" + request.getParameter("id") + "&message=" + msg);
        }
    }

//    method to save the personal details
    private void savePersonalDetails(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String cid = request.getParameter("id");
        int age = Integer.parseInt(request.getParameter("age").toString());
        String gender = request.getParameter("gender");
        String state = request.getParameter("txtState");
        String city = request.getParameter("txtCity");

        String address = request.getParameter("address");

        try {

            TblCandidate candidate = new TblCandidate();
            candidate.setCandPublicId(cid);
            candidate.setAge(age);
            candidate.setGender(gender);
            candidate.setState(state);
            candidate.setCity(city);
            candidate.setAddress(address);

            CandidateModel candidateModel = new CandidateModel();

            msg = candidateModel.updatePersonalDetails(candidate);

        } catch (Exception e) {
            e.printStackTrace();
            msg = "an error occurred";
        } finally {
            response.sendRedirect("candidate/profile.jsp?id=" + request.getParameter("id") + "&message=" + msg);
        }

    }

}
