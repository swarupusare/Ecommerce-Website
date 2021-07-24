
package com.star.controller;

import com.star.entities.Category;
import com.star.entities.Person;
import com.star.entities.Product;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    
    @Autowired
    public OperationDataa op;
    
//    register user
    public int insertop(Person pe){
        return op.insert(pe);
        
        
    }
//    checking login details
    public List<Person> getperson(String name,String pass){
        return op.getp(name,pass);
        
    }
//    add category
    public int addcategory(Category c){
        return op.addcate(c);
        
    }
   //    add product
    public int addproduct(Product p1){
        return op.addprod(p1);
        
    }
       //    add product
    public List<Category> loadcategory(){
        return op.loadAllcategory();
        
        
    }
           //    get category by id
    public Category getcategorybyid(int id){
        return op.getcategoryobjectbyid(id);
        
        
    }
    // get all product
    public List<Product> getAllproducts() {
        return op.getAllpro();
        
    }
    // get all product
    public List<Product> productbycategoryid(int cid) {
        return op.getproductbyid(cid);
        
    }
     // no of users
    public int totalusers() {
        return  op.tp();
        
    }
    
//    =========================
    public OperationDataa getOp() {
        return op;
    }

    public void setOp(OperationDataa op) {
        this.op = op;
    }

    

    
    
    
    
}
