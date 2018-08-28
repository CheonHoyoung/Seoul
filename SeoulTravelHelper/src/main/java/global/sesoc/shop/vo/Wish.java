package global.sesoc.shop.vo;

public class Wish {
	private String userid;
	private int bookcode;
	
	
	
	public Wish() {
		super();
		// TODO Auto-generated constructor stub
	}



	public Wish(String userid, int bookcode) {
		super();
		this.userid = userid;
		this.bookcode = bookcode;
	}



	public String getUserid() {
		return userid;
	}



	public void setUserid(String userid) {
		this.userid = userid;
	}



	public int getBookcode() {
		return bookcode;
	}



	public void setBookcode(int bookcode) {
		this.bookcode = bookcode;
	}



	@Override
	public String toString() {
		return "Wish [userid=" + userid + ", bookcode=" + bookcode + "]";
	}
	
	
}
