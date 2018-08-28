package global.sesoc.shop.vo;

public class Order {
	private String userid;
	private int bookcode;
	private String title;
	private int price;
	private int quantity;
	private int purchasecnt;
	private String purchasedate;
	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Order(String userid, int bookcode, String title, int price, int quantity, int purchasecnt,
			String purchasedate) {
		super();
		this.userid = userid;
		this.bookcode = bookcode;
		this.title = title;
		this.price = price;
		this.quantity = quantity;
		this.purchasecnt = purchasecnt;
		this.purchasedate = purchasedate;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getPurchasecnt() {
		return purchasecnt;
	}
	public void setPurchasecnt(int purchasecnt) {
		this.purchasecnt = purchasecnt;
	}
	public String getPurchasedate() {
		return purchasedate;
	}
	public void setPurchasedate(String purchasedate) {
		this.purchasedate = purchasedate;
	}
	@Override
	public String toString() {
		return "Order [userid=" + userid + ", bookcode=" + bookcode + ", title=" + title + ", price=" + price
				+ ", quantity=" + quantity + ", purchasecnt=" + purchasecnt + ", purchasedate=" + purchasedate + "]";
	}
	
	
	


	
	
}
