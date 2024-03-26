package mybean.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/front")
public class FrontController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//클라이언트로부터 요청 받기
		String cmd = req.getParameter("command");
		String url = null;
		
		//front 패턴
		if(cmd.equals("DEPART")) {
			url = "department.html";
		}
		else if(cmd.equals("SHOP")) {
			url = "/book?command=shop";
		}
		else {
			url = "/mem?command=register";
		}
		
		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);
	}
}
