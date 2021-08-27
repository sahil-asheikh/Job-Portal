/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qt.jobportal.commons;


import com.qt.jobportal.beans.TblEmployer;
import java.security.SecureRandom;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSession;

/**

/**
 *
 * @author Nikita
 */
public class Utils {
    Connection con = null;
    DatabaseExistance existance = new DatabaseExistance();
    String sql, message = null;
    ResultSet rs = null;
    CallableStatement cs = null;

      private final String NUMBERS = "0123456789";
    private static final Random RANDOM = new SecureRandom();
    private static final String ALPHABET = "013456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";

    public static boolean empty(String s) {
        if (s == null || s.trim().equals("")) {
            return true;
        } else {
            return false;
        }
    }

    public static <T> T requireNonNull(T obj, String message) {
        if (obj == null || obj.equals(""))
            throw new NullPointerException(message);
        return obj;
    }
      
    private static String generatedRandomString(int length) {
        StringBuilder returnValue = new StringBuilder(length);
        for (int i = 0; i < length; i++) {
            returnValue.append(ALPHABET.charAt(RANDOM.nextInt(ALPHABET.length())));
        }
        return new String(returnValue);
    }
    
    private String generatedRandomInteger(int length) {
        StringBuilder returnValue = new StringBuilder(length);
        for (int i = 0; i < length; i++) {
            returnValue.append(NUMBERS.charAt(RANDOM.nextInt(NUMBERS.length())));
        }
        return new String(returnValue);
    }

    public static String generatePublicId(int length) {
        return generatedRandomString(length);
    }
    
    
    // 
     public  int fetchBalance(String id,String TABLENAME) {
        int balance = 0;
        con = JobPortalDb.connectDb();
        try {
             
           sql = "select balance from " + TABLENAME + " where employer_id = ?";
            cs = con.prepareCall(sql);
            cs.setString(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                balance = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        System.out.println("bal : "+balance);
        return balance;
    }
     
   public  int fetchBalanceCand(String id,String TABLENAME) {
        int balance = 0;
        con = JobPortalDb.connectDb();
        try {
            
           sql = "select balance from " + TABLENAME + " where candidate_id = ?";
            
           cs = con.prepareCall(sql);
            cs.setString(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                balance = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        System.out.println("bal : "+balance);
        return balance;
    }
     

    
}

