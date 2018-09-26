<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/common.jsp"%>

<script type="text/javascript">
	
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