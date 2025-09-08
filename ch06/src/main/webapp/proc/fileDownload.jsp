<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.awt.image.DataBufferDouble"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.File"%>
<%@page import="dto.FileDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//파일 번호 수신
	String no = request.getParameter("no");

	FileDTO fileDto = null;	

	// 파일 정보 조회
	try{
		Context ctx = (Context) new InitialContext().lookup("java:comp/env"); 
		DataSource ds = (DataSource) ctx.lookup("jdbc/tmfflavndn");
		Connection conn = ds.getConnection();
		
		String sql = "SELECT * FROM FILES WHERE no=?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, no);
		
		ResultSet rs = psmt.executeQuery();
		
		if(rs.next()){
			fileDto = new FileDTO();
			fileDto.setNo(rs.getInt(1));
			fileDto.setTitle(rs.getString(2));
			fileDto.setName(rs.getString(3));
			fileDto.setoName(rs.getString(4));
			fileDto.setsName(rs.getString(5));
			fileDto.setRdate(rs.getString(6));
		}
		
		rs.close();
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	// response 헤더 정보 수정
	response.setContentType("application/octet-stream");
	response.setHeader("Content-Disposition", "attachment; filename="+URLEncoder.encode(fileDto.getoName(), "utf-8"));
	response.setHeader("Content-Transfer-Encoding", "binary");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "private");
	
	//파일 스트림 작업(파일 내보내기)
	String path = application.getRealPath("/files");
	
	File savedFile = new File(path + File.separator + fileDto.getsName());
	
	BufferedInputStream bis = new BufferedInputStream(new FileInputStream(savedFile));
	BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream()); //response의 스트림으로 출력
	
	// 스트림 전송(파일 전송)
	bis.transferTo(bos);
	
	// 버퍼 키우기
	bos.flush();
	
	//스트림 종료
	bos.close();
	bis.close();
%>
