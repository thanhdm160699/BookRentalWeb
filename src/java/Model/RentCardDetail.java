/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import static Model.DataBaseInfo.DriverName;
import static Model.DataBaseInfo.dbURL;
import static Model.DataBaseInfo.passDB;
import static Model.DataBaseInfo.userDB;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author PC
 */
public class RentCardDetail extends Title {

    private int idRentCardDetail, quantity, idRentCard, idBook;
    private float totalRDT;
    private String payDay, rentDay;

    public String getPayDay() {
        return payDay;
    }

    public void setPayDay(String payDay) {
        this.payDay = payDay;
    }

    public String getRentDay() {
        return rentDay;
    }

    public void setRentDay(String rentDay) {
        this.rentDay = rentDay;
    }

    public RentCardDetail(int idRentCardDetail, int quantity, int idRentCard, int idBook, float totalRDT, String description, String nameTitle, String image, float price, float rentCost, int idTitle, int stock, String type,String isDeleteBook) {
        super(description, nameTitle, image, price, rentCost, idTitle, stock, type, isDeleteBook);
        this.idRentCardDetail = idRentCardDetail;
        this.quantity = quantity;
        this.idRentCard = idRentCard;
        this.idBook = idBook;
        this.totalRDT = totalRDT;
    }

    public RentCardDetail(int idRentCardDetail, int quantity, int idRentCard, int idBook, float totalRDT, String payDay, String rentDay) {
        this.idRentCardDetail = idRentCardDetail;
        this.quantity = quantity;
        this.idRentCard = idRentCard;
        this.idBook = idBook;
        this.totalRDT = totalRDT;
        this.payDay = payDay;
        this.rentDay= rentDay;
    }

    public RentCardDetail(int quantity, String description, String nameTitle, String image, float price, float rentCost, int idTitle, int stock, String type, String isDelete) {
        super(description, nameTitle, image, price, rentCost, idTitle, stock, type, isDelete);
        this.quantity = quantity;
    }

    public RentCardDetail(int quantity) {
        this.quantity = quantity;
    }

    public int getIdRentCardDetail() {
        return idRentCardDetail;
    }

    public void setIdRentCardDetail(int idRentCardDetail) {
        this.idRentCardDetail = idRentCardDetail;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getIdRentCard() {
        return idRentCard;
    }

    public void setIdRentCard(int idRentCard) {
        this.idRentCard = idRentCard;
    }

    public int getIdBook() {
        return idBook;
    }

    public void setIdBook(int idBook) {
        this.idBook = idBook;
    }

    public float getTotalRDT() {
        return totalRDT = quantity * rentCost;
    }

    public void setTotalRDT(float totalRDT) {
        this.totalRDT = totalRDT;
    }

    public RentCardDetail() {
        super();
    }

    public void addRentCartDetail(int idRentCard) throws ClassNotFoundException, SQLException {
        idBook = this.getIdBook(idTitle);
        Class.forName(DriverName);
        Connection con = DriverManager.getConnection(dbURL, userDB, passDB);
        PreparedStatement stmt = con.prepareStatement("Insert into RENTCRARDDETAIL (quantity, idBook, idRentCard, totalRDT) values (?,?,?,?)");
        stmt.setInt(1, quantity);
        stmt.setInt(2, idBook);
        stmt.setInt(3, idRentCard);
        stmt.setFloat(4, totalRDT);
        stmt.execute();
        con.close();
    }

    public int getIdBook(int idTitle) throws ClassNotFoundException, SQLException {
        int id = 0;
        Class.forName(DriverName);
        Connection con = DriverManager.getConnection(dbURL, userDB, passDB);
        PreparedStatement stmt = con.prepareStatement("Select top(1) * from BOOK where (status = 'normal' and idTitle=? and borrowed = 0) ");
        stmt.setInt(1, idTitle);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            id = rs.getInt("idBook");
        }
        stmt = con.prepareStatement("Update BOOK set borrowed = 1 where idBook= ? ");
        stmt.setInt(1, id);
        stmt.execute();
        con.close();
        return id;
    }

    public static void main(String[] args){
//        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//        Calendar c = Calendar.getInstance();
//        c.add(Calendar.DAY_OF_YEAR, 25);
//        Date d = (Date) c.getTime();
//        String s = format.format(d);
//        System.out.println(s);
   }
}
