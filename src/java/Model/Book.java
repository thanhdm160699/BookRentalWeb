/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author PC
 */
public class Book {
    private String status;
    private int idBook;
    private int idTitle;
    private String borrowed, isDeleteBook;

    public String getIsDeleteBook() {
        return isDeleteBook;
    }

    public void setIsDeleteBook(String isDeleteBook) {
        this.isDeleteBook = isDeleteBook;
    }
    
    public Book() {
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getIdBook() {
        return idBook;
    }

    public void setIdBook(int idBook) {
        this.idBook = idBook;
    }

    public int getIdTitle() {
        return idTitle;
    }

    public void setIdTitle(int idTitle) {
        this.idTitle = idTitle;
    }

    public String getBorrowed() {
        return borrowed;
    }

    public void setBorrowed(String borrowed) {
        this.borrowed = borrowed;
    }

    public Book(String status, int idBook, int idTitle, String borrowed, String isDeleteBook) {
        this.status = status;
        this.idBook = idBook;
        this.idTitle = idTitle;
        this.borrowed = borrowed;
        this.isDeleteBook = isDeleteBook;
    }

}
