import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletExam extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		ServletRequest request = null;
		String[] foods = request.getParameterValues("food");
		
		 int totalPrice = 0;
	        
	        if (foods != null) {
	            for (String food : foods) {
	                totalPrice += Integer.parseInt(food);
	            }
	        }
	        
	        ServletResponse response = null;
			
	        response.setContentType("text/html");
	        response.getWriter().println("<html><body>");
	        response.getWriter().println("<h2>선택한 상품 가격 합계: " + totalPrice + "원</h2>");
	        response.getWriter().println("</body></html>");
	    }
	}