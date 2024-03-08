package persistence;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CookConfirm")
public class CookieConfirmServlet extends HttpServlet {

	@Override 
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//저장된 쿠키를 꺼내서 확인
		Cookie[] cooks = req.getCookies();
		
		PrintWriter out = resp.getWriter();
		out.println("<html><body>");
		out.println("쿠키 정보는 다음과 같습니다.");

		for(Cookie c : cooks) {
			out.println(c.getName() + ", " + c.getValue() + "<br>");
		}
			
		out.println("</body></html>");
		out.close();
	}
}
