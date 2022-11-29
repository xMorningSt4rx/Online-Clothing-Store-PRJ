/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Admin
 */
public class Account {

    private int id;
    private String name;
    private String pass;
    private String address;
    private String contact;
    private int roll;
     private String Yourname;

    public Account() {
    }

    public Account(int id, String name, String pass, String address, String contact, int roll, String Yourname) {
        this.id = id;
        this.name = name;
        this.pass = pass;
        this.address = address;
        this.contact = contact;
        this.roll = roll;
        this.Yourname = Yourname;
    }

    public Account(int id, String name, int roll) {
        this.id = id;
        this.name = name;
        this.roll = roll;
    }

    public Account(int id, String name, String address, String contact, String Yourname) {
        this.id = id;
        this.name = name;
        this.address = address;
        this.contact = contact;
        this.Yourname = Yourname;
    }

    public Account(int id, String pass) {
        this.id = id;
        this.pass = pass;
    }


   

   

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public int getRoll() {
        return roll;
    }

    public void setRoll(int roll) {
        this.roll = roll;
    }

    public String getYourname() {
        return Yourname;
    }

    public void setYourname(String Yourname) {
        this.Yourname = Yourname;
    }

    @Override
    public String toString() {
        return "Account{" + "id=" + id + ", name=" + name + ", pass=" + pass + ", address=" + address + ", contact=" + contact + ", roll=" + roll + ", Yourname=" + Yourname + '}';
    }

    

}
