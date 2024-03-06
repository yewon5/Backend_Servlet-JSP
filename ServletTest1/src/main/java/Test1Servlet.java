import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test1Servlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out = null;
		
		try{
			req.setCharacterEncoding("euc-kr");
			resp.setCharacterEncoding("euc-kr");

			String name = req.getParameter("name");
			String addr = req.getParameter("addr");
		
			out = resp.getWriter(); //getWriter(); 웹브라우저 화면에 출력
			out.println("<html><body>");
			out.println("<h1>Request Test</h1>");
			
			if(req.getMethod().equals("POST")){
				out.println("이것은 Post방식으로 처리된 내용입니다.<br>");
			}
			out.println("님이 보낸 데이터는 다음과 같습니다<br>");
			out.println("이름은 " + name + "이고 주소는 " + addr + "입니다.");
			out.println("</body></html>");
		}
		catch(Exception e){}
		finally{
			out.close();
		}
	}
}