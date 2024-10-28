package space.dto;

import java.sql.Date;

public class Member {
	private int idx;	
	private String login_id;
	private String login_pw;
	private String name;
	private Date join_date;
	private String post_code;
	private String addr;
	private String addr_detail;
	private String email;
	private String note;
	private String phone;
	
	public Member() {}
		
	
	public Member(int idx) {
		this.idx = idx;		
	}
	
	public Member(int idx, String name) {
		this.idx = idx;
		this.name = name;
	}
	
	
	//개인정보 변경 용 생성자
	public Member(String name, String post_code, String addr, String addr_detail, String email, String note,
			String phone) {		
		this.name = name;
		this.post_code = post_code;
		this.addr = addr;
		this.addr_detail = addr_detail;
		this.email = email;
		this.note = note;
		this.phone = phone;
	}


	public Member(int idx, String login_id, String login_pw, String name, Date join_date, String post_code,
			String addr, String addr_detail, String email, String note) {
		this.idx = idx;		
		this.login_id = login_id;
		this.login_pw = login_pw;
		this.name = name;
		this.join_date = join_date;
		this.post_code = post_code;
		this.addr = addr;
		this.addr_detail = addr_detail;
		this.email = email;
		this.note = note;
	}
	
		
	public Member(int idx, String login_id, String login_pw, String name, Date join_date, String post_code, String addr,
			String addr_detail, String email, String note, String phone) {
		this.idx = idx;
		this.login_id = login_id;
		this.login_pw = login_pw;
		this.name = name;
		this.join_date = join_date;
		this.post_code = post_code;
		this.addr = addr;
		this.addr_detail = addr_detail;
		this.email = email;
		this.note = note;
		this.phone = phone;
	}


	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}	
	public String getLogin_id() {
		return login_id;
	}
	public void setLogin_id(String login_id) {
		this.login_id = login_id;
	}
	public String getLogin_pw() {
		return login_pw;
	}
	public void setLogin_pw(String login_pw) {
		this.login_pw = login_pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	public String getPost_code() {
		return post_code;
	}
	public void setPost_code(String post_code) {
		this.post_code = post_code;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAddr_detail() {
		return addr_detail;
	}
	public void setAddr_detail(String addr_detail) {
		this.addr_detail = addr_detail;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}	
	
	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	@Override
	public String toString() {
		return "Member [idx=" + idx + ", login_id=" + login_id + ", login_pw=" + login_pw
				+ ", name=" + name + ", join_date=" + join_date + ", post_code=" + post_code + ", addr=" + addr
				+ ", addr_detail=" + addr_detail + ", email=" + email + ", note=" + note + ", phone = " + phone + "]";
	}
	
	
}
