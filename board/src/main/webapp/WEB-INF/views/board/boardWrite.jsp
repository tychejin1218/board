<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>      
    
<%	
    // JSP 캐시 삭제
    response.setHeader("Cache-Control","no-store");   
    response.setHeader("Pragma","no-cache");   
    response.setDateHeader("Expires",0);   
    
    if (request.getProtocol().equals("HTTP/1.1")) 
        response.setHeader("Cache-Control", "no-cache"); 
	    
	// Context Root
	String contextRoot = response.encodeURL(request.getContextPath());	
%>

<c:set var="contextRoot" value="<%=contextRoot%>"/>	<!-- Context Root -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 상세</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="http://malsup.github.com/jquery.form.js"></script>
<script type="text/javascript">
		
	/** 전역변수 선언 */
	var _CONTEXTROOT = "${contextRoot}";
	var _URLDOMAIN 	= getUrlDomain();

	$(document).ready(function(){		
		
	});
	
	/** 도메인 값 얻기  */
	function getUrlDomain() {		
		return (location.href).replace("http://", "").replace("https://", "").split("/")[0];
	}
	
	/** 게시판 - 목록 페이지 이동 */
	function goBoardList(){				
		location.href = "http://" + _CONTEXTROOT + _URLDOMAIN + "/board/boardList";
	}
	
	/** 게시판 - 작성  */
	function insertBoard(){

		var boardSubject	= $("#board_subject").val();
		var boardContent 	= $("#board_content").val();
			
		if (boardSubject == ""){			
			alert("제목을 입력해주세요.");
			$("#board_subject").focus();
			return;
		}
		
		if (boardContent == ""){			
			alert("내용을 입력해주세요.");
			$("#board_content").focus();
			return;
		}
		
		var yn = confirm("게시글을 등록하시겠습니까?");		
		if(yn){
				
			$.ajax({	
				
			    url		: "/board/insertBoard",
			    data    : $("#boardForm").serialize(),
		        dataType: "JSON",
		        cache   : false,
		        async   : true,
				type	: "GET",	
		        success : function(obj) {
		        	insertBoardCallback(obj);				
		        },	       
		        error 	: function(xhr, status, error) {}
		        
		    });
		}
	}
	
	/** 게시판 - 작성 콜백 함수 */
	function insertBoardCallback(obj){
	
		if(obj != null){		
			
			var result = obj.result;
			
			if(result == "SUCCESS"){				
				alert("게시글 등록을 성공하였습니다.");				
				goBoardList();				 
			} else {				
				alert("게시글 등록을 실패하였습니다.");	
				return;
			}
		}
	}
	
</script>
</head>
<body>
<h2>게시글 작성</h2>
<form id="boardForm" name="boardForm">
	<table border=1 width="550px">
	    <colgroup>
	        <col width="15%">
	        <col width="*">
	        <col width="15%">
	        <col width="*">
	    </colgroup>
	    <tbody id="tbody">
			<tr>
				<th>제목</th>
				<td><input id="board_subject" name="board_subject" value="" style="width:90%"/></td>
				<th>작성자</th>
				<td><input id="board_writer" name="board_writer" value="" style="width:90%"/></td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3"><textarea id="board_content" name="board_content" cols="65" rows="10" ></textarea></td>
			</tr>
	    </tbody>
	</table>
</form>
<button onclick="javascript:goBoardList();">목록으로</button>
<button onclick="javascript:insertBoard();">등록하기</button>
</body>
</html>