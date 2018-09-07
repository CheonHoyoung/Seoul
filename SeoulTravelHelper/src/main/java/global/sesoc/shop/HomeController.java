package global.sesoc.shop;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private JavaMailSender mailSender;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "Home";
	}
	
	@RequestMapping(value = "/Home", method = RequestMethod.GET)
	public String index() {
		
		return "Home";
	}
	
	@RequestMapping(value="/contactAction", method=RequestMethod.POST)
	public String contactAction(String contactName, String contactMail, String contactMessage, Model model,HttpServletResponse response)
	{

		System.out.println("mailuserid : " + contactName);
		
		String content=contactMessage;
		String name = contactName;
		
		String setfrom = contactMail;
		String tomail = "ddaaahhiiiii@gmail.com";
		String title = name+"님의 문의입니다.";
		String contactContent = name+"님의 문의내용 : "+content;

		System.out.println("mailtitle : "  + title);
		
		try 
		{
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			messageHelper.setFrom(setfrom);
			messageHelper.setTo(tomail);
			messageHelper.setSubject(title);
			messageHelper.setText(contactContent);
			
			mailSender.send(message);
			
			response.setContentType("text/html; charset=UTF-8");
	         PrintWriter out = response.getWriter();
	         out.println("<script>alert('문의가 성공적으로 전송되었습니다.'); location.href='Home'; </script>");
	         out.flush(); 
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		return "Home";
	}
	
}
