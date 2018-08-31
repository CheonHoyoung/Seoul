package global.sesoc.shop.controllers;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.shop.dao.MemberRepository;
import global.sesoc.shop.vo.Member;
import global.sesoc.shop.controllers.MemberController;


@Controller
public class MemberController {
	   private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	   @Autowired
	   MemberRepository repository;
	   
	   @RequestMapping(value="/Login", method=RequestMethod.GET)
	   public String Login() {
	      return "Login";
	   }
	   
	   @RequestMapping(value="/Join", method=RequestMethod.GET)
	   public String Join() {
	      return "Join";
	   }
	   
	   @RequestMapping(value="/MyPage", method=RequestMethod.GET)
	   public String MyPage() {
	      return "MyPage";
	   }
	   
	   @RequestMapping(value="/join", method=RequestMethod.POST)
	   public String join(Member member) {
		  logger.info("member : {}", member.toString());
	      int result = repository.join(member);
	      if(result==0) {
	    	  return "Join";
	      }
	      return "redirect:/";
	   }
	   
	   @RequestMapping(value="/login", method=RequestMethod.POST)
	   public String login(Member member, HttpSession session, Model model) {
		   logger.info(member.toString());
		   
		   //DB에서 확인 
		   Member m = repository.loginMember(member);
		   
		   if(m!=null) {
			   session.setAttribute("loginId", m.getUserid());
			   session.setAttribute("loginName", m.getUsername());
			   return "redirect:/";
		   } else {
			   model.addAttribute("message", "해당 아이디나 비밀번호가 존재하지 않습니다.");
			   return "Login";
		   }
	   }
	   
	   @RequestMapping(value="/logout", method=RequestMethod.GET)
	   public String logout(HttpSession session) {
		   session.invalidate(); // 한반에 다 지울때
	 	   
		   //session.removeAttribute("loginId");  여러개 중에 골라서 지울때 
		   return "redirect:/";
	   }
}