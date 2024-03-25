package mybean.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybean.model.DepartmentBean;

//컨트롤러(서블릿)
@WebServlet("/depart") //http://localhost:8080/MVCTest/depart
public class DepartmentServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//html이 서블릿에게 요청함
		String depart = req.getParameter("depart");
		
		//데이터 처리를 위해 DepartmentBean클래스를 호출하여 bean객체를 생성하고, 
		DepartmentBean bean = new DepartmentBean();
		//DepartmentBean클래스의 getAdvice 메서드를 호출하여 전송된 값(depart)에 해당하는 조건문을 실행하고, 그 결과를 advice에 저장
		ArrayList<String> advice = bean.getAdvice(depart); 
		
		//서블릿에서 JSP로 데이터를 전달하는 메서드, "advice"라는 이름으로 advice 변수에 저장된 값을 설정
		req.setAttribute("advice", advice);
		
		//Dispatcher는 컨트롤러와 뷰 사이의 연결 역할
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/view/depart_proc.jsp"); //서블릿에서 JSP로 제어를 넘기는 역할
		dispatcher.forward(req, resp); //클라이언트에게 전달
	}
}
