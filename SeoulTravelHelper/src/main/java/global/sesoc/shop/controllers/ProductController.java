package global.sesoc.shop.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.shop.dao.ProductRepository;
import global.sesoc.shop.vo.BestSellers;
import global.sesoc.shop.vo.Book;
import global.sesoc.shop.vo.Order;
import global.sesoc.shop.vo.Sale;
import global.sesoc.shop.vo.Wish;

@Controller
public class ProductController {
	@Autowired
	ProductRepository repository;
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public  String listboard(Model model) {
		
		List<Book> list = repository.select();
		
		model.addAttribute("blist", list);
		
		return "product/productList";
	}
	
	
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public String detail(int bookcode, Model model) {
		Book b = repository.selectOne(bookcode);
			
		model.addAttribute("bcontent", b);
		
		return "product/productDetail"; 
	}
	
	
	@RequestMapping(value="/orderList", method=RequestMethod.GET)
	public String orderList(HttpSession session, Model model) {
		List<Order> o = repository.selectOrder((String)session.getAttribute("loginId"));
		model.addAttribute("olist", o);
		return "product/productPurchase"; 
	}
	
	@RequestMapping(value="/orderList", method=RequestMethod.POST)
	public String orderList(int bookcode, int ea,Sale sale, HttpSession session, Model model) {
		sale.setUserid((String)session.getAttribute("loginId"));
		sale.setBookcode(bookcode);
		sale.setPurchasecnt(ea);
		int result= repository.insert(sale);
		Book b = repository.selectOne(bookcode);
		int totalea = b.getQuantity()-ea;
		b.setQuantity(totalea);
		repository.update(b);
		List<Order> o = repository.selectOrder((String)session.getAttribute("loginId"));
		model.addAttribute("olist", o);
		return "redirect:/orderList"; 
	}
	
	
	@RequestMapping(value="/wishList", method=RequestMethod.POST)
	public String orderList(Wish wish, int bookcode, HttpSession session, Model model) {
		wish.setUserid((String)session.getAttribute("loginId"));
		wish.setBookcode(bookcode);
		int result= repository.insertWish(wish);
		List<Wish> w = repository.wishList((String)session.getAttribute("loginId"));
		model.addAttribute("wlist", w);
		return "redirect:/wishList"; 
	}
	
	
	@RequestMapping(value="/wishList", method=RequestMethod.GET)
	public String orderList(Wish wish,  HttpSession session, Model model) {
		List<Wish> w = repository.wishList((String)session.getAttribute("loginId"));
		model.addAttribute("wlist", w);
		return "product/wishList"; 
	}
	
	
	@RequestMapping(value="/deleteWish", method=RequestMethod.GET)
	public String deleteWish(Wish wish, int bookcode, HttpSession session, Model model) {
		wish.setUserid((String)session.getAttribute("loginId"));
		wish.setBookcode(bookcode);
		int result = repository.deleteWish(wish);
		return "redirect:/wishList"; 
	}
	
	
	@RequestMapping(value="/best", method=RequestMethod.GET)
	public String best(HttpSession session, Model model) {
		List<BestSellers> b = repository.getBestSeller();
		model.addAttribute("blist", b);
		System.out.println(b);
		return "product/bestSeller"; 
	}

	
	
}
