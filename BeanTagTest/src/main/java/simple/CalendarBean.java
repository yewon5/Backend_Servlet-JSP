package simple;

import java.util.Calendar;
import java.util.Date;

public class CalendarBean {
	//필드
	private Date today;
	private Calendar cal;
	private int year;
	private int month;
	private int date;
	private String greeting;
	
	//기본 생성자
	public CalendarBean() {
		today = new Date();
		cal = Calendar.getInstance();
	}
	
	//세터메서드 없이 
	public String getToday() {
		return today.toString();
	}
	
	public int getYear() {
		return cal.get(Calendar.YEAR);
	}
	
	public int getMonth() {
		return cal.get(Calendar.MONTH) + 1;
	}
	
	public int getDate() {
		return cal.get(Calendar.DATE);
	}
	
	
	//게터세터 메서드 사용
	public String getGreeting() {
		return greeting;
	}
	public void setGreeting(String greeting) {
		this.greeting = greeting;
	}
}
