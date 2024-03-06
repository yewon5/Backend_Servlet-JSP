import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class sungjukServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int kor = Integer.parseInt(req.getParameter("kor"));
		int eng = Integer.parseInt(req.getParameter("eng"));
		int mat = Integer.parseInt(req.getParameter("mat"));
		
		String calc = req.getParameter("calc");
		
		int result = 0;
		if(calc.equals("sum")) {
			result = (kor + eng + mat);
		}else {
			result = (kor + eng + mat ) / 3;
		}
		
		PrintWriter out = resp.getWriter(); //getWriter();의 리턴값은 PrintWriter
		out.println("<html><body>");
		out.println("result : " + result);
		out.println("</body></html>");
		
		out.close();
	}
}
