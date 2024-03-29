package myservlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/valid.do")
public class ValidationServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String birthDate = req.getParameter("birthDate");

		SimpleDateFormat form = new SimpleDateFormat("yyyy/MM/dd");
		
		//제대로 입력했는지 체크할 수 있는 플래그 변수 준비
		boolean isValid = true;
		try {
			form.parse(birthDate); //parse() : birthDate이 값이 yyyy/mm/dd형식에 맞는지 검사해주는 메서드
		} catch (ParseException e) {
			isValid	= false;
			e.printStackTrace();
		} 
		
		String msg = "날짜를 다시 입력하세요.";
		if(isValid) {
			msg = "잘 입력했습니다.";
		}
		//XML로 전달해보기. resp클라이언트에게 응답하는 객체
		resp.setContentType("text/xml");
		resp.setCharacterEncoding("utf-8");
		
		PrintWriter out = resp.getWriter();
		out.println("<response>");
		out.println("<passed>" + Boolean.toString(isValid) + "</passed>");
		out.println("<message>" + msg + "</message>");
		out.println("</response>");
		out.close();
		
	}
}
