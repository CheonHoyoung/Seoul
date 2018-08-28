package global.sesoc.shop.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import global.sesoc.shop.vo.BestSellers;
import global.sesoc.shop.vo.Book;
import global.sesoc.shop.vo.Order;
import global.sesoc.shop.vo.Sale;
import global.sesoc.shop.vo.Wish;


public interface ProductMapper {
	public List<Book> select();
	public Book selectOne(int boardnum);
	public int update(Book book);
	public int delete(int boardnum);
	public int insert(Sale sale);
	public List<Order> selectOrder(String userid);
	public int insertWish(Wish wish);
	public List<Wish> wishList(String userid);
	public int deleteWish(Wish wish);
	public List<BestSellers> getBestSeller();
}
