
package com.star.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.Pattern;

@Entity
public class Person {
    
   @Id
   @GeneratedValue(strategy = GenerationType.IDENTITY)
   private int id;
   @Column(name ="Name" )
   private String puname;
   
   @Column(name = "Email" ,unique = true)
   @Pattern(regexp = "^[\\w.+\\-]+@gmail\\.com$")
   private String puemail;
   @Column(name = "Password")
   private String pupass;
   @Column(name = "Contact_No")
   private String pumobile;
   @Column(name = "State")
   private String pustate;
   @Column(name = "gender")
   private String pgender;
   
   @Column(name = "user_Type")
   private String userType;


    public Person() {
    }

    public Person(int id, String puname, String puemail, String pupass, String pumobile, String pustate, String pgender, String userType) {
        this.id = id;
        this.puname = puname;
        this.puemail = puemail;
        this.pupass = pupass;
        this.pumobile = pumobile;
        this.pustate = pustate;
        this.pgender = pgender;
        this.userType = userType;
    }

    
    public Person(String puname, String puemail, String pupass, String pumobile, String pustate, String pgender, String userType) {
        this.puname = puname;
        this.puemail = puemail;
        this.pupass = pupass;
        this.pumobile = pumobile;
        this.pustate = pustate;
        this.pgender = pgender;
        this.userType = userType;
    }

   

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPuname() {
        return puname;
    }

    public void setPuname(String puname) {
        this.puname = puname;
    }

    public String getPuemail() {
        return puemail;
    }

    public void setPuemail(String puemail) {
        this.puemail = puemail;
    }

    public String getPupass() {
        return pupass;
    }

    public void setPupass(String pupass) {
        this.pupass = pupass;
    }

    public String getPumobile() {
        return pumobile;
    }

    public void setPumobile(String pumobile) {
        this.pumobile = pumobile;
    }

    public String getPustate() {
        return pustate;
    }

    public void setPustate(String pustate) {
        this.pustate = pustate;
    }

    public String getPgender() {
        return pgender;
    }

    public void setPgender(String pgender) {
        this.pgender = pgender;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }


   
   
   
   
   
    
}
