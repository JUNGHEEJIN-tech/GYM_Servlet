package space.dto;

import java.sql.Timestamp;

public class Free_BoardComment {
	private int commentIdx;
	private String content;
	private Timestamp registDate;
	private int memberIdx;
	private int idx; //원글의 idx
	private String name;
	
	public int getCommentIdx() {
		return commentIdx;
	}
	public void setCommentIdx(int comentIdx) {
		this.commentIdx = comentIdx;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getRegistDate() {
		return registDate;
	}
	public void setRegistDate(Timestamp registDate) {
		this.registDate = registDate;
	}
	public int getMemberIdx() {
		return memberIdx;
	}
	public void setMemberIdx(int memberIdx) {
		this.memberIdx = memberIdx;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public Free_BoardComment() {}
	
	public Free_BoardComment(int commentIdx, String content, Timestamp registDate, int memberIdx, int idx) {		
		this.commentIdx = commentIdx;
		this.content = content;
		this.registDate = registDate;
		this.memberIdx = memberIdx;
		this.idx = idx;
	}
	
	public Free_BoardComment(int commentIdx, String content, Timestamp registDate, int memberIdx, int idx, String name) {
		this.commentIdx = commentIdx;
		this.content = content;
		this.registDate = registDate;
		this.memberIdx = memberIdx;
		this.idx = idx;
		this.name = name;
	}
	
	public Free_BoardComment(int memberIdx, int idx, String content) {		
		this.memberIdx = memberIdx;
		this.idx = idx;
		this.content = content;
	}
	
	@Override
	public String toString() {
		return "Free_BoardComment [commentIdx=" + commentIdx + ", content=" + content + ", registDate=" + registDate
				+ ", memberIdx=" + memberIdx + ", idx=" + idx + "]";
	}	
}
