package mybean;

import java.util.Date;

public class CarDto {
	private String plateNumber;
	private long parkingTime;
	
	//생성자
	public CarDto(String plateNumber, long parkingTime) { //차량번호, 입차시간
		this.plateNumber = plateNumber;
		this.parkingTime = parkingTime;
	}
	
	//기본 생성자
	public CarDto() {}

	//게터메서드
	public String getPlateNumber() {
		return plateNumber;
	}

	public Date getParkingTime() {
		return new Date(parkingTime);
	}
}
