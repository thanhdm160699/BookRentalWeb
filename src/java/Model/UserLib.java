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
import common.StringProcess;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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
public class UserLib {

    private String identityCard, username, password, email, fullname, phone, address, dob, gender, role, status;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getIdentityCard() {
        return identityCard;
    }

    public void setidentityCard(String identityCard) {
        this.identityCard = identityCard;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
//        MessageDigest digest;
//        try {
//            digest = MessageDigest.getInstance("MD5");
//            digest.update(password.getBytes());
//            BigInteger bigInteger = new BigInteger(1, digest.digest());
//            this.password = bigInteger.toString(16);
//        } catch (NoSuchAlgorithmException ex) {
//            ex.printStackTrace();
//        }
        StringProcess str = new StringProcess();
        this.password = str.maHoa(password);
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getGender() {
        if (gender == "0") {
            return "Female";
        }
        return "Male";
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public UserLib(String username, String password) {
        this.username = username;
        StringProcess str = new StringProcess();
        this.password = str.maHoa(password);
    }

    public UserLib(String email, String fullname, String phone, String address, String dob, String gender, String username) {
        this.email = email;
        this.fullname = fullname;
        this.phone = phone;
        this.address = address;
        this.dob = dob;
        this.gender = gender;
        this.username = username;
    }

    public UserLib(String identityCard, String username, String password, String email, String fullname, String phone, String address, String role, String gender, String dob, String status) {
        this.identityCard = identityCard;
        this.username = username;
        StringProcess str = new StringProcess();
        this.password = str.maHoa(password);
        this.email = email;
        this.fullname = fullname;
        this.phone = phone;
        this.address = address;
        this.role = role;
        this.gender = gender;
        this.dob = dob;
        this.status = status;
    }

    public UserLib() {
    }

    public void signUp() throws ClassNotFoundException, SQLException {
        Class.forName(DriverName);
        Connection con = DriverManager.getConnection(dbURL, userDB, passDB);
        PreparedStatement stmt = con.prepareStatement("insert into USERLIB(identityCard, username, password, dob, email, fullname,phone, address, gender, role, isDeleteUser) output inserted.username values(?,?,?,?,?,?,?,?,?,?,?)");
        stmt.setString(1, identityCard);
        stmt.setString(2, username);
        stmt.setString(3, password);
        stmt.setString(4, dob);
        stmt.setString(5, email);
        stmt.setString(6, fullname);
        stmt.setString(7, phone);
        stmt.setString(8, address);
        stmt.setString(9, gender);
        stmt.setString(10, role);
        stmt.setInt(11, 0);
        stmt.execute();
        con.close();
    }

    public UserLib getUserLib(String username) throws ClassNotFoundException, SQLException {
        Class.forName(DriverName);
        Connection con = DriverManager.getConnection(dbURL, userDB, passDB);
        PreparedStatement stmt = con.prepareStatement("select * from USERLIB where username = ?");
        stmt.setString(1, username);
        ResultSet rs = stmt.executeQuery();
        UserLib x = new UserLib();
        while (rs.next()) {
            identityCard = rs.getString("identityCard");
            password = rs.getString("password");
            dob = rs.getString("dob");
            email = rs.getString("email");
            fullname = rs.getString("fullname");
            phone = rs.getString("phone");
            address = rs.getString("address");
            gender = rs.getString("gender");
            role = rs.getString("role");
            status = rs.getString("status");
            x = new UserLib(identityCard, username, password, email, fullname, phone, address, role, gender, dob, status);
        }
        con.close();
        return x;
    }

    public String checkUser() throws SQLException, ClassNotFoundException {
        try {
            Class.forName(DriverName);
            Connection con = DriverManager.getConnection(dbURL, userDB, passDB);
            PreparedStatement stmt = con.prepareStatement("Select * from USERLIB where username = ?");
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return "username";
            }

            stmt = con.prepareStatement("Select * from USERLIB where identityCard = ?");
            stmt.setString(1, identityCard);
            rs = stmt.executeQuery();
            if (rs.next()) {
                return "Identity Card";
            }
            stmt = con.prepareStatement("Select * from USERLIB where email = ?");
            stmt.setString(1, email);
            rs = stmt.executeQuery();
            if (rs.next()) {
                return "email";
            }

            stmt = con.prepareStatement("Select * from USERLIB where phone = ?");
            stmt.setString(1, phone);
            rs = stmt.executeQuery();
            if (rs.next()) {
                return "phone";
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "true";
    }

    public String checkSignUp(UserLib c) throws SQLException, ClassNotFoundException {
        if (c.checkUser().equals("true")) {
            UserLib x = c;
            x.signUp();
            return null;
        }
        return c.checkUser();
    }

    public UserLib login() throws ClassNotFoundException, SQLException {
        Class.forName(DriverName);
        Connection con = DriverManager.getConnection(dbURL, userDB, passDB);
        PreparedStatement stmt = con.prepareStatement("Select * from USERLIB where username = ? and password = ?");
        stmt.setString(1, username);
        stmt.setString(2, password);
        ResultSet rs = stmt.executeQuery();
        UserLib x = null;
        while (rs.next()) {
            identityCard = rs.getString("identityCard");
            dob = rs.getString("dob");
            email = rs.getString("email");
            fullname = rs.getString("fullname");
            phone = rs.getString("phone");
            address = rs.getString("address");
            gender = rs.getString("gender");
            role = rs.getString("role");
            password = rs.getString("password");
            status = rs.getString("status");
            x = new UserLib(identityCard, username, password, email, fullname, phone, address, role, gender, dob, status);
        }
        con.close();
        return x;
    }

    public void update() throws ClassNotFoundException, SQLException {
        Class.forName(DriverName);
        Connection con = DriverManager.getConnection(dbURL, userDB, passDB);
        PreparedStatement stmt = con.prepareStatement("Update USERLIB set fullname=?, dob=?, phone=?, gender=?, email=?,address=? where username=?");
        stmt.setString(1, fullname);
        stmt.setString(2, dob);
        stmt.setString(3, phone);
        stmt.setString(4, gender);
        stmt.setString(5, email);
        stmt.setString(6, address);
        stmt.setString(7, username);
        stmt.executeUpdate();
        con.close();
    }

    public void UpdateStatus(String status) throws ClassNotFoundException, SQLException {
        Class.forName(DriverName);
        Connection con = DriverManager.getConnection(dbURL, userDB, passDB);
        PreparedStatement stmt = con.prepareStatement("Update USERLIB set status= ? where username=?");
        stmt.setString(1, status);
        stmt.setString(2, username);
        stmt.executeUpdate();
        con.close();
    }

    public void changePass() throws ClassNotFoundException, SQLException {
        Class.forName(DriverName);
        Connection con = DriverManager.getConnection(dbURL, userDB, passDB);
        PreparedStatement stmt = con.prepareStatement("update USERLIB set password=? where username=?");
        stmt.setString(1, password);
        stmt.setString(2, username);
        stmt.executeUpdate();
        con.close();
    }

    public ArrayList<UserLib> getAllUser() throws ClassNotFoundException, SQLException {
        ArrayList<UserLib> listUser = new ArrayList<>();
        Class.forName(DriverName);
        Connection con = DriverManager.getConnection(dbURL, userDB, passDB);
        PreparedStatement stmt = con.prepareStatement("select * from USERLIB where isDeleteUser = 0 and role = 1 ");
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            username = rs.getString("username");
            identityCard = rs.getString("identityCard");
            dob = rs.getString("dob");
            email = rs.getString("email");
            fullname = rs.getString("fullname");
            phone = rs.getString("phone");
            address = rs.getString("address");
            gender = rs.getString("gender");
            role = rs.getString("role");
            password = rs.getString("password");
            status = rs.getString("status");
            listUser.add(new UserLib(identityCard, username, password, email, fullname, phone, address, role, gender, dob, status));
        }
        con.close();
        return listUser;
    }
    
    public void deleteUser(String username) throws ClassNotFoundException, SQLException{
        Class.forName(DriverName);
        Connection con = DriverManager.getConnection(dbURL, userDB, passDB);
        PreparedStatement stmt = con.prepareStatement("update USERLIB set isDeleteUser = 1 where username = ?");
        stmt.setString(1, username);
        stmt.executeUpdate();
        con.close();
    }

    public static void main(String[] args) {
        UserLib user = new UserLib("admin", "admin");
        System.out.println(user.getPassword());
    }
}

//protected String description, nameTitle, image, type, isDeleteTitle;
//  protected float price, rentCost;
  //  protected int idTitle, stock;
