package scope;
/*
name						r/w		data type
----------------------------------------------
elapsedTime					r		long
restart						w		boolean
elapsedTimeAfterInst		r		long
elapsedTimeAfterLastAccess	r		long
*/
public class TimerBean {
	private long startTime; //리셋버튼을 눌렀을때 시간을 저장
	private long instTime; //전체 시간 저장
	private long lastAccessTime; //프로퍼티에 마지막으로 접근한 시간 저장
	
	//현재 시간 저장
	public TimerBean() {
		startTime = System.currentTimeMillis(); //타이머 시작 시간을 초단위로 환산
		instTime = startTime;
		lastAccessTime = startTime; //3개의 변수를 타이머 시작 시간으로 초기화
	}
	
	//타이머가 리셋한 후에 경과된 시간
	public long getElapsedTime() {
		lastAccessTime = System.currentTimeMillis(); //마지막으로 프로퍼티에 접근(호출)한 시간. 모든 게터세터에 넣어준다.
		return (lastAccessTime - startTime)/1000; //호출한 시간과 타이머의 시작 시간의 차이를 구해서 현재까지의 경과 시간을 계산
	}
	
	//타이머 리셋
	public void setRestart(boolean b) { //boolean b → param="restart" 임의로 호출
		lastAccessTime = System.currentTimeMillis(); //마지막으로 프로퍼티에 접근(호출)한 시간.
		startTime = System.currentTimeMillis(); 
		//현재시간 재저장. 리셋을 누르고 타이머가 다시 시작해야 하니까, 시작 시간을 현재 시간으로 다시 설정함. 이를 통해 타이머가 리셋되고 새로운 경과 시간이 측정
	}
	
	//전체 시간
	public long getElapsedTimeAfterInst() {
		lastAccessTime = System.currentTimeMillis(); //마지막으로 프로퍼티에 접근(호출)한 시간.
		return (lastAccessTime - instTime)/1000; //천분의 1초단위라서 연산 값을 1000으로 나눠준다.
	}
	
	//액션태그로 불러다쓸 수 있는 메서드는 전부다 빈 프로퍼티다 = 게터세터 메서드
	//위에 다른 메서드가 호출됐을때의 시간을 현재시간에서 빼줘야한다.
	public long getElapsedTimeAfterLastAccess() {
		long current = System.currentTimeMillis(); //현재시간 잠깐 current에 저장
		long elapsed = (current- lastAccessTime)/1000; //current는 현재시간 - lastAccessTime는 메서드가 호출됐을때 시간
		
		lastAccessTime = System.currentTimeMillis(); //마지막으로 프로퍼티에 접근(호출)한 시간.
		
		return elapsed;
	}

} 
