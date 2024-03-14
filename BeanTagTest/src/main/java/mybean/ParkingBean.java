package mybean;

import java.util.ArrayList;

public class ParkingBean {
	private ArrayList<CarDto> carList = new ArrayList<CarDto>(); //컬렉션 제너릭<CarDto> 객체생성 carList. 입차할때마다 저장
	
	//입차 확인
	public void setEnter(String plate) { //CarDto 저장 
		carList.add(new CarDto(plate, System.currentTimeMillis())); //setEnter 호출할때마다 carList 차량번호 저장
	}
	
	//출차 확인
	public void setExit(String plate) { //차량번호 입력시 carList에서 빼줘야하는데 carList는 <CarDto>객체라서 차량번호만 뺴야한다.
		for(int i=0; i<carList.size(); i++) { //같은 차량번호 있는지 확인
			if(plate.equals(carList.get(i).getPlateNumber())) { //carList.get(i)는 CarDto객체. 거기서 getPlateNumber()차량넘버 빼오기
				carList.remove(i);
				break;
			}
		}
	}
	
	//총 주차된 차량 수
	public int getCounter() {
		return carList.size();
	}
	
	public ArrayList<CarDto> getCarInfo() { //getCarInfo → index Property(배열)는 처리할 수 있는 표준 액션태그가 없기때문에 자바코드로 작성한다.
		return carList;
	}
}
