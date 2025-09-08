package jboard.controller.file;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jboard.dto.FileDTO;
import jboard.service.FileService;

@WebServlet("/file/download.do")
public class DownloadController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	private FileService fileService = FileService.INSTANCE;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override //a태그로 들어오니까 get
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String fno = req.getParameter("fno");
		
		FileDTO fileDTO =fileService.findById(fno);
		logger.debug(fileDTO.toString());
		
		//파일 다운로드 카운트 업데이트
		fileService.DownloadCountPlus(fno);
		
		//파일 다운로드 처리
		fileService.fileDownload(req, resp, fileDTO);
		
	
	}

}
