package NWH.member.dto;

public class MemberDto {
	private String id;
	private String password;
	private String name;
	private String email;
	private String address;
	private String birthday;
	private String gender;
	private String phone;
	private String question;
	private String hint;
	private String exhibit_name;
	private String certi_num;
	private int auth;
	
	public MemberDto() {
	}
	
	public MemberDto(String name, String email, String phone) {
		super();
		this.name = name;
		this.email = email;
		this.phone = phone;
	}
	
	

	public MemberDto(String id, String name, String question, String hint) {
		super();
		this.id = id;
		this.name = name;
		this.question = question;
		this.hint = hint;
	}

	public MemberDto(String id, String password, String name, String email, String address, String birthday,
			String gender, String phone, String question, String hint, String exhibit_name, String certi_num,
			int auth) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.email = email;
		this.address = address;
		this.birthday = birthday;
		this.gender = gender;
		this.phone = phone;
		this.question = question;
		this.hint = hint;
		this.exhibit_name = exhibit_name;
		this.certi_num = certi_num;
		this.auth = auth;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getHint() {
		return hint;
	}

	public void setHint(String hint) {
		this.hint = hint;
	}

	public String getExhibit_name() {
		return exhibit_name;
	}

	public void setExhibit_name(String exhibit_name) {
		this.exhibit_name = exhibit_name;
	}

	public String getCerti_num() {
		return certi_num;
	}

	public void setCerti_num(String certi_num) {
		this.certi_num = certi_num;
	}

	public int getAuth() {
		return auth;
	}

	public void setAuth(int auth) {
		this.auth = auth;
	}

	@Override
	public String toString() {
		return "MemberDto [id=" + id + ", password=" + password + ", name=" + name + ", email=" + email + ", address="
				+ address + ", birthday=" + birthday + ", gender=" + gender + ", phone=" + phone + ", question="
				+ question + ", hint=" + hint + ", exhibit_name=" + exhibit_name + ", certi_num=" + certi_num
				+ ", auth=" + auth + "]";
	}
	
	
	
	
	
}
