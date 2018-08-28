package global.sesoc.shop.dao;

import java.util.List;

import global.sesoc.shop.vo.ChatRoom;

/**
 * 회원관련 Interface
 */
public interface ChatMapper {
	public int chatEnter(ChatRoom chat);

	public List<ChatRoom> chatList(String roomName);

	public int chatOut(String userId);
}
