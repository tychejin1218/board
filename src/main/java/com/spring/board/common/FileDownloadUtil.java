package com.spring.board.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;
 
public class FileDownloadUtil extends AbstractView {
 
    public FileDownloadUtil() {
        // 객체가 생성될 때 Content Type을 다음과 같이 변경 
        setContentType("application/download; charset=utf-8");
    }
 
    @Override
    protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response) throws Exception {
         
        @SuppressWarnings("unchecked")
		Map<String, Object> fileInfo = (Map<String, Object>) model.get("fileInfo"); // 전송받은 모델(파일 정보)
        
        String fileNameKey 	= (String) fileInfo.get("fileNameKey");	// 암호화된 파일명(실제 저장된 파일 이름)
        String fileName 	= (String) fileInfo.get("fileName");	// 원본 파일명(화면에 표시될 파일 이름)
        String filePath 	= (String) fileInfo.get("filePath");	// 파일 경로
         
        File file = new File(filePath, fileNameKey);
         
        response.setContentType(getContentType());
        response.setContentLength((int) file.length());

        // 브라우저, 운영체제정보
        String userAgent = request.getHeader("User-Agent");
        
        
        // IE
        if (userAgent.indexOf("MSIE") > -1) {
        	
        	fileName = URLEncoder.encode(fileName, "UTF-8");
        }
		 
        // IE 11
        if (userAgent.indexOf("Trident") > -1) {
        	fileName = URLEncoder.encode(fileName, "UTF-8");
		}
		
        else {
        	fileName = new String( fileName.getBytes("UTF-8"), "8859_1");
		}
 
        response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\";");
        response.setHeader("Content-Transfer-Encoding", "binary");
        
        OutputStream out = response.getOutputStream();
 
        FileInputStream fis = null;
 
        try {
        	
            fis = new FileInputStream(file);
            FileCopyUtils.copy(fis, out);
            
        } finally {
        	
            if(fis != null) {
            	fis.close();
            }
        }
        
        out.flush();
    }
}