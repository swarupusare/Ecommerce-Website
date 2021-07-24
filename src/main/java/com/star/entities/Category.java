
package com.star.entities;

import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Category {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private int cId;
    @Column(name = "Title")
    private String cTitle;
    @Column(name = "Description",length = 500)
    private String cDescription;
    @OneToMany(mappedBy ="category")
    private List<Product> product;

    public Category(int cId, String cTitle, String cDescription) {
        this.cId = cId;
        this.cTitle = cTitle;
        this.cDescription = cDescription;
    }

    public Category(String cTitle, String cDescription,List<Product> product) {
        this.cTitle = cTitle;
        this.cDescription = cDescription;
        this.product=product;
    }

    public Category() {
    }

    public int getcId() {
        return cId;
    }

    public void setcId(int cId) {
        this.cId = cId;
    }

    public String getcTitle() {
        return cTitle;
    }

    public void setcTitle(String cTitle) {
        this.cTitle = cTitle;
    }

    public String getcDescription() {
        return cDescription;
    }

    public void setcDescription(String cDescription) {
        this.cDescription = cDescription;
    }

    @Override
    public String toString() {
        return "Category{" + "cId=" + cId + ", cTitle=" + cTitle + ", cDescription=" + cDescription + '}';
    }
    
    
    
    
}
