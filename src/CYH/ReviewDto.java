package CYH;

import java.io.Serializable;
/*
CREATE TABLE EXHIBIT_REVIEW (
		SEQ NUMBER(8) PRIMARY KEY,
		ID VARCHAR2(30) NOT NULL,
		TITLE VARCHAR2(200) NOT NULL,
		REG_DATE DATE NOT NULL,
		STAR NUMBER(8) NOT NULL,
		REVIEW VARCHAR2(4000) NOT NULL,
		LIKE_NUMBER NUMBER(8),
		DISLIKE NUMBER(8),
		DEL NUMBER(1)
	);

	CREATE SEQUENCE SEQ_REVIEW
	START WITH 1
	INCREMENT BY 1;

	ALTER TABLE EXHIBIT_REVIEW
	ADD CONSTRAINT FK_REVIEW_ID FOREIGN KEY(ID)
	REFERENCES MEMBER(ID);

	ALTER TABLE EXHIBIT_REVIEW
	ADD CONSTRAINT FK_REVIEW_TITLE FOREIGN KEY(TITLE)
	REFERENCES EXHIBIT(TITLE);
*/



public class ReviewDto implements Serializable {
	private int seq;
	
	private String id;
	private String title;
	private String regdate;
	private int star;
	private String review;

	private int like_number;
	private int dislike_number;
	
	private int del;

	public ReviewDto() {
	}

	
	public ReviewDto(int seq, String id, String title, String regdate, int star, String review, int like_number,
			int dislike_number, int del) {
		super();
		this.seq = seq;
		this.id = id;
		this.title = title;
		this.regdate = regdate;
		this.star = star;
		this.review = review;
		this.like_number = like_number;
		this.dislike_number = dislike_number;
		this.del = del;
	}


	public ReviewDto(String id, String title, String review, int star) {
		this.id = id;
		this.title = title;
		this.review = review;
		this.star = star;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	public int getLike_number() {
		return like_number;
	}

	public void setLike_number(int like_number) {
		this.like_number = like_number;
	}

	public int getDislike_number() {
		return dislike_number;
	}

	public void setDislike_number(int dislike_number) {
		this.dislike_number = dislike_number;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	@Override
	public String toString() {
		return "ReviewDto [seq=" + seq + ", id=" + id + ", title=" + title + ", review=" + review
				+ ", regdate=" + regdate + ", star=" + star + ", like_number=" + like_number
				+ ", dislike_number=" + dislike_number + ", del=" + del + "]";
	}
}
