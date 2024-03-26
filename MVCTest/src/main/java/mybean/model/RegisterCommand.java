package mybean.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterCommand implements ICommand{
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) {
		//특정 경로 어느페이지로 리턴할 것인지.
		return "/WEB-INF/view/member/register.html";
	} 
}
