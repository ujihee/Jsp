package jboard.controller.article;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jboard.util.ResultCode;

@WebServlet("/article/delete.do")
public class DeleteController extends HttpServlet {

	private static final long serialVersionUID = 1L;
//서비스 불러와서 3개
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String ano = req.getParameter("ano");
//delete	
		resp.sendRedirect("/article/list.do?code="+ResultCode.DELETE_SUCCESS.getCode());
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
}

