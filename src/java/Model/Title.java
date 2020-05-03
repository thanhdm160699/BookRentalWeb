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
import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author PC
 */
public class Title implements Serializable{

    protected String description, nameTitle, image, type, isDeleteTitle;
    protected float price, rentCost;
    protected int idTitle, stock;
    protected ArrayList<Book> al = new ArrayList<>();

    public String getIsDeleteTitle() {
        return isDeleteTitle;
    }

    public void setIsDeleteTitle(String isDeleteTitle) {
        this.isDeleteTitle = isDeleteTitle;
    }

    public ArrayList<Book> getAl() {
        return al;
    }

    public void setAl(ArrayList<Book> al) {
        this.al = al;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getNameTitle() {
        return nameTitle;
    }

    public void setNameTitle(String nameTitle) {
        this.nameTitle = nameTitle;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public float getRentCost() {
        return rentCost;
    }

    public void setRentCost(float rentCost) {
        this.rentCost = rentCost;
    }

    public int getIdTitle() {
        return idTitle;
    }

    public void setIdTitle(int idTitle) {
        this.idTitle = idTitle;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public Title(String description, String nameTitle, String image, float price, float rentCost, int idTitle, int stock, String type, String isDeleteTitle) {
        this.description = description;
        this.nameTitle = nameTitle;
        this.image = image;
        this.price = price;
        this.rentCost = rentCost;
        this.idTitle = idTitle;
        this.stock = stock;
        this.type = type;
        this.isDeleteTitle = isDeleteTitle;
    }

    public Title() {

    }

    public Title getTitle(int id) throws ClassNotFoundException, SQLException {
        Class.forName(DriverName);
        Connection con = DriverManager.getConnection(dbURL, userDB, passDB);
        PreparedStatement stmt = con.prepareStatement("select * from TITLE where idTitle=? and isDeleteTitle =0");
        stmt.setInt(1, id);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            description = rs.getString("description");
            nameTitle = rs.getString("nameTitle");
            image = rs.getString("image");
            price = rs.getFloat("price");
            rentCost = rs.getFloat("rentCost");
            idTitle = rs.getInt("idTitle");
            stock = rs.getInt("stock");
            type = rs.getString("type");
            isDeleteTitle = rs.getString("isDeleteTitle");
            Title x = new Title(description, nameTitle, image, price, rentCost, idTitle, stock, type, isDeleteTitle);
            return x;
        }
        con.close();
        return null;
    }

    public void reduceStock(int quantity) throws ClassNotFoundException, SQLException {
        Class.forName(DriverName);
        Connection con = DriverManager.getConnection(dbURL, userDB, passDB);
        PreparedStatement stmt = con.prepareStatement("update TITLE set stock= ? where idTitle= ?");
        stmt.setInt(1, stock - quantity);
        stmt.setInt(2, idTitle);
        stmt.execute();
        con.close();
    }
    
    public void deleteTitle(int id) throws Exception{
        Class.forName(DriverName);
        Connection con = DriverManager.getConnection(dbURL, userDB, passDB);
        PreparedStatement stmt = con.prepareStatement("update TITLE set isDeleteTitle= 1 where idTitle=?");
        stmt.setInt(1, id);
        stmt.executeUpdate();
        con.close();
    }

}
