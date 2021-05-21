<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 상세</title>
<%	
	String boardSeq = request.getParameter("boardSeq");		
%>

<c:set var="boardSeq" value="<%=boardSeq%>"/> <!-- 게시글 번호 -->

<!-- 공통 CSS -->
<link rel="stylesheet" type="text/css" href="/css/common/common.css"/>

<!-- 공통 JavaScript -->
<script type="text/javascript" src="/js/common/jquery.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){		
		getBoardDetail();		
	});
	
	/** 게시판 - 목록 페이지 이동 */
	function goBoardList(){				
		location.href = "/board/boardList";
	}
	
	/** 게시판 - 수정 페이지 이동 */
	function goBoardUpdate(){
		
		var boardSeq = $("#board_seq").val();
		
		location.href = "/board/boardUpdate?boardSeq="+ boardSeq;
	}
	
	/** 게시판 - 답글 페이지 이동 */
	function goBoardReply(){
		
		var boardSeq = $("#board_seq").val();
		
		location.href = "/board/boardReply?boardSeq="+ boardSeq;
	}
	
	/** 게시판 - 첨부파일 다운로드 */
	function fileDownload(fileNameKey, fileName, filePath){
			
		location.href = "/board/fileDownload?fileNameKey="+fileNameKey+"&fileName="+fileName+"&filePath="+filePath;
	}
	
	/** 게시판 - 상세 조회  */
	function getBoardDetail(boardSeq){
		
		var boardSeq = $("#board_seq").val();

		if(boardSeq != ""){
			
			$.ajax({	
				
			    url		: "/board/getBoardDetail",
			    data    : $("#boardForm").serialize(),
		        dataType: "JSON",
		        cache   : false,
				async   : true,
				type	: "POST",	
		        success : function(obj) {
		        	getBoardDetailCallback(obj);				
		        },	       
		        error 	: function(xhr, status, error) {}
		        
		     });
		} else {
			alert("오류가 발생했습니다.\n관리자에게 문의하세요.");
		}			
	}
	
	/** 게시판 - 상세 조회  콜백 함수 */
	function getBoardDetailCallback(obj){
		
		var str = "";
		
		if(obj != null){								
							
			var boardSeq		= obj.board_seq; 
			var boardReRef 		= obj.board_re_ref; 
			var boardReLev 		= obj.board_re_lev; 
			var boardReSeq 		= obj.board_re_seq; 
			var boardWriter 	= obj.board_writer; 
			var boardSubject 	= obj.board_subject; 
			var boardContent 	= obj.board_content; 
			var boardHits 		= obj.board_hits;
			var delYn 			= obj.del_yn; 
			var insUserId 		= obj.ins_user_id;
			var insDate 		= obj.ins_date; 
			var updUserId 		= obj.upd_user_id;
			var updDate 		= obj.upd_date;
			var files			= obj.files;		
			var filesLen		= files.length;
						
			str += "<tr>";
			str += "<th>제목</th>";
			str += "<td>"+ boardSubject +"</td>";
			str += "<th>조회수</th>";
			str += "<td>"+ boardHits +"</td>";
			str += "</tr>";		
			str += "<tr>";
			str += "<th>작성자</th>";
			str += "<td>"+ boardWriter +"</td>";
			str += "<th>작성일시</th>";
			str += "<td>"+ insDate +"</td>";
			str += "</tr>";		
			str += "<tr>";
			str += "<th>내용</th>";
			str += "<td colspan='3'>"+ boardSubject +"</td>";
			str += "</tr>";
			
			if(filesLen > 0){
			
				for(var a=0; a<filesLen; a++){
					
					var boardSeq	= files[a].board_seq;
					var fileNo 		= files[a].file_no;
					var fileNameKey = files[a].file_name_key;
					var fileName 	= files[a].file_name;
					var filePath 	= files[a].file_path;
					var fileSize 	= files[a].file_size;
					var remark 		= files[a].remark;
					var delYn 		= files[a].del_yn;
					var insUserId 	= files[a].ins_user_id;
					var insDate 	= files[a].ins_date;
					var updUserId 	= files[a].upd_user_id;
					var updDate 	= files[a].upd_date;
					
					str += "<th>첨부파일</th>";
					//str += "<td onclick='javascript:fileDownload(\"" + fileNameKey + "\", \"" + fileName + "\", \"" + filePath + "\");' style='cursor:Pointer'>"+ fileName +"</td>";
					str += "<td colspan='3'><a href='/board/fileDownload?fileNameKey="+encodeURI(fileNameKey)+"&fileName="+encodeURI(fileName)+"&filePath="+encodeURI(filePath)+"'>" + fileName + "</a></td>";
					str += "</tr>";
				}	
			}			
			
		} else {
			
			alert("등록된 글이 존재하지 않습니다.");
			return;
		}		
		
		$("#tbody").html(str);
	}
	
	/** 게시판 - 삭제  */
	function deleteBoard(){

		var boardSeq = $("#board_seq").val();
		
		var yn = confirm("게시글을 삭제하시겠습니까?");		
		if(yn){
			
			$.ajax({	
				
			    url		: "/board/deleteBoard",
			    data    : $("#boardForm").serialize(),
		        dataType: "JSON",
		        cache   : false,
				async   : true,
				type	: "POST",	
		        success : function(obj) {
		        	deleteBoardCallback(obj);				
		        },	       
		        error 	: function(xhr, status, error) {}
		        
		     });
		}		
	}
	
	/** 게시판 - 삭제 콜백 함수 */
	function deleteBoardCallback(obj){
	
		if(obj != null){		
			
			var result = obj.result;
			
			if(result == "SUCCESS"){				
				alert("게시글 삭제를 성공하였습니다.");				
				goBoardList();				
			} else {				
				alert("게시글 삭제를 실패하였습니다.");	
				return;
			}
		}
	}
	
</script>
</head>
<body>
<div id="wrap">
	<div id="container">
		<div class="inner">	
			<h2>게시글 상세</h2>
			<form id="boardForm" name="boardForm">		
				<table width="100%" class="table01">
				    <colgroup>
				        <col width="15%">
				        <col width="35%">
				        <col width="15%">
				        <col width="*">
				    </colgroup>
				    <tbody id="tbody">
				       
				    </tbody>
				</table>		
				<input type="hidden" id="board_seq"		name="board_seq"	value="${boardSeq}"/> <!-- 게시글 번호 -->
				<input type="hidden" id="search_type"	name="search_type" 	value="S"/> <!-- 조회 타입 - 상세(S)/수정(U) -->
			</form>
			<div class="btn_right mt15">
				<button type="button" class="btn black mr5" onclick="javascript:goBoardList();">목록으로</button>
				<button type="button" class="btn black mr5" onclick="javascript:goBoardUpdate();">수정하기</button>
				<button type="button" class="btn black" onclick="javascript:deleteBoard();">삭제하기</button>
				<button type="button" class="btn black mr5" onclick="javascript:goBoardReply();">답글쓰기</button>
			</div>
		</div>
	</div>
</div>
</body>
</html>