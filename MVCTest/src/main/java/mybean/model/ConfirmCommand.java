package mybean.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ConfirmCommand implements ICommand{
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) {
		//방어 코드
		Member dto = new Member();
		dto.setId(req.getParameter("id"));
		dto.setPw(req.getParameter("pw"));
		dto.setEmail(req.getParameter("email"));
		
		req.setAttribute("dto", dto); //setAttribute에 넣어놓은걸 registerConfirm에서 꺼내오기
		//특정 경로 어느페이지로 리턴할 것인지.
		return"/WEB-INF/view/member/registerConfirm.jsp";
	}
}
