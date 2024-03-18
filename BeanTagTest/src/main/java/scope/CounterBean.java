package scope;

public class CounterBean {
	int visit = 0;
	
	
	public void setNewVisit(int num) {
		visit = num; //매개변수 num을 받아서 그 값을 visit에 할당
	}
	
	public void setRestart(boolean b) {
		visit = 0;
	}

	public int getVisitCount() {
		return visit++;
	}
}


/* 내 코드
package scope;

public class CounterBean {
	private int count = 0;
	private int restart = 0;
	
	public void setNewVisit(int num) {
		
	}
	
	public void setRestart(boolean b) {
		this.count = restart;
	}
	
	public int getVisitCount() {
		return count++;
	}
}
*/