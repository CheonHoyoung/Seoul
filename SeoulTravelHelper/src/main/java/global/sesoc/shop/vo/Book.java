package global.sesoc.shop.vo;

public class Book {
	private int bookcode;
	private String title;
	private int price;
	private int quantity;
	
	public Book() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Book(int bookcode, String title, int price, int quantity) {
		super();
		this.bookcode = bookcode;
		this.title = title;
		this.price = price;
		this.quantity = quantity;
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


	@Override
	public String toString() {
		return "Book [bookcode=" + bookcode + ", title=" + title + ", price=" + price + ", quantity=" + quantity + "]";
	}
	
	
	
}
