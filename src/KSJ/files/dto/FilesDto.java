package KSJ.files.dto;

import java.io.Serializable;
/*
 CREATE TABLE FILES (
    SEQ NUMBER(8)  NOT NULL,
    FILENAME VARCHAR2(500)  PRIMARY KEY,
    ORIGIN_NAME VARCHAR2(500) NOT NULL,    
    FILEPATH VARCHAR2(500),
    BBS_NAME VARCHAR2(20),
    BBS_SEQ NUMBER(8),
    DEL NUMBER(2) NOT NULL
);
 */
public class FilesDto implements Serializable {

	private int seq;
	private String filename;
	private String originName;
	private String filepath;
	private String bbsName;
	private int bbsSeq;
	private int del;
	private int file_seq;
	
	
	public FilesDto() {

	
	}
	
	public FilesDto(int seq, String filename, String originName, String filepath, String bbsName, int bbsSeq, int del,
			int file_seq) {
		super();
		this.seq = seq;
		this.filename = filename;
		this.originName = originName;
		this.filepath = filepath;
		this.bbsName = bbsName;
		this.bbsSeq = bbsSeq;
		this.del = del;
		this.file_seq = file_seq;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	public String getBbsName() {
		return bbsName;
	}

	public void setBbsName(String bbsName) {
		this.bbsName = bbsName;
	}

	public int getBbsSeq() {
		return bbsSeq;
	}

	public void setBbsSeq(int bbsSeq) {
		this.bbsSeq = bbsSeq;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	public int getFile_seq() {
		return file_seq;
	}

	public void setFile_seq(int file_seq) {
		this.file_seq = file_seq;
	}

	
	
	@Override
	public String toString() {
		return "FilesDto [seq=" + seq + ", filename=" + filename + ", originName=" + originName + ", filepath="
				+ filepath + ", bbsName=" + bbsName + ", bbsSeq=" + bbsSeq + ", del=" + del + ", file_seq=" + file_seq
				+ "]";
	}
	
	
	
	
	
	
}
