package global.sesoc.shop.vo;

public class Member {
	private String userid;
	private String password;
	private String username;
	private String address;
	private String phone;
	
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Member(String userid, String password, String username, String address, String phone) {
		super();
		this.userid = userid;
		this.password = password;
		this.username = username;
		this.address = address;
		this.phone = phone;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Override
	public String toString() {
		return "Member [userid=" + userid + ", password=" + password + ", username=" + username + ", address=" + address
				+ ", phone=" + phone + "]";
	}
	
	
}
