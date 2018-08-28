package global.sesoc.shop.vo;

public class Sale {
	private String userid;
	private int bookcode;
	private int purchasecnt;
	private String purchasedate;
	
	public Sale() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Sale(String userid, int bookcode, int purchasecnt, String purchasedate) {
		super();
		this.userid = userid;
		this.bookcode = bookcode;
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
		return "Sale [userid=" + userid + ", bookcode=" + bookcode + ", purchasecnt=" + purchasecnt + ", purchasedate="
				+ purchasedate + "]";
	}
	
	
}
