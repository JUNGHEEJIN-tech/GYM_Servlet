package space.dto;

import java.sql.Timestamp;

public class Qna_board {
	private int idx;
	private String title;
	private String content;
	private Timestamp regist_date;
	private int views;	
	private String writer;

/////////////////////////////constructor
	public Qna_board() {
	
	}

	
	//글 작성 할 때의 생성자.
	public Qna_board(String title, String content, Timestamp regist_date, String writer) {		
		this.title = title;
		this.content = content;
		this.regist_date = regist_date;
		this.writer = writer;
	}

	//찾기 할때 생성자.
	public Qna_board(int idx, String title, String content, Timestamp regist_date, int views, String writer) {		
		this.idx = idx;
		this.title = title;
		this.content = content;
		this.regist_date = regist_date;
		this.views = views;
		this.writer = writer;
	}
	
	//properties
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
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}


	@Override
	public String toString() {
		return "Qna_board [idx=" + idx + ", title=" + title + ", content=" + content + ", regist_date=" + regist_date
				+ ", views=" + views + ", writer=" + writer + "]";
	}
}
