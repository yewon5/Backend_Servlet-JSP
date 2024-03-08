package persistence;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/sessConfirm")
public class SessionConfirmServlet extends HttpServlet {

	@Override 
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//세션 정보 가져오기
		HttpSession session = req.getSession();
		
		PrintWriter out = resp.getWriter();
		out.println("<html><body>");
		out.println("name : " + session.getAttribute("name") + "<br>"); //session.getAttribute("name") 다른 클래스이니까 해당 코드를 사용한다.
		out.println("address : " + session.getAttribute("addr") + "<br>");
		out.println("Connection Time : " + new Date(session.getCreationTime()) + "<br>"); //세션이 만들어진 시간 = 접속 시간
		out.println("Expired Time : " + session.getMaxInactiveInterval() + "<br>"); //만료 시간. 톰캣은 30분동안 작업이 없으면 만료된다.
		out.println("New : " + session.isNew() + "<br>"); //첫 접속이면 true
		out.println("</body></html>");
		out.close();
	}
}
