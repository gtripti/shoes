package com.shoes;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.shoes.cart.Cart;
import com.shoes.cart.CartDAO;
import com.shoes.product.Product;
import com.shoes.product.ProductDAO;
import com.shoes.signup.Signup;
import com.shoes.signup.SignupDAO;

@RestController
public class TheGreatRestController {
	
	@Autowired
	CartDAO cdao;
	
	@Autowired
	ProductDAO pdao;
	
	@Autowired
	SignupDAO sdao;
	
	private String getCurrentUser(){
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null && !auth.getName().equals("anonymousUser"))
	    {    
	    	System.out.println(auth.getName());
	    	System.out.println("User present");
	    	return auth.getName();
	    }
	    
		return "";
	}
	
	@RequestMapping(value="fetchCartItems",method=RequestMethod.POST)
	public ResponseEntity<String> fetchCartItems()
	{
		JSONObject jobj= new JSONObject();
		
		System.out.println(jobj.toJSONString());
		
		JSONArray jarr = new JSONArray();
		
		String user = this.getCurrentUser();
		
		for( Cart c : cdao.getCart() ){
		
			
			if( c.getUserid().equals(user) ){
				jobj = new JSONObject();
				
				Product p = pdao.getProduct(c.getPid());
				
				jobj.put("cid", c.getId());
				
				jobj.put("pname", p.getName());
				jobj.put("pprice", p.getPrice());
				
				jobj.put("pqty",p.getQty());
				
				jobj.put("pimg",p.getImagePath());
				
				jarr.add(jobj);
			}
			
		}
		
		System.out.println(jarr.toJSONString());
		
		return new ResponseEntity<String>(jarr.toJSONString(),HttpStatus.OK);
	}
	
	@RequestMapping(value="/DeleteCartItems",method=RequestMethod.POST)
	public String DeleteCartItems()
	{
		System.out.println("DeleteCartItems");
	
		String user = this.getCurrentUser();
		
		for( Cart c : cdao.getCart() )
		{
			if( c.getUserid().equals(user) )
			{	
			int a=c.getId();
			cdao.delete(a);	
			}
		}
		return "{\"msg\":\"Deleted Items\"}";
	}
	@RequestMapping(value="/UpdateCartAddToDB",method=RequestMethod.POST)
	public String UpdateCartToDB(@RequestBody String data)
	{
		System.out.println("UpdateCartAddToDB");
		
		String user = this.getCurrentUser();
	    
	    System.out.println(data);
	
		try{
			JSONParser jparr = new JSONParser();
			
			JSONObject inp = (JSONObject)jparr.parse(data);
			
			System.out.println(inp);
			
			String ship = inp.get("ship").toString();
			String bill = inp.get("bill").toString();
			cdao.update(user, ship, bill);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return "{\"msg\":\"Updated\"}";
	}
	
	@RequestMapping(value="/deletefromcart",method=RequestMethod.POST)
	public String deletefromcart(@RequestBody String data)
	{
		System.out.println("deletefromcart");
	
		System.out.println(data);
		
		try{
			JSONParser jparr = new JSONParser();
			
			JSONObject inp = (JSONObject)jparr.parse(data);
			
			System.out.println(inp);
			
			int id = Integer.parseInt( inp.get("id").toString() );
			
			Cart c=cdao.getCart(id);
			int q=c.getQty();
			
			Product p=pdao.getProduct(c.getId());
			String qty1=p.getQty();
			int i=Integer.parseInt(qty1);
			i=i+q;
			String qty = String.valueOf(i);
			p.setQty(qty);
			this.pdao.update(p);
			cdao.delete(id);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return "{\"msg\":\"Deleted\"}";
	}
	
	@RequestMapping(value="/getAddress",method=RequestMethod.POST)
	public String getAddress()
	{
		System.out.println("getAddress");
		
		String currUser = "";
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null && !auth.getName().equals("anonymousUser"))
	    	currUser = auth.getName();
	    
	    JSONObject jobj = new JSONObject();
			
		for( Signup s : sdao.getAll())
		{
			
			if( s.getEmail().equals(currUser))
			{	
				String add = s.getAddress();
				
				System.out.println(add);
				jobj.put("BAdd", s.getAddress());
				jobj.put("SAdd", s.getAddress());
				
				
				return jobj.toJSONString();
			}
			
		}
		
		return jobj.toJSONString();
	}
	
}
