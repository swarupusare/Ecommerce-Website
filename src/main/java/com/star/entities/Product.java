
package com.star.entities;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;


@Entity
public class Product {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private int pId;
    @Column(name = "Name")
    private String pName;
    @Column(name = "Description",length = 1000)
    private String pDesc;
    @Column(name = "Price")
    private int pPrice;
    @Column(name = "Discount")
    private int pDiscount;
    @Column(name ="Quantity")
    private int pQuantity;
    
    private String pimagename;
    
    @ManyToOne
    private Category category;
    
    @Lob
    @Column(name = "Product_Image")
    private byte[] pPhoto;
    
    
    
    public Product(int pId, String pName, String pDesc, byte[] pPhoto, int pPrice, int pDiscount, int pQuantity) {
        this.pId = pId;
        this.pName = pName;
        this.pDesc = pDesc;
        this.pPhoto = pPhoto;
        this.pPrice = pPrice;
        this.pDiscount = pDiscount;
        this.pQuantity = pQuantity;
    }

    public Product(String pName, String pDesc, int pPrice, int pDiscount, int pQuantity, String pimagename, Category category, byte[] pPhoto) {
        this.pName = pName;
        this.pDesc = pDesc;
        this.pPrice = pPrice;
        this.pDiscount = pDiscount;
        this.pQuantity = pQuantity;
        this.pimagename = pimagename;
        this.category = category;
        this.pPhoto = pPhoto;
    }

    

   

 

   

    public Product() {
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public String getpDesc() {
        return pDesc;
    }

    public void setpDesc(String pDesc) {
        this.pDesc = pDesc;
    }

    public byte[] getpPhoto() {
        return pPhoto;
    }

    public void setpPhoto(byte[] pPhoto) {
        this.pPhoto = pPhoto;
    }

    public int getpPrice() {
        return pPrice;
    }

    public void setpPrice(int pPrice) {
        this.pPrice = pPrice;
    }

    public int getpDiscount() {
        return pDiscount;
    }

    public void setpDiscount(int pDiscount) {
        this.pDiscount = pDiscount;
    }

    public int getpQuantity() {
        return pQuantity;
    }

    public void setpQuantity(int pQuantity) {
        this.pQuantity = pQuantity;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getPimagename() {
        return pimagename;
    }

    public void setPimagename(String pimagename) {
        this.pimagename = pimagename;
    }
   
   
     
    @Override
    public String toString() {
        return "Product{" + "pId=" + pId + ", pName=" + pName + ", pDesc=" + pDesc + ", pPhoto=" + pPhoto + ", pPrice=" + pPrice + ", pDiscount=" + pDiscount + ", pQuantity=" + pQuantity + '}';
    }
    
    
    //calculate price after discount
    public int getpriceafterDiscount(){
        int d=(int) ((this.getpDiscount()/100.0)*(this.getpPrice()));
        return this.getpPrice()-d;
        
    }
    
}
