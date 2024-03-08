package persistence;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/sess")
public class SessionServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String addr = req.getParameter("addr");
		
		//req는 사용자가 서버에 요청할때 만들어지는 객체, 세션은 요청할때 자동으로 생성되기 때문에 req객체를 사용한다.
		HttpSession session = req.getSession(); //특정 사용자의 독립된 저장 공간을 가져온다.
		session.setAttribute("name", name);
		session.setAttribute("addr", addr);
		
		PrintWriter out = resp.getWriter();
		out.println("<html><body>");
		out.println(name + "님 환영합니다."); //session.getAttribute("name")다른 클래스의 경우 이렇게 쓸 수 있다.
		out.println("</body></html>");
		out.close();
	}
}
