/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Date;

/**
 *
 * @author Admin
 */
public class OderList {
    private int OderID;
    private String UserID;
    private String ProductID;
    private String OrderDate;
    private String productName;
    private String categoryName;
    private int quantity;
    private int total;
    private String status;
    private int id;
    private String Payment;
    private String note;

    public OderList() {
    }

    public OderList(int OderID, String ProductID, int quantity, String status) {
        this.OderID = OderID;
        this.ProductID = ProductID;
        this.quantity = quantity;
        this.status = status;
    }

    public OderList(String UserID, String OrderDate, int total, String Payment, String note) {
        this.UserID = UserID;
        this.OrderDate = OrderDate;
        this.total = total;
        this.Payment = Payment;
        this.note = note;
    }

    public OderList(int OderID, String UserID, String OrderDate, int total, String Payment, String note) {
        this.OderID = OderID;
        this.UserID = UserID;
        this.OrderDate = OrderDate;
        this.total = total;
        this.Payment = Payment;
        this.note = note;
    }

    public String getProductID() {
        return ProductID;
    }

    public void setProductID(String ProductID) {
        this.ProductID = ProductID;
    }

    public String getPayment() {
        return Payment;
    }

    public void setPayment(String Payment) {
        this.Payment = Payment;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
    

    public OderList(int OderID, String UserID, String OrderDate, String productName, String categoryName, int quantity, int total) {
        this.OderID = OderID;
        this.UserID = UserID;
        this.OrderDate = OrderDate;
        this.productName = productName;
        this.categoryName = categoryName;
        this.quantity = quantity;
        this.total = total;
    }

    public OderList(int OderID, String UserID, String OrderDate, String productName, String categoryName, int quantity, int total, String status) {
        this.OderID = OderID;
        this.UserID = UserID;
        this.OrderDate = OrderDate;
        this.productName = productName;
        this.categoryName = categoryName;
        this.quantity = quantity;
        this.total = total;
        this.status = status;
    }

    public OderList(int OderID, String UserID, String OrderDate, String productName, String categoryName, int quantity, int total, String status, int id) {
        this.OderID = OderID;
        this.UserID = UserID;
        this.OrderDate = OrderDate;
        this.productName = productName;
        this.categoryName = categoryName;
        this.quantity = quantity;
        this.total = total;
        this.status = status;
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    

    public int getOderID() {
        return OderID;
    }

    public void setOderID(int OderID) {
        this.OderID = OderID;
    }

    public String getUserID() {
        return UserID;
    }

    public void setUserID(String UserID) {
        this.UserID = UserID;
    }

    public String getOrderDate() {
        return OrderDate;
    }

    public void setOrderDate(String OrderDate) {
        this.OrderDate = OrderDate;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    @Override
    public String toString() {
        return "OderList{" + "OderID=" + OderID + ", UserID=" + UserID + ", OrderDate=" + OrderDate + ", productName=" + productName + ", categoryName=" + categoryName + ", quantity=" + quantity + ", total=" + total + '}';
    }
    
    
}
