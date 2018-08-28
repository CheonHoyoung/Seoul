package global.sesoc.shop.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.shop.vo.BestSellers;
import global.sesoc.shop.vo.Book;
import global.sesoc.shop.vo.Order;
import global.sesoc.shop.vo.Sale;
import global.sesoc.shop.vo.Wish;

@Repository
public class ProductRepository {
	@Autowired
	SqlSession session;
	
	/**
	 * 전체 글 조회
	 * @return list 조회된 전체 글
	 */
	public List<Book> select() {
		
		ProductMapper mapper = session.getMapper(ProductMapper.class);
		
		List<Book> list = mapper.select();
		
		return list;
	}
	
	public Book selectOne(int boardnum) {
		ProductMapper mapper = session.getMapper(ProductMapper.class);
		Book b = mapper.selectOne(boardnum);
		return b;
	}
	
	public int delete(int boardnum) {
		ProductMapper mapper = session.getMapper(ProductMapper.class);
		int result = mapper.delete(boardnum);
		return result;
	}
	
	public int update(Book book) {
		ProductMapper mapper = session.getMapper(ProductMapper.class);
		int result = mapper.update(book);
		return result;
	}
	
	public int insert(Sale sale) {
		ProductMapper mapper = session.getMapper(ProductMapper.class);
		int result = mapper.insert(sale);
		return result;
	}
	
	public List<Order> selectOrder(String userid) {
		ProductMapper mapper = session.getMapper(ProductMapper.class);
		List<Order> o = mapper.selectOrder(userid);
		return o;
	}

	public int insertWish(Wish wish) {
		ProductMapper mapper = session.getMapper(ProductMapper.class);
		int result = mapper.insertWish(wish);
		return result;
	}
	
	public List<Wish> wishList(String userid) {
		ProductMapper mapper = session.getMapper(ProductMapper.class);
		List<Wish> w = mapper.wishList(userid);
		return w;
	}
	
	public int deleteWish(Wish wish) {
		ProductMapper mapper = session.getMapper(ProductMapper.class);
		int result = mapper.deleteWish(wish);
		return result;
	}
	
	public List<BestSellers> getBestSeller(){
		ProductMapper mapper = session.getMapper(ProductMapper.class);
		List<BestSellers> list = mapper.getBestSeller();
		return list;
	}
}

/*
@Controller  --view랑 연동
@Repository  --db랑 연동
@Service     --로직작업
@Componentt  --bean이랑 (여러가지 잡다)
<bean> 으로 등록되는것은 위의 4가지 +1 
*/