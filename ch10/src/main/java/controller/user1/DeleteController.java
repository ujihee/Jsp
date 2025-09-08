package controller.user1;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.User.User1Service;

@WebServlet("/user1/delete.do")
public class DeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	private User1Service service = User1Service.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 전송 데이터 수신
		String uid = req.getParameter("uid");
		
		// 서비스 요청
		service.delete(uid);
		
		// 이동
		resp.sendRedirect("/ch10/user1/list.do");
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	}
	
	
}
