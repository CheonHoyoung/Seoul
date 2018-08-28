package global.sesoc.shop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.shop.vo.ChatRoom;

@Repository
public class ChatRepository {
	@Autowired
	SqlSession session;
	public int chatEnter(ChatRoom chat) {
		ChatMapper mapper = session.getMapper(ChatMapper.class);
		int result = mapper.chatEnter(chat);	
		return result;
	}
	public List<ChatRoom> chatList(String roomName) {
		ChatMapper mapper = session.getMapper(ChatMapper.class);
		List<ChatRoom> cr = mapper.chatList(roomName);	
		return cr;
	}
	public int chatOut(String userId) {
		ChatMapper mapper = session.getMapper(ChatMapper.class);
		int result = mapper.chatOut(userId);	
		return result;
	}
}

/*
@Controller  --view랑 연동
@Repository  --db랑 연동
@Service     --로직작업
@Componentt  --bean이랑 (여러가지 잡다)
<bean> 으로 등록되는것은 위의 4가지 +1 
*/