package space.dto;

import java.sql.Date;

public class Recruit_Board {
	
	private int id;
	private String title;
	private String content;
	private String writer;
	private Date registDate;
	private int views;
	
	public Recruit_Board() {}
	
	public Recruit_Board(int id, String title, String content, String writer) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.writer = writer;
	}

	public Recruit_Board(int id, String title, String content, String writer, Date registDate, int views) {
		this.id = id;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.registDate = registDate;
		this.views = views;
	}
	
	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
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



	public String getWriter() {
		return writer;
	}



	public void setWriter(String writer) {
		this.writer = writer;
	}



	public Date getRegistDate() {
		return registDate;
	}



	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}



	public int getViews() {
		return views;
	}



	public void setViews(int views) {
		this.views = views;
	}



	@Override
	public String toString() {
		return "Recruit_Board [id=" + id + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", regist_Date=" + registDate + ", views=" + views + "]";
	}		
}