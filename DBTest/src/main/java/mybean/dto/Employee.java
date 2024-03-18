package mybean.dto;

//데이터를 저장or보관하기 위한 DTO패턴
public class Employee {
	private String e_no; //필드명과 같게 해준다.
	private String e_id;
	private String e_name;
	private String e_pass;
	private String e_address;

	
	public String getE_no() {
		return e_no;
	}

	public void setE_no(String e_no) {
		this.e_no = e_no;
	}

	public String getE_id() {
		return e_id;
	}

	public void setE_id(String e_id) {
		this.e_id = e_id;
	}

	public String getE_name() {
		return e_name;
	}

	public void setE_name(String e_name) {
		this.e_name = e_name;
	}

	public String getE_pass() {
		return e_pass;
	}

	public void setE_pass(String e_pass) {
		this.e_pass = e_pass;
	}

	public String getE_address() {
		return e_address;
	}

	public void setE_address(String e_address) {
		this.e_address = e_address;
	}
	
	
}
