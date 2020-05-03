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
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PC
 */
public class Search {

    private String text;

    public Search(String text) {
        this.text = text;
    }

    public Search() {
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public ArrayList<Title> getListTitle(String search) {
        ArrayList<Title> al = new ArrayList<>();
        String[] abc = search.split("\\s+");
        for (String string : abc) {
            try {
                Class.forName(DriverName);
                Connection con = DriverManager.getConnection(dbURL, userDB, passDB);
                PreparedStatement stmt = con.prepareStatement("Select * from TITLE where nameTitle LIKE '%" + string + "%' and isDeleteTitle = 0");
                ResultSet rs = stmt.executeQuery();
                while (rs.next()) {
                    int idTitle = rs.getInt("idTitle");
                    float price = rs.getFloat("price");
                    float rentCost = rs.getFloat("rentCost");
                    int stock = rs.getInt("stock");
                    String description = rs.getString("description");
                    String nameTitle = rs.getString("nameTitle");
                    String image = rs.getString("image");
                    String type = rs.getString("type");
                    String isDeleteTitle = rs.getString("isDeleteTitle");
                    al.add(new Title(description, nameTitle, image, price, rentCost, idTitle, stock, type,isDeleteTitle));
                }
                stmt = con.prepareStatement("Select * from TITLE where type LIKE '%" + string + "%' and isDeleteTitle = 0");
                rs = stmt.executeQuery();
                while (rs.next()) {
                    int idTitle = rs.getInt("idTitle");
                    boolean checkExist = false;
                    for (Title x : al) {
                        if (x.getIdTitle() == idTitle) {
                            checkExist = true;
                        }
                    }
                    if (checkExist == false) {
                        float price = rs.getFloat("price");
                        float rentCost = rs.getFloat("rentCost");
                        int stock = rs.getInt("stock");
                        String description = rs.getString("description");
                        String nameTitle = rs.getString("nameTitle");
                        String image = rs.getString("image");
                        String type = rs.getString("type");
                        String isDeleteTitle = rs.getString("isDeleteTitle");
                        al.add(new Title(description, nameTitle, image, price, rentCost, idTitle, stock, type,isDeleteTitle));
                    }
                }
                con.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return al;
    }
}
