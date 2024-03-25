package mybean.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface ICommand {
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp);
	//어떤 형식으로 리턴하든 다양하게 사용할 수 있도록 Object로 함
}
