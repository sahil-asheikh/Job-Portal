/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qt.jobportal.commons;

import java.util.Random;

/**
 * @author Adrenaline Morphine
 */
public class GenerateOTP {
    
    public static final String NUMBERS = "0123456789" ;

    public static String sendOTP(int length, String numbers) {
        char[] otp = new char[length];
        Random r = new Random();
        for (int i = 0; i < length; i++) {
            otp[i] = numbers.charAt(r.nextInt(numbers.length()));
        }

        return String.valueOf(otp);
    }
    
    
//    method for create OTP 
    public static String createOTP(int length) {
        char[] otp = new char[length];
        Random r = new Random();
        for (int i = 0; i < length; i++) {
            otp[i] = NUMBERS.charAt(r.nextInt(NUMBERS.length()));
        }

        return String.valueOf(otp);
    }

     public static void main(String[] args) {
       //  System.out.println(createOTP(6));
    }
}
