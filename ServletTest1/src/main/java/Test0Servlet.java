import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test0Servlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");
		resp.setContentType("text/html");
		
		PrintWriter out = resp.getWriter();
		Enumeration<String> en = req.getParameterNames();
		while(en.hasMoreElements()) {
			String name = en.nextElement();
			if(name != null) {
				String[] values = req.getParameterValues(name);
				out.println("님이 입력한 " + name + "입니다.");
				out.println("<ul>");
				//필드 값 출력
		        for(String s : values) {
		            out.println("&#x1F449; " + s);
		        }
				out.println("</ul>");
			}
		}
		
		out.close();
	}
}
