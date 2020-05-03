/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package common;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PC
 */
public class StringProcess {
    public int tinhSoNgay (String date1, String date2){
            Date date11 = chuyenNgay(date1);
            Date date22 = chuyenNgay(date2);
            long diff = date22.getTime() - date11.getTime();
            int getDayDiff = (int) (diff/(24*60*60*1000));
        return getDayDiff;
    }
    
    public Date chuyenNgay(String date){
        SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
        try {
            Date dateconvert = format.parse(date);
            return dateconvert;
        } catch (ParseException ex) {
            Logger.getLogger(StringProcess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null ;
    }
    
    public String maHoa(String password){
        String result= "";
        MessageDigest digest;
        try {
            digest = MessageDigest.getInstance("MD5");
            digest.update(password.getBytes());
            BigInteger bigInteger = new BigInteger(1, digest.digest());
            result = bigInteger.toString(16);
        } catch (NoSuchAlgorithmException ex) {
            ex.printStackTrace();
        }
        return result;
    }
    public static void main(String[] args){
        //StringProcess str = new StringProcess();
        //int soNgay = str.tinhSoNgay("12/27/2016", "1/1/2017");
        //System.out.println(soNgay);
    }
}