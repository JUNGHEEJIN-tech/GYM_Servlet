package space.dto;

import java.sql.Timestamp;

public class Free_Board {
	private int idx;
	private String title;
	private String content;
	private Timestamp regist_date;
	private int views;
	private int member_idx;
	
	public Free_Board() {}	
	
	public Free_Board(int idx, String title, String content, Timestamp regist_date, int views, int member_idx) {
		super();
		this.idx = idx;
		this.title = title;
		this.content = content;
		this.regist_date = regist_date;
		this.views = views;
		this.member_idx = member_idx;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getRegist_date() {
		return regist_date;
	}
	public void setRegist_date(Timestamp regist_date) {
		this.regist_date = regist_date;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}

	@Override
	public String toString() {
		return "Free_Board [idx=" + idx + ", title=" + title + ", content=" + content + ", regist_date=" + regist_date
				+ ", views=" + views + ", member_idx=" + member_idx + "]";
	}
	
}
