package com.star.controller;

import com.star.entities.Category;
import com.star.entities.Person;
import com.star.entities.Product;
import com.star.entities.referproduct;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Controller

public class controllerclass {

    @Autowired
    public UserService userService;

    @RequestMapping(value = "/*", method = RequestMethod.GET)
    public String page(Model md, HttpServletRequest req, HttpSession session) {

        List<Category> loadcategory = userService.loadcategory();

        md.addAttribute("AllCategory", loadcategory);

        String cidd = "All";

        if ("All".equals(cidd)) {
            List<Product> allproducts = userService.getAllproducts();
            md.addAttribute("AllProducts", allproducts);
        } else {
            int cid = Integer.parseInt(cidd.trim());
            List<Product> productbycategoryid = userService.productbycategoryid(cid);
            md.addAttribute("productsbyCategoryid", productbycategoryid);
        }
        return "welcome";
    }

    @RequestMapping(value = "/first")
    public String next() {

        return "nextpage";

    }

    @RequestMapping(value = "/login")
    public String log() {

        return "login";

    }

    @RequestMapping(value = "/welcome")
    public String welcomepage(Model md, @RequestParam("categoryf") String cidd) {
        List<Category> loadcategory = userService.loadcategory();

        md.addAttribute("AllCategory", loadcategory);

        if ("All".equals(cidd)) {
            List<Product> allproducts = userService.getAllproducts();
            md.addAttribute("AllProducts", allproducts);
        } else {
            int cid = Integer.parseInt(cidd.trim());
            List<Product> productbycategoryid = userService.productbycategoryid(cid);
            md.addAttribute("productsbyCategoryid", productbycategoryid);
        }
        return "welcome";

    }

    @RequestMapping(value = "/register")
    public String signuppagedirect() {

        return "redirect:/signup";

    }

    @RequestMapping(value = "/signup")
    public String signuppage() {

        return "signup";

    }

    @RequestMapping(value = "/registerdata", method = RequestMethod.POST)
    public String reg(@Valid @ModelAttribute("personn") Person p, HttpServletRequest req, BindingResult br) {
        HttpSession s = req.getSession();
        if (br.hasErrors()) {
            s.setAttribute("msg", "please enter valid email Address");
            return "signup";
        }
        if (p.getPuname() == "" || p.getPupass() == "" || p.getPuemail() == "") {
            s.setAttribute("msg", "please fill up all required fields");
            return "signup";

        } else {
            int insertop = userService.insertop(p);
//          md.addAttribute("operation ", insertop);
            System.out.println("operation info : " + insertop);
        }

        return "login";
    }

    @RequestMapping(value = "/log", method = RequestMethod.POST)
    public String login(@RequestParam("uname") String name, @RequestParam("upass") String pass, HttpServletRequest req, Model md) {
        System.out.println(name);
        System.out.println(pass);
        HttpSession session = req.getSession();
        if ("".equals(name) || "".equals(pass)) {
            session.setAttribute("msg", "Enter Username & Password");
            return "login";

        }
//        cheking users login details
        List<Person> person = userService.getperson(name, pass);
        
//        calculate total size of category
        List<Category> loadcategory = userService.loadcategory();
        int size = loadcategory.size();
        md.addAttribute("categorySize", size);
//        calculating total size of products
        List<Product> allproducts = userService.getAllproducts();
        int totalpro = allproducts.size();
        md.addAttribute("totalproducts", totalpro);
        System.out.println(person);
        
        //total users means persons
        int totalusers1 = userService.totalusers();
        md.addAttribute("totalusers", totalusers1);

        if (person.isEmpty()) {

            session.setAttribute("msg", "Login failed !! Invalid Username & Password");

            return "login";
        }
        for (Person p : person) {
            if ("normal".equals(p.getUserType())) {
                System.out.println("enter.........");
                session.setAttribute("username", p.getPuname());
                session.setAttribute("id", p.getId());
                session.setAttribute("email", p.getPuemail());
                session.setAttribute("uType", p.getUserType());
                session.setAttribute("password", p.getPupass());
                return "normaluserlogged";

            }
            if ("admin".equals(p.getUserType())) {
                System.out.println(p.getPuname() + " : " + p.getPupass() + " : " + p.getPuemail());
                session.setAttribute("username", p.getPuname());
                session.setAttribute("id", p.getId());
                session.setAttribute("email", p.getPuemail());
                session.setAttribute("uType", p.getUserType());
                session.setAttribute("password", p.getPupass());
                session.setAttribute("allcategory", loadcategory);

                return "loggedpage";
            }

        }

        return "welcome";

    }

