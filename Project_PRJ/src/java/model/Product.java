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
public class Product {

    private int Productid;
    private String Productname;
    private String Detail;
    private String image;
    private int price;
    private int quantily;
    private int CategoryID;
    private int discount;
    private String size;

    public Product() {
    }

    public Product(String Productname) {
        this.Productname = Productname;
    }

    public Product(int Productid, String Productname, String Detail, String image, int price, int quantily, int CategoryID, int discount, String size) {
        this.Productid = Productid;
        this.Productname = Productname;
        this.Detail = Detail;
        this.image = image;
        this.price = price;
        this.quantily = quantily;
        this.CategoryID = CategoryID;
        this.discount = discount;
        this.size = size.trim();
    }

    public Product(int Productid, String Productname, String Detail, String image, int price, int quantily, int CategoryID, int discount) {
        this.Productid = Productid;
        this.Productname = Productname;
        this.Detail = Detail;
        this.image = image;
        this.price = price;
        this.quantily = quantily;
        this.CategoryID = CategoryID;
        this.discount = discount;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public int getProductid() {
        return Productid;
    }

    public void setProductid(int Productid) {
        this.Productid = Productid;
    }

    public String getProductname() {
        return Productname;
    }

    public void setProductname(String Productname) {
        this.Productname = Productname;
    }

    public String getDetail() {
        return Detail;
    }

    public void setDetail(String Detail) {
        this.Detail = Detail;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuantily() {
        return quantily;
    }

    public void setQuantily(int quantily) {
        this.quantily = quantily;
    }

    public int getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(int CategoryID) {
        this.CategoryID = CategoryID;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    @Override
    public String toString() {
        return "Product{" + "Productid=" + Productid + ", Productname=" + Productname + ", Detail=" + Detail + ", image=" + image + ", price=" + price + ", quantily=" + quantily + ", CategoryID=" + CategoryID + ", discount=" + discount + '}';
    }

}
