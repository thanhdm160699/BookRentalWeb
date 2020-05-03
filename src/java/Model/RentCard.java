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
import java.util.ArrayList;

/**
 *
 * @author PC
 */
public class RentCard {

    private int idRentCard;
    private float total;
    private String term, payDay, identityCard;
    private ArrayList<RentCardDetail> al = new ArrayList<>();

    public RentCard(int idRentCard, String identityCard, float total, String term, String payDay) {
        this.idRentCard = idRentCard;
        this.identityCard = identityCard;
        this.total = total;
        this.term = term;
        this.payDay = payDay;
    }

    public int getIdRentCard() {
        return idRentCard;
    }

    public void setIdRentCard(int idRentCard) {
        this.idRentCard = idRentCard;
    }

    public String getIdentityCard() {
        return identityCard;
    }

    public void setIdentityCard(String identityCard) {
        this.identityCard = identityCard;
    }

    public float getTotal() {
        total = 0;
        for (RentCardDetail x : al) {
            total += x.getTotalRDT();
        }
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public String getTerm() {
        return term;
    }

    public void setTerm(String term) {
        this.term = term;
    }

    public String getPayDay() {
        return payDay;
    }

    public void setPayDay(String payDay) {
        this.payDay = payDay;
    }

    public ArrayList<RentCardDetail> getAl() {
        return al;
    }

    public void setAl(ArrayList<RentCardDetail> al) {
        this.al = al;
    }

    public RentCard() {
    }

    public void addToRentCard(Title x) {
        for (RentCardDetail m : al) {
            if (x.getIdTitle() == m.getIdTitle()) {
                if (m.getStock() >= 1) {
                    m.setQuantity(m.getQuantity() + 1);
                    m.setStock(m.getStock() - 1);
                }
                return;
            }
        }
        x.setStock(x.getStock() - 1);
        al.add(new RentCardDetail(1, x.getDescription(), x.getNameTitle(), x.getImage(), x.getPrice(), x.getRentCost(), x.getIdTitle(), x.getStock(), x.getType(), x.getIsDeleteTitle()));
        return;
    }

    public void removePro(Title p) {
        for (RentCardDetail x : al) {
            if (x.getIdTitle() == p.getIdTitle()) {
                if (x.getQuantity() == 1) {
                    al.remove(al.indexOf(x));
                    x.setStock(x.getStock() + 1);
                    return;
                } else {
                    x.setQuantity(x.getQuantity() - 1);
                    x.setStock(x.getQuantity() + 1);
                    return;
                }
            }
        }
    }

    public void delete() {
        al.clear();
    }

    public void addRentCard() throws ClassNotFoundException, SQLException {
        Class.forName(DriverName);
        Connection con = DriverManager.getConnection(dbURL, userDB, passDB);
        PreparedStatement stmt = con.prepareStatement("insert into RENTCARD (identityCard, total, term, payDay) output inserted.idRentCard values (?,?,?,?)");
        stmt.setString(1, identityCard);
        stmt.setFloat(2, total);
        stmt.setString(3, term);
        stmt.setString(4, payDay);
        ResultSet rs = stmt.executeQuery();
        // 
        if(rs.next()){
            idRentCard = rs.getInt(1);
            setIdRentCard(idRentCard);
        }
        
        for(RentCardDetail x : al){
            x.addRentCartDetail(idRentCard);
            x.reduceStock(x.getQuantity());
        }
    }

}
