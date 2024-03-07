import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RequestHeaderInfo extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out = resp.getWriter();
		resp.setContentType("text/html"); //지금부터 작성하는 모든 출력은 html이다.

		Enumeration e = req.getHeaderNames();
		while(e.hasMoreElements()) {
			out.println(e.nextElement() + "<br>");
		}
		
		out.println("<hr/>");
		
		out.println("host : " + req.getHeader("host")+ "<br>"); //페이지 만든 
		out.println("sec-ch-ua : " + req.getHeader("sec-ch-ua")+ "<br>");
		out.println("sec-ch-ua-platform : " + req.getHeader("sec-ch-ua-platform")+ "<br>");
		out.println("user-agent : " + req.getHeader("user-agent")+ "<br>");
		out.println("accept-language : " + req.getHeader("accept-language")+ "<br>");
		out.println("Client IP : " + req.getRemoteAddr()+ "<br>"); //접속한 사용자 IP
		
		out.close();
	}
}
