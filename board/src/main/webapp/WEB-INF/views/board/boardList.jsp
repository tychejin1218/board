<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 목록</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
		alert("123");
		getBoardList();
	});

	function getBoardList(){
		
		$.ajax({			
			type:"GET",
		    url:"/board/getBoardList",
	        dataType:"JSON",
	        success : function(data) {
	        	console.log(data);
	        },	       
	        error : function(xhr, status, error) {}
	     });
	}
	
</script>
</head>
<body>

</body>
</html>