package com.shoes;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;

import com.shoes.product.*;
import com.shoes.signup.*;
import com.shoes.cart.Cart;
import com.shoes.cart.CartDAO;
import com.shoes.category.*;

@Controller
public class MyController {
	
	@Autowired
	ProductDAO pdao;
	
	@Autowired
	CategoryDAO cdao;
	
	@Autowired
	SignupDAO sdao;
	
	@Autowired
	CartDAO cartdao;
	
	public String test()
	{
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null && !auth.getName().equals("anonymousUser"))
	    {    
	    	System.out.println(auth.getName());
	    	System.out.println("User present");
	    	return "loggedin";
	    }
	    else
	    {
	    	System.out.println("User not present");
	    	return "notloggedin";
	    }
	 }

	@RequestMapping("/")
	public ModelAndView index()
	{
		ModelAndView mv = new ModelAndView("index");
		return mv;
	}
	
	@RequestMapping("/AboutUs")
	public ModelAndView AboutUs()
	{
		ModelAndView mv = new ModelAndView("AboutUs");
		return mv;
	}
	
	@RequestMapping("/ContactUs")
	public ModelAndView ContactUs()
	{
		ModelAndView mv = new ModelAndView("ContactUs");
		return mv;
	}
	
	@RequestMapping("/signup")
	public ModelAndView signup()
	{
		ModelAndView mv = new ModelAndView("signup");
		mv.addObject("signup", new Signup() );
		return mv;
	}
	
	@RequestMapping("/SignUpToDB")
	public ModelAndView SignUpToDB(@Valid @ModelAttribute("signup") Signup s,BindingResult bind)
	{
		ModelAndView mv= new ModelAndView("redirect:/signup");
		if(bind.hasErrors())
		{
			mv = new ModelAndView("signup");
			mv.addObject("signup",  s );
			return mv;
		}
		
		sdao.insert(s);
		return mv;
	}
	
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public ModelAndView login()
	{
		ModelAndView mv = new ModelAndView("login");
		return mv;
	}
	
	@RequestMapping("/AddProd")
	public ModelAndView AddProd()
	{
		ModelAndView mv = new ModelAndView("AddProd");
		mv.addObject("Product", new Product() );
		return mv;
	}
	
	@RequestMapping(value="/AddProdToDB")
	public ModelAndView AddProdToDB( @ModelAttribute("Prod") Product p, HttpServletRequest req )
	{
		ModelAndView mv = new ModelAndView("redirect:/ViewProduct");
		try
		{
			System.out.println(p.getF());
			byte bit[] = p.getF().getBytes();
			System.out.println( req.getRealPath("/") );
			File f1 = new File( req.getRealPath("/") +  "/image.jpg");
			 BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(f1));
	            stream.write(bit);
	            stream.close();
	            
	            Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
	            		  "cloud_name", "dtvl5wzjt",
	            		  "api_key", "974421911615667",
	            		  "api_secret", "2UmHsGXvf2xNa0ws16iTdktEmtA"));
	        
	            Map uploadResult = cloudinary.uploader().upload(f1, ObjectUtils.emptyMap());
	            System.out.println( uploadResult );
	            System.out.println(uploadResult.get("secure_url").toString());
	            p.setImagePath(uploadResult.get("secure_url").toString());
		}
		catch( Exception e )
		{
			e.printStackTrace();
		}
		pdao.insert(p);
		return mv;
	}
	
	@RequestMapping("/ViewProduct")
	public ModelAndView ViewProduct()
	{
		ModelAndView mv=new ModelAndView("ViewProduct");
		mv.addObject("AllProduct", pdao.getProduct());
		return mv;
	}
	
	@RequestMapping("/UpdateProduct/{id}")
	public ModelAndView UpdateProduct(@PathVariable("id") int id)
	{
		ModelAndView mv = new ModelAndView("UpdateProduct");
		mv.addObject("Product",  pdao.getProduct(id));
		return mv;
	}
	
	@RequestMapping(value="/UpdateProduct/UpdateProductToDB",method=RequestMethod.POST)
	public ModelAndView UpdateProductToDB( @ModelAttribute("Product") Product p )
	{
		ModelAndView mv = new ModelAndView("redirect:/ViewProduct");
		pdao.update(p);
		return mv; 
	}
	
	@RequestMapping("/DeleteProductFromDB/{id}")
	public ModelAndView DeleteProductFromDB( @PathVariable("id") int id )
	{
		ModelAndView mv = new ModelAndView("redirect:/ViewProduct");
		pdao.delete(id);
		return mv;
	}
	
	@RequestMapping("/AddCategory")
	public ModelAndView AddCategory()
	{
		ModelAndView mv = new ModelAndView("AddCategory");
		mv.addObject("Category",  new Category() );
		return mv;
	}
	
	@RequestMapping("/ViewCategory")
	public ModelAndView ViewCategory()
	{
		ModelAndView mv = new ModelAndView("ViewCategory");
		mv.addObject("AllCategory",  cdao.getCategory() );
		return mv;
	}
	
	@RequestMapping("/DeleteCategoryFromDB/{id}")
	public ModelAndView DeleteCategoryFromDB( @PathVariable("id") int id )
	{
		ModelAndView mv = new ModelAndView("redirect:/ViewCategory");
		cdao.delete(id);
		return mv;
	}
	
	@RequestMapping("/UpdateCategory/{id}")
	public ModelAndView UpdateCategory(@PathVariable("id") int id)
	{
		ModelAndView mv = new ModelAndView("UpdateCategory");
		mv.addObject("Category",  cdao.getCategory(id));
		return mv;
	}
	
	@RequestMapping(value="/UpdateCategory/UpdateCategoryToDB", method=RequestMethod.POST)
	public ModelAndView UpdatCategoryToDB(@ModelAttribute("Category") Category c)
	{
		ModelAndView mv = new ModelAndView("redirect:/ViewCategory");
		cdao.update(c);
		return mv;
	}
	
	@RequestMapping(value="/AddCategoryToDB")
	public ModelAndView AddCategoryToDB( @ModelAttribute("Category") Category c )
	{
		ModelAndView mv = new ModelAndView("redirect:/ViewCategory");
		cdao.insert(c);
		return mv;
	}

	@RequestMapping("/ViewOneProduct/{id}")
	public ModelAndView ViewOneProduct(@PathVariable("id") int id)
	{
		ModelAndView mv = new ModelAndView("ViewOneProduct");
		mv.addObject("Product",pdao.getProduct(id));
		return mv;
	}
	
	@RequestMapping(value="/AddCartToDB",method=RequestMethod.POST)
	public ModelAndView AddCartToDB( @RequestParam("qty") int q, @RequestParam("id")int abc  )
	{
		ModelAndView mv = new ModelAndView("redirect:/cart");

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		 if (auth != null && !auth.getName().equals("anonymousUser"))
		 {
			 String currUser=auth.getName();
		
			 boolean found = false;
			 int id = -1;
		
		for( Cart c1 : cartdao.getProductsbyName(currUser) )
		{
			if( c1.getUserid().equals(currUser) && c1.getPid()==abc  )
			{
				found = true;
				id = c1.getPid();
				break;				
			}
		}
		
		if( found )
		{
			Cart c = cartdao.getCart(id);
			Product p=pdao.getProduct(abc);
			String qty1=p.getQty();
			int i=Integer.parseInt(qty1);
			int x = c.getQty();
			
			i=i+x-q;
		
			String qty = String.valueOf(i);
			p.setQty(qty);
		    this.pdao.update(p);
           
			c.setQty(q);
			this.cartdao.update(c);
			System.out.println("updated");
			return mv;

		}

		System.out.println(auth.getName());
		
    	Cart c = new Cart();
		
    	Product p=pdao.getProduct(abc);
		String qty1=p.getQty();
		int i=Integer.parseInt(qty1);
		i=i-q;
		System.out.println("i "+i);
		String qty = String.valueOf(i);
		p.setQty(qty);
		System.out.println(p.getQty());
		this.pdao.update(p);
	
		c.setUserid( auth.getName() );
		c.setPid(abc);
		c.setQty(q);
		
		this.cartdao.add(c);
		 }
		 return mv;
	}
	
	@RequestMapping("/DeleteOneProduct/{id}")
	public ModelAndView DeleteOneProduct(@PathVariable("id")int abc)
	{
		ModelAndView mv = new ModelAndView("redirect:/ViewProduct");
		
		pdao.delete(abc);
		
		return mv;
	}
	
	@RequestMapping("/UpdateOneProduct/{id}")
	public ModelAndView UpdateOneProduct(@PathVariable("id")int abc)
	{
		ModelAndView mv = new ModelAndView("updateproduct");
	
		
		Product p = pdao.getProduct(abc);
		mv.addObject("Product",p);
		mv.addObject("Category", cdao.getCategory());
		return mv;
	}

}