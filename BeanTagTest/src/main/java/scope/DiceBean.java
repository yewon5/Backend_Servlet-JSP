package scope;

import java.util.Random;

public class DiceBean {
	private int min;
	private int max;
	private Random random = new Random();
	private int counter;
	

	public int getRandomNumber() {
		return random.nextInt(max-min+1) + min;
	}


	public void setMinNumber(int num) {
		min = num;
	}
	
	public void setMaxNumber(int num) {
		max = num;
	}


	public int getCounter() {
		
		return ++counter; //먼저 넘겨주고 증가할거냐, return counter++; 증가하고 넘겨주느냐
	}
}
