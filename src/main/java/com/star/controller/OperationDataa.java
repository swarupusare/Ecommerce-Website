
package com.star.controller;

import com.star.entities.Category;
import com.star.entities.Person;
import com.star.entities.Product;
import java.io.Serializable;
import java.util.List;
import javax.transaction.Transactional;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;

import org.springframework.stereotype.Repository;

@Repository
public class OperationDataa {
    
    @Autowired
    public HibernateTemplate hTemplate;
    
    @Transactional
    public int insert(Person p) {
        int save = (int) this.hTemplate.save(p);
        
        return save;
        
    }

    public HibernateTemplate gethTemplate() {
        return hTemplate;
    }

    public void sethTemplate(HibernateTemplate hTemplate) {
        this.hTemplate = hTemplate;
    }

//    @SuppressWarnings("unchecked")
    public List<Person> getp(String uname,String password) {
        
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Person.class);
        detachedCriteria.add(Restrictions.eq("puname", uname));
        detachedCriteria.add(Restrictions.eq("pupass", password));
        List<Person> findByCriteria = (List<Person>) hTemplate.findByCriteria(detachedCriteria);
        
        if(findByCriteria!=null){
            return findByCriteria;
        }
        
        return null;
        
    }

//    add category
    @Transactional
    public int addcate(Category c1){
        int save = (int) this.hTemplate.save(c1);
        return save;
        
    }
   
    //    add product
    @Transactional
    public int addprod(Product p2){
        int save = (int) this.hTemplate.save(p2);
        return save;
        
    }
    
        //    load category
    
    public List<Category> loadAllcategory(){
        
        List<Category> category =  this.hTemplate.loadAll(Category.class);
        return category;
    }
    
      //    get one category by id
    
    public Category getcategoryobjectbyid(int cid){
        
        Category category =  this.hTemplate.get(Category.class,cid);
        
        return category;
    }
      // get all product
     public List<Product> getAllpro() {
        List<Product> loadAllproducts = this.hTemplate.loadAll(Product.class);
        return loadAllproducts;
       
    }
    // get all product
     public List<Product> getproductbyid(int catid) {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Product.class);
        detachedCriteria.add(Restrictions.eq("category.cId", catid));
        List<Product> findByCriteria = (List<Product>) this.hTemplate.findByCriteria(detachedCriteria);
         
         
        return findByCriteria;
       
    }
     //total users
    public int tp(){
        List<Person> getPersons = (List<Person>) this.hTemplate.loadAll(Person.class);
        int size = getPersons.size();
        return size;
        
    }
}
