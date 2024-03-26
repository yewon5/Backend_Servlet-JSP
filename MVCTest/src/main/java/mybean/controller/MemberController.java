package mybean.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybean.model.Book;
import mybean.model.CompleteCommand;
import mybean.model.ConfirmCommand;
import mybean.model.FactoryCommand;
import mybean.model.ICommand;
import mybean.model.Member;
import mybean.model.RegisterCommand;

//컨트롤러(서블릿)
@WebServlet("/mem")
public class MemberController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/* MVC패턴
		String command = req.getParameter("command");
		String url = null;	
		
		if(command.equals("register")) {
			//방어 코드
			url = "/WEB-INF/view/member/register.html";
		}
		else if (command.equals("confirm")) {
			//방어 코드
			Member dto = new Member();
			dto.setId(req.getParameter("id"));
			dto.setPw(req.getParameter("pw"));
			dto.setEmail(req.getParameter("email"));
			
			req.setAttribute("dto", dto); //setAttribute에 넣어놓은걸 registerConfirm에서 꺼내오기
			
			url = "/WEB-INF/view/member/registerConfirm.jsp";
		}
		else if (command.equals("complete")) {
			//방어 코드
			
			//DB연동
			
			url = "/WEB-INF/view/member/registerComplete.jsp";
		}
		
		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);
		*/
		
		/* command패턴
		//복잡한 명령어를 하나의 변수로 전달 받기 위해 ICommand.java 인터페이스 생성.
		String command = req.getParameter("command");
		String url = null;	
		ICommand icmd = null;
		
		if(command.equals("register")) {
			icmd = new RegisterCommand(); //RegisterCommand() 이 클래스를 의존하고 있기때문에 클래스에 문제가 생기면 줄줄이 문제가 생긴다.
		}
		else if (command.equals("confirm")) {
			icmd = new ConfirmCommand();
		}
		else if(command.equals("complete")) {		
			icmd = new CompleteCommand();
		}
		
		url = (String)icmd.processCommand(req, resp);
		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);
		*/
		
		
		//Factory 패턴
		String command = req.getParameter("command");
		String url = null;	
		ICommand icmd = null;
		
		//싱글톤이라서 new로 생성하지 않는다.
		FactoryCommand factory = FactoryCommand.newInstance(); //공장의 위치
		icmd = factory.createInstance(command);
		
		url = (String)icmd.processCommand(req, resp);
		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);
	}
}
