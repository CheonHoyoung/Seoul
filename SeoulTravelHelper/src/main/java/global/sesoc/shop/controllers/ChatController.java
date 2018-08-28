package global.sesoc.shop.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.shop.dao.ChatRepository;
import global.sesoc.shop.vo.ChatRoom;

@Controller
public class ChatController {
	@Autowired
	ChatRepository repository;
	
	
	@RequestMapping(value = "/chat", method = RequestMethod.GET)
	public String join() {
		return "chat/chat";
	}
	
	@RequestMapping(value="/chatList", method=RequestMethod.POST)
	public @ResponseBody List<ChatRoom> schoolData(String roomName) {
		System.out.println("roomName"+roomName);
		List<ChatRoom> cr = repository.chatList(roomName);
		System.out.println(cr.toString());
		return cr;
	}
	
	@RequestMapping(value = "/chatOne", method = RequestMethod.GET)
	public String echo(String roomnum, Model model, String userId, int roomNum) {
		System.out.println(userId);
		System.out.println(roomNum);
		model.addAttribute("userId", userId);
		model.addAttribute("roomNum", roomNum);
		return "chatOne";
	}
	
	
}
