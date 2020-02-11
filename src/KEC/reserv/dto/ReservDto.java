package KEC.reserv.dto;

import java.io.Serializable;

/*

CREATE TABLE RESERVATION(
	SEQ NUMBER(8) PRIMARY KEY,
	ID VARCHAR2(20) NOT NULL,
	NAME VARCHAR2(20) NOT NULL,
	BIRTHDATE VARCHAR2(20) NOT NULL,
	PHONE VARCHAR2(20) NOT NULL,
	EMAIL VARCHAR2(30) NOT NULL,
	ADDRESS VARCHAR2(100) NOT NULL,
	RECEIVE VARCHAR2(30) NOT NULL,
	QTY NUMBER(8) NOT NULL,
	TOTAL_PRICE NUMBER(20) NOT NULL,
	PAY_METHOD VARCHAR2(30) NOT NULL,
	DEL NUMBER(2)
);

*/
public class ReservDto implements Serializable {
	
	int seq;
	String id;
	String name;
	String birthdate;
	String phone;
	String email;
	String address;
	String receive;
	int qty;
	int totalPrice;
	String payMethod;
	int del;	
	
	public ReservDto() {
	}
	
	

	public ReservDto(String id, String name, String birthdate, String phone, String email, String address,
			String receive, int qty, int totalPrice, String payMethod) {
		super();
		this.id = id;
		this.name = name;
		this.birthdate = birthdate;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.receive = receive;
		this.qty = qty;
		this.totalPrice = totalPrice;
		this.payMethod = payMethod;
	}



	public ReservDto(int seq, String id, String name, String birthdate, String phone, String email, String address,
			String receive, int qty, int totalPrice, String payMethod, int del) {
		super();
		this.seq = seq;
		this.id = id;
		this.name = name;
		this.birthdate = birthdate;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.receive = receive;
		this.qty = qty;
		this.totalPrice = totalPrice;
		this.payMethod = payMethod;
		this.del = del;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getReceive() {
		return receive;
	}

	public void setReceive(String receive) {
		this.receive = receive;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getPayMethod() {
		return payMethod;
	}

	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	@Override
	public String toString() {
		return "ReservDto [seq=" + seq + ", id=" + id + ", name=" + name + ", birthdate=" + birthdate + ", phone="
				+ phone + ", email=" + email + ", address=" + address + ", receive=" + receive + ", qty=" + qty
				+ ", totalPrice=" + totalPrice + ", payMethod=" + payMethod + ", del=" + del + "]";
	}	
	
	
	
	
}


