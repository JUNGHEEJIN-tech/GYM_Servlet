package space.dto;

import java.sql.Timestamp;

public class Notice_Board {
    private int boardIdx;
    private String title;
    private int memberIdx;
    private String content;
    private Timestamp registDate;
    private int views;

    public Notice_Board() {}

    public Notice_Board(int boardIdx, String title, int memberIdx, String content, Timestamp registDate, int views) {
        this.boardIdx = boardIdx;
        this.title = title;
        this.memberIdx = memberIdx;
        this.content = content;
        this.registDate = registDate;
        this.views = views;
    }

    public int getBoardIdx() {
        return boardIdx;
    }

    public void setBoardIdx(int boardIdx) {
        this.boardIdx = boardIdx;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getMemberIdx() {
        return memberIdx;
    }

    public void setMemberIdx(int memberIdx) {
        this.memberIdx = memberIdx;
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

    public int getViews() {
        return views;
    }

    public void setViews(int views) {
        this.views = views;
    }
}