    @RequestMapping(value = "/logout")
    public String logout(HttpServletRequest request) {
        HttpSession s = request.getSession();
        s.removeAttribute("username");
        s.removeAttribute("password");
        s.removeAttribute("allcategory");

        return "login";
    }

    @RequestMapping(value = "/addcategory")
    public String Addcategory(@RequestParam("ctitle") String title, @RequestParam("cdesc") String description, HttpServletRequest req ,Model md) {
        HttpSession s = req.getSession();

        Category c1 = new Category();
        c1.setcTitle(title);
        c1.setcDescription(description);
                       
//        calculate total size of category
        List<Category> loadcategory = userService.loadcategory();
        int size = loadcategory.size();
        md.addAttribute("categorySize", size);
//        calculating total size of products
        List<Product> allproducts = userService.getAllproducts();
        int totalpro = allproducts.size();
        md.addAttribute("totalproducts", totalpro);
//        System.out.println(person);
        
        //total users means persons
        int totalusers1 = userService.totalusers();
        md.addAttribute("totalusers", totalusers1);

        if (title == "" || description == "") {
            s.setAttribute("msg", "Enter Title & Description of New Category");

        } else {
            int addcategory = userService.addcategory(c1);
            System.out.println("........." + addcategory);
            if (addcategory > 0) {
                s.setAttribute("msg", "Category Added successfully");
            }
            return "loggedpage";
        }
        return "loggedpage";
    }
//  ADD product  ------

    @RequestMapping(value = "/addproduct", method = RequestMethod.POST)
    public String addproduct(@RequestParam("pName") String name, @RequestParam("pDesc") String desciption, @RequestParam("pPrice") int price, @RequestParam("pDiscount") int discount, @RequestParam("pQuantity") int quantity, @RequestParam("category") int cid, @RequestParam("file") CommonsMultipartFile file, HttpServletRequest req, HttpSession session,Model md) {

        String pname = name;
        System.out.println("Name : " + pname);
        int pprice = price;
        System.out.println("PRice :  " + pprice);
        long image = file.getSize();
        System.out.println("Image Name :" + image);
        String imagename = file.getOriginalFilename();
        System.out.println("Image Name :" + imagename);
        System.out.println("Quantity :" + quantity);
        System.out.println("desciption :" + desciption);

        Product p = new Product();
        p.setpName(name);
        p.setpDesc(desciption);
        p.setpPrice(price);
        p.setpDiscount(discount);
        p.setpQuantity(quantity);

//         -----------------------
        Category categoryObj = userService.getcategorybyid(cid);
        p.setCategory(categoryObj);

//         ------------------
        String path = session.getServletContext().getRealPath("/WEB-INF/resources/upload/");
        String filename = file.getOriginalFilename();

        p.setPimagename(filename);

        System.out.println(path + filename);
               
//        calculate total size of category
        List<Category> loadcategory = userService.loadcategory();
        int size = loadcategory.size();
        md.addAttribute("categorySize", size);
//        calculating total size of products
        List<Product> allproducts = userService.getAllproducts();
        int totalpro = allproducts.size();
        md.addAttribute("totalproducts", totalpro);
//        System.out.println(person);
        
        //total users means persons
        int totalusers1 = userService.totalusers();
        md.addAttribute("totalusers", totalusers1);

        try {
            byte barr[] = file.getBytes();
            try (BufferedOutputStream bout = new BufferedOutputStream(new FileOutputStream(path + filename))) {
                bout.write(barr);
                bout.flush();
            }
            p.setpPhoto(barr);
//          ----------------
        } catch (IOException e) {
            e.printStackTrace();
        }

        HttpSession s = req.getSession();
        int addproduct = userService.addproduct(p);
        System.out.println("addproduct message :" + addproduct);
        if (addproduct > 0) {
            s.setAttribute("msg", "New product Added successfully");
        }
        return "loggedpage";

    }

}
