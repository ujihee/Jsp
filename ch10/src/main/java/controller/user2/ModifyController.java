package controller.user2;

import java.io.IOException;

import dto.user.User2DTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.User.User2Service;

@WebServlet("/user2/modify.do")
public class ModifyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private User2Service service = User2Service.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 전송 데이터 수신
		String uid = req.getParameter("uid");
		
		// 수정 데이터 조회
		User2DTO user2DTO = service.findById(uid);
		
		// request 객체로 조회 데이터 공유
		req.setAttribute("user2DTO", user2DTO);
		
		// 포워드
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user2/modify.jsp");
		dispatcher.forward(req, resp);		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		// 전송 데이터 수신
		String uid = req.getParameter("uid");
		String name = req.getParameter("name");
		String birth = req.getParameter("birth");
		String addr = req.getParameter("addr");
		
		// 서비스 전달을 위한 DTO 생성
		User2DTO dto = new User2DTO();
		dto.setUid(uid);
		dto.setName(name);
		dto.setBirth(birth);
		dto.setAddr(addr);
		
		// 서비스 호출
		service.modify(dto);
		
		// 이동
		resp.sendRedirect("/ch10/user2/list.do");
		
	}
	
	
}
