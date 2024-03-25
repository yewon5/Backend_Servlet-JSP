package mybean.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybean.model.Book;

//컨트롤러(서블릿)
@WebServlet("/book")
public class BookController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		//action="/MVCTest/book" 이때 문제점은 요청만했지 어디로 이동하고 싶은지 서블릿은 구분할 수가 없다. 액션태그에 command달아주기
		String command = req.getParameter("command");
		String url = "";	
		
		HttpSession session = req.getSession();
		ArrayList<Book> bookList = (ArrayList<Book>)session.getAttribute("bookList");  //장바구니에서 써야하니까 cart.jsp if문 추가해준다

		if(command.equals("shop")) {
			url = "/WEB-INF/view/bookshop.jsp";
		}
		else if (command.equals("cart")) {
			url = "/WEB-INF/view/bookshop.jsp";
			
			if(bookList == null) {//이페이지가 처음 실행됐을때, 장바구니가 만들어지기 전에
				bookList = new ArrayList<Book>(); //1회만 실행되고 끝남
			}
			
			bookList.add(getBook(req)); //데이터를 계속 누적하고
			session.setAttribute("bookList", bookList); //세션에 저장
		}
		else if (command.equals("checkout")) {
			url = "/WEB-INF/view/checkout.jsp";
		}
		else if (command.equals("del")) {
			url = "/WEB-INF/view/del.jsp";
			
			//if() {
				
			//}
		}
		
		
		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);
	}
	
		public Book getBook(HttpServletRequest req) {
			String book = req.getParameter("book"); //<select name="book">
			String quantity = req.getParameter("quantity"); //<input type="text" name="quantity" size="2" value="1" />
			
			//선택된 도서의 정보를 파싱하고 해당 정보를 변수에 할당
			StringTokenizer st = new StringTokenizer(book, "/"); //선택된 도서 정보인 'book' 문자열을 '/'를 구분자로 사용하여 분리
			String title = st.nextToken().trim(); //첫 번째 토큰을 가져와서 이를 도서의 제목으로 간주. trim() 함수를 호출하여 문자열의 앞뒤 공백을 제거
			String author = st.nextToken().trim(); //다음 토큰을 가져와서 이를 도서의 저자로 간주.
			int price = Integer.parseInt(st.nextToken().trim()); //다음 토큰을 가져와서 이를 도서의 가격으로 간주
			
			//DTO객체에 저장
			Book dto = new Book();
			dto.setAuthor(author);
			dto.setTitle(title);
			dto.setPrice(price);
			dto.setQuantity(Integer.parseInt(quantity));
			
			return dto; //장바구니로 넘어가는 데이터
	}	
}
