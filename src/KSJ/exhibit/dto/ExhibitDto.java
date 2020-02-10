package KSJ.exhibit.dto;

import java.io.Serializable;
/*
 11개
 CREATE TABLE EXHIBIT (
    SEQ 		NUMBER(8) PRIMARY KEY,
    BEGINDATE 	DATE NOT NULL,
    ENDDATE 	DATE NOT NULL,
    TITLE 		VARCHAR2(200) NOT NULL,
    PLACE 		VARCHAR2(50) NOT NULL,
    CONTENT		VARCHAR2(4000) NOT NULL,
    EX_TIME 	VARCHAR2(50) NOT NULL,
    LOC_INFO 	VARCHAR2(100) NOT NULL, 
    
    DEL 		NUMBER(2) NOT NULL,
    
    CONTACT 	VARCHAR2(20),
    CERTI_NUM 	VARCHAR2(50) NOT NULL
   	PRICE		NUMBER
);
 */

public class ExhibitDto implements Serializable {
	
		private int seq;
		private String begindate;
		private String enddate;
		private String title;
		private String place;
		private String content;
		private String ex_time;
		private String loc_info;
		private int del;
		private String contact;
		private String certi_num;
		
		//가격 추가하기 	
		
		public ExhibitDto() {
			super();
			// TODO Auto-generated constructor stub
		}



		public ExhibitDto(int seq, String begindate, String enddate, String title, String place, String content,
				String ex_time, String loc_info, int del, String contact, String certi_num) {
			super();
			this.seq = seq;
			this.begindate = begindate;
			this.enddate = enddate;
			this.title = title;
			this.place = place;
			this.content = content;
			this.ex_time = ex_time;
			this.loc_info = loc_info;
			this.del = del;
			this.contact = contact;
			this.certi_num = certi_num;
		}



		public int getSeq() {
			return seq;
		}



		public void setSeq(int seq) {
			this.seq = seq;
		}



		public String getBegindate() {
			return begindate;
		}



		public void setBegindate(String begindate) {
			this.begindate = begindate;
		}



		public String getEnddate() {
			return enddate;
		}



		public void setEnddate(String enddate) {
			this.enddate = enddate;
		}



		public String getTitle() {
			return title;
		}



		public void setTitle(String title) {
			this.title = title;
		}



		public String getPlace() {
			return place;
		}



		public void setPlace(String place) {
			this.place = place;
		}



		public String getContent() {
			return content;
		}



		public void setContent(String content) {
			this.content = content;
		}



		public String getEx_time() {
			return ex_time;
		}



		public void setEx_time(String ex_time) {
			this.ex_time = ex_time;
		}



		public String getLoc_info() {
			return loc_info;
		}



		public void setLoc_info(String loc_info) {
			this.loc_info = loc_info;
		}



		public int getDel() {
			return del;
		}



		public void setDel(int del) {
			this.del = del;
		}



		public String getContact() {
			return contact;
		}



		public void setContact(String contact) {
			this.contact = contact;
		}



		public String getCerti_num() {
			return certi_num;
		}



		public void setCerti_num(String certi_num) {
			this.certi_num = certi_num;
		}



		@Override
		public String toString() {
			return "ExhibitDto [seq=" + seq + ", begindate=" + begindate + ", enddate=" + enddate + ", title=" + title
					+ ", place=" + place + ", content=" + content + ", ex_time=" + ex_time + ", loc_info=" + loc_info
					+ ", del=" + del + ", contact=" + contact + ", certi_num=" + certi_num + "]";
		}
		
		
		
		
	
	
}
