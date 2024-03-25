package mybean.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterCommand implements ICommand{
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) {
		return "/WEB-INF/view/member/register.html";
	} 
}
