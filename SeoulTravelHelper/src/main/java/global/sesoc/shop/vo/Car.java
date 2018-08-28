package global.sesoc.shop.vo;

public class Car {
	private String car;
	private String reserve;
	public Car() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Car(String car, String reserve) {
		super();
		this.car = car;
		this.reserve = reserve;
	}
	public String getCar() {
		return car;
	}
	public void setCar(String car) {
		this.car = car;
	}
	public String getReserve() {
		return reserve;
	}
	public void setReserve(String reserve) {
		this.reserve = reserve;
	}
	@Override
	public String toString() {
		return "Car [car=" + car + ", reserve=" + reserve + "]";
	}
	
	
	
}
