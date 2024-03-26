package mybean.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CompleteCommand implements ICommand {

	//인터페이스 상속받았으니까 오버라이딩 필수.
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res) {
		//특정 경로 어느페이지로 리턴할 것인지.
		return "/WEB-INF/view/member/registerComplete.jsp";
	}
}

