package space.dto;

import java.sql.Timestamp;

public class Attraction {
	private int attr_idx;
	private String title;
	private String content;
	private int trainer_idx;
	private String prog_time;
	
	public Attraction() {}
	
	public Attraction(int attr_idx, String title, String content, int trainer_idx, String prog_time) {
		super();
		this.attr_idx = attr_idx;
		this.title = title;
		this.content = content;
		this.trainer_idx = trainer_idx;
		this.prog_time = prog_time;
	}
	public int getAttr_idx() {
		return attr_idx;
	}
	public void setAttr_idx(int attr_idx) {
		this.attr_idx = attr_idx;
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
	public int getTrainer_idx() {
		return trainer_idx;
	}
	public void setTrainer_idx(int trainer_idx) {
		this.trainer_idx = trainer_idx;
	}
	public String getProg_time() {
		return prog_time;
	}
	public void setProg_time(String prog_time) {
		this.prog_time = prog_time;
	}

	@Override
	public String toString() {
		return "Attraction [attr_idx=" + attr_idx + ", title=" + title + ", content=" + content + ", trainer_idx="
				+ trainer_idx + ", prog_time=" + prog_time + "]";
	}
	
	
}
