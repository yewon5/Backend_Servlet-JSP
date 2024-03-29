package myservlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/dynamic.do")
public class DynamicServlet extends HttpServlet{
	private int counter = 1;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/xml");
		resp.setCharacterEncoding("utf-8");
		resp.setHeader("Cache-Control", "no-cache"); //no-cache 무조건 서버를 가져온다(새로고침)
		
		PrintWriter out = resp.getWriter();
		String msg = "";
		
		switch(counter) {
			case 1:
				msg = "아는 것이 힘이다.";
				break;
			case 2:
				msg = "천리길도 한걸음부터";
				break;
			case 3:
				msg = "아프니까 청춘이다";
				break;
			case 4:
				msg = "기분이 태도가 되지 말자";
				break;
			case 5:
				msg = "흔들리지 않고 피는 꽃이 어디 있으랴";
				break;
		}
		counter++; //doGet메서드가 호출될때마다 1,2,...5순서로 증가
		
		out.println("<response>");
		out.println("<message>" + msg + "</message>");
		out.println("</response>");
		out.close();
	}
}
