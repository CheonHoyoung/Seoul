package global.sesoc.shop.vo;

public class Member {
	private String userid;
	private String userpwd;
	private String username;
	private String email;
	private String phone;
	
	public Member() {
		
	}

	public Member(String userid, String userpwd, String username, String email, String phone) {
		super();
		this.userid = userid;
		this.userpwd = userpwd;
		this.username = username;
		this.email = email;
		this.phone = phone;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserpwd() {
		return userpwd;
	}

	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "Member [userid=" + userid + ", userpwd=" + userpwd + ", username=" + username + ", email=" + email
				+ ", phone=" + phone + "]";
	}

	

}
