package BJH.notice.dto;

import java.io.Serializable;


/*
 
    SEQ NUMBER(8) PRIMARY KEY,
	ID VARCHAR2(30) NOT NULL,
	TITLE VARCHAR2(200) NOT NULL,
	CONTENT VARCHAR2(4000) NOT NULL,
	REG_DATE DATE NOT NULL,
	READCOUNT NUMBER(8)	NOT NULL,
	DEL NUMBER(8) NOT NULL,
	CHOICE NUMBER(8) NOT NULL
	
	
 */
public class NoticeDto implements Serializable {

		private int seq;

		private String id;
		private String title;
		private String content;
		private String reg_date;
		private int readCount;
		private int del;
		private int choice;
		private String filename;
		
		public NoticeDto() {
			// TODO Auto-generated constructor stub
		}

		
		
		

		public NoticeDto(int seq, String id, String title, String content, String reg_date, int readCount,
				int del, int choice, String filename) {
			super();
			this.seq = seq;
			this.id = id;
			this.title = title;
			this.content = content;
			this.reg_date = reg_date;
			this.readCount = readCount;
			this.del = del;
			this.choice = choice;
			this.filename = filename;
		}



		public NoticeDto(String id, String title, String content, int choice, String filename) {
			super();
			this.id = id;
			this.title = title;
			this.content = content;
			this.choice = choice;
			this.filename = filename;
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

		public String getContent() {
			return content;
		}

		public void setContent(String content) {
			this.content = content;
		}

		public String getReg_date() {
			return reg_date;
		}

		public void setReg_date(String reg_date) {
			this.reg_date = reg_date;
		}

		public int getReadCount() {
			return readCount;
		}

		public void setReadCount(int readCount) {
			this.readCount = readCount;
		}

		public int getDel() {
			return del;
		}

		public void setDel(int del) {
			this.del = del;
		}

		public int getChoice() {
			return choice;
		}

		public void setChoice(int choice) {
			this.choice = choice;
		}
		

		public String getFilename() {
			return filename;
		}


		public void setFilename(String filename) {
			this.filename = filename;
		}





		@Override
		public String toString() {
			return "NoticeDto [seq=" + seq + ", id=" + id + ", title=" + title + ", content=" + content + ", reg_date="
					+ reg_date + ", readCount=" + readCount + ", del=" + del + ", choice=" + choice + ", filename="
					+ filename + "]";
		}


		

}	