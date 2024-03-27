package mybean;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/eltest.do")
public class ELTestServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String name = req.getParameter("name"); 
		//test.6 HTTP 요청에서 "name"이라는 이름의 파라미터 값 가져오기
		//이 값을 String name 변수에 저장. 이 변수는 요청 범위(request scope) 내에서만 사용할 수 있는 지역 변수
		//req.setAttribute("name", name); 
		//name은 이미req.getParameter 저장됐기때문에 또 req.set에 담을 필요 없이, test7에서 ${param.name }으로 바로 꺼내올 수 있다.
		req.setAttribute("visitCount", 100); //${requestScope.visitCount }로 꺼내오기
		
		String[] favorateFoods = {"뇨끼", "파스타", "쌀국수", "삼겹살", "짜파게티"};
		req.setAttribute("foods", favorateFoods);
		//7에서만 사용하면 리퀘스트에 담고 모든파일에서 사용할 거라면 세션에 담기
		
		//객체 생성
		Person won = new Person();
		Dog ydb = new Dog();
		
		won.setName("원");
		ydb.setName("연두부");
		
		won.setDog(ydb); //won 객체의 setDog() 메소드를 사용하여 ydb 객체를 won 객체의 속성으로 설정
		req.setAttribute("won", won);
		
		String[] comment = {"이 사이트는 매우 훌륭합니다.", "정말 좋은 사이트입니다", "자주 찾는 사이트가 될것 같아요."};
		req.setAttribute("comment", comment);
		
		ArrayList<String> movies = new ArrayList<String>();
		movies.add("트와일라잇");
		movies.add("암살");
		movies.add("어벤져스");
		movies.add("인셉션");
		req.setAttribute("movies", movies);
		
		
		//RequestDispatcher view = req.getRequestDispatcher("test7.jsp");
		RequestDispatcher view = req.getRequestDispatcher("core/test4.jsp");
		view.forward(req, resp);
	}
}
