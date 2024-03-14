package mybean;

public class MemberDto { //Dto(Data Transfer Object) 디자인패턴 : 변수를 객체로 묶어서 전송하기 위한 용도. 메서드보다는 변수 위주 (클래스는 메서드)
	private String mem_id;
	private String mem_pw;
	private String mem_name;
	private String mem_email;
	private String mem_tel;
	private String mem_addr;
	
	//private 선언했기때문에 게터세터 준비
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pw() {
		return mem_pw;
	}
	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getMem_tel() {
		return mem_tel;
	}
	public void setMem_tel(String mem_tel) {
		this.mem_tel = mem_tel;
	}
	public String getMem_addr() {
		return mem_addr;
	}
	public void setMem_addr(String mem_addr) {
		this.mem_addr = mem_addr;
	}
}
