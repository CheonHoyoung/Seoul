package global.sesoc.shop.controllers;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.cxf.helpers.IOUtils;
import org.json.simple.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.shop.dao.ProductRepository;
import global.sesoc.shop.vo.Car;

@Controller
public class MapController {
	@Autowired
	ProductRepository repository;

	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public String map() {
		return "map/NewFile3";
	}
	
	@RequestMapping(value = "/reserve", method = RequestMethod.GET)
	public String reserve(HttpServletRequest request, HttpSession session, HttpServletResponse response, String parStoreCd, Model model) throws IOException{
		
		
          request.setCharacterEncoding("utf-8");
	      response.setContentType("text/html; charset=utf-8");
	      //http://www.seoulnanumcar.com/reserve/nanumSpotSearch?search_gu=%EA%B0%95%EB%82%A8%EA%B5%AC
	      String address1 = "http://www.seoulnanumcar.com/reserve/nanumSpotInfo?parStoreCd="+parStoreCd;
	      
	      Document doc = Jsoup.connect(address1).get();
	      //System.out.println(doc.toString());
	      
	      Elements rowElements = doc.select("table tbody tr");
	      Elements rowElements2 = doc.select("table tbody tr");
	      ArrayList<String> car = new ArrayList<>();
	      ArrayList<String> reserve = new ArrayList<>();
	      ArrayList<Car> carReserve = new ArrayList<>();
	      for(Element row: rowElements) {
	    	    String division = String.valueOf(row.select("td strong"));
	    	    String result = division.substring(division.indexOf(">")+1, division.lastIndexOf("<"));
	    	    car.add(result);
	    	   System.out.println(result);
	      }
	      
	      for(Element row: rowElements2) {
	    	   String division2 = String.valueOf(row.select("td.cnt"));
	    	   String result = division2.substring(division2.indexOf(":")+2, division2.lastIndexOf("대"));
	    	   reserve.add(result);
	    	   System.out.println(result);
	      }
	      
	      for(int i= 0; i<car.size(); i++) {
	    	 Car carlist = new Car();
	    	 carlist.setCar(car.get(i));
	    	 carlist.setReserve(reserve.get(i));
	    	 carReserve.add(carlist);
	      }
	      for(Car car1 : carReserve) {
	    	  System.out.println(car1);
	      }
	      
	      model.addAttribute("car", carReserve);
	     
//	      JSONObject json = new JSONObject();
//	      json.put("data", s);
		return "map/Reserve";
	}

	@ResponseBody
	@RequestMapping(value = "/sss", method = RequestMethod.POST)
	public void sss(HttpServletRequest request, HttpSession session, HttpServletResponse response, @RequestBody Map<String, String> map) throws IOException {
	      request.setCharacterEncoding("utf-8");
	      response.setContentType("text/html; charset=utf-8");
	      String a = map.get("keyword1");
	      String bb = map.get("keyword2");
	      System.out.println(a);
	      System.out.println(bb);
	      //http://www.seoulnanumcar.com/reserve/nanumSpotSearch?search_gu=%EA%B0%95%EB%82%A8%EA%B5%AC
	      String address1 = "http://www.seoulnanumcar.com/reserve/nanumSpotSearch?search_gu=";
	      String serviceKey = bb;
	      //&search_sponam=%EA%B7%B8%EB%A6%B0%EC%B9%B4
	      String address2 = "&search_sponam=";
	      String serviceKey2 = a;
	      serviceKey = URLEncoder.encode(serviceKey,"utf-8");
	      serviceKey2 = URLEncoder.encode(serviceKey2,"utf-8");
	      PrintWriter out = response.getWriter();
	      
	      
	      address1 = address1 + serviceKey + address2 + serviceKey2;
	      URL url = new URL(address1);
	      System.out.println(url);
//	      BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));

	      InputStream in = url.openStream(); 
//	      CachedOutputStream bos = new CachedOutputStream();
	      ByteArrayOutputStream  bos1 = new ByteArrayOutputStream();
	      IOUtils.copy(in, bos1);
	      in.close();
	      bos1.close();
	       
	      String mbos = bos1.toString("UTF-8");
//	      System.out.println("mbos: "+mbos);
	       
	      byte[] b = mbos.getBytes("UTF-8");
	      String s = new String(b, "UTF-8");
	      out.println(s);
	      
	      JSONObject json = new JSONObject();
	      json.put("data", s);
//	      json.put("data", data);
//	      System.out.println("json: "+json);
	}
	
	@ResponseBody
	@RequestMapping(value = "/sss2", method = RequestMethod.GET)
	public void sss2(HttpServletRequest request, HttpSession session, HttpServletResponse response) throws IOException {

	      request.setCharacterEncoding("utf-8");
	      response.setContentType("text/html; charset=utf-8");
	      //http://www.seoulnanumcar.com/reserve/nanumSpotSearch?search_gu=%EA%B0%95%EB%82%A8%EA%B5%AC
	      String address1 = "http://openapi.seoul.go.kr:8088/6a74695943726564313133516e676663/json/ListPublicReservationCulture/1/101/";
	      String serviceKey = "";
	      //&search_sponam=%EA%B7%B8%EB%A6%B0%EC%B9%B4
	      String address2 = "";
//	      serviceKey = URLEncoder.encode(serviceKey,"utf-8");
	      PrintWriter out = response.getWriter();
	      
	      
	      address1 = address1 + serviceKey + address2;
	      URL url = new URL(address1);

//	      System.out.println(address1);
	      
//	      BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));

	      InputStream in = url.openStream(); 
//	      CachedOutputStream bos = new CachedOutputStream();
	      ByteArrayOutputStream  bos1 = new ByteArrayOutputStream();
	      IOUtils.copy(in, bos1);
	      in.close();
	      bos1.close();
	       
	      String mbos = bos1.toString("UTF-8");
//	      System.out.println("mbos: "+mbos);
	       
	      byte[] b = mbos.getBytes("UTF-8");
	      String s = new String(b, "UTF-8");
	      out.println(s);
	      
	      JSONObject json = new JSONObject();
	      
	      json.put("data", s);
//	      json.put("data", data);
//	      System.out.println("json: "+json);
	}

}

