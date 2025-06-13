package com.mystudy.bbs.vo;

public class CommentVO {
	private int commentIdx;
	private String writer;
	private String content;
	private String pwd;
	private String writeDate;
	private String ip;
	private int bbsIdx;
	
	public int getCommentIdx() {
		return commentIdx;
	}
	public void setCommentIdx(int commentIdx) {
		this.commentIdx = commentIdx;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public int getBbsIdx() {
		return bbsIdx;
	}
	public void setBbsIdx(int bbsIdx) {
		this.bbsIdx = bbsIdx;
	}
	@Override
	public String toString() {
		return "CommentVO [commentIdx=" + commentIdx + ", writer=" + writer + ", content=" + content + ", pwd=" + pwd
				+ ", writeDate=" + writeDate + ", ip=" + ip + ", bbsIdx=" + bbsIdx + "]";
	}
	
}
