
package com.star.entities;





public class referproduct {
    

    
    private String pName;
    
    private String pDesc;
    
    private int pPrice;
    
    private int pDiscount;
    
    private int pQuantity;
    
    private byte[] pPhoto;

    public referproduct(String pName, String pDesc, int pPrice, int pDiscount, int pQuantity, byte[] pPhoto) {
        this.pName = pName;
        this.pDesc = pDesc;
        this.pPrice = pPrice;
        this.pDiscount = pDiscount;
        this.pQuantity = pQuantity;
        this.pPhoto = pPhoto;
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

    public byte[] getpPhoto() {
        return pPhoto;
    }

    public void setpPhoto(byte[] pPhoto) {
        this.pPhoto = pPhoto;
    }
    
    
    
    
}
