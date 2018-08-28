package global.sesoc.shop.vo;

public class BestSellers {
	private int bookcode;
	private String title;
	private int purchasecnt;
	public BestSellers() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BestSellers(int bookcode, String title, int purchasecnt) {
		super();
		this.bookcode = bookcode;
		this.title = title;
		this.purchasecnt = purchasecnt;
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
	public int getPurchasecnt() {
		return purchasecnt;
	}
	public void setPurchasecnt(int purchasecnt) {
		this.purchasecnt = purchasecnt;
	}
	@Override
	public String toString() {
		return "BestSellers [bookcode=" + bookcode + ", title=" + title + ", purchasecnt=" + purchasecnt + "]";
	}
	
	
}
