package mybean.model;

//싱글톤
public class FactoryCommand {
	//공장은 1개만 있으면 되니까 공장을 싱글톤 패턴으로 만들기
	private FactoryCommand () {} //생성자를 private으로 설정하여 외부에서 인스턴스화를 막기
	private static FactoryCommand instance = new FactoryCommand(); //static으로 객체를 1개만 생성되게 하기	
	public static FactoryCommand newInstance() {
		return instance;
	}
	
	//특정 객체를 생성해준다.
	//ICommand 인터페이스를 상속 받은 이유는 다른 클래스의 어떤 객체를 생성하든 참조하여 리턴할 수 있다.
	public ICommand createInstance(String cmd) {
		if(cmd.equals("register")) {
			return new RegisterCommand(); 
		}
		else if (cmd.equals("confirm")) {
			return new ConfirmCommand();
		}
		else {		
			return new CompleteCommand();
		}
	}
}
