<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/bootstrap/css/bootstrap.min.css">
		<script src="${pageContext.request.contextPath}/resource/jquery/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/resource/popper/popper.min.js"></script>
		<script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/jquery-ui/jquery-ui.min.css">
		<script src="${pageContext.request.contextPath}/resource/jquery-ui/jquery-ui.min.js"></script>
		<script>
			function click_hanlder() {
				console.log("클릭됨");
				div1 = document.getElementById("div1");
				div1.style.backgroundColor="green";
			}
			function mouseover_hanlder() {
				console.log("마우스가 올라가 있음");
				div1 = document.getElementById("div1");
				div1.style.backgroundColor="yellow";
			}
			function mouseout_hanlder() {
				console.log("마우스가 벗어남");
				div1 = document.getElementById("div1");
				div1.style.backgroundColor="red";		//객체.속성.~~ ..?
			}
			
		</script>
	</head>
	<body>
		<h5 class="alert alert-info">/home/exam08_event.jsp</h5>	
		
		<div>
			<button onclick="click_hanlder()" 
					onmouseover="mouseover_hanlder()"
					onmouseout="mouseout_hanlder()">button</button>
			<div id="div1"
				 onclick="click_hanlder()"
				 onmouseover="mouseover_hanlder()"
				 onmouseout="mouseout_hanlder()"
				 style="width:200px;height:200px;background-color:red;margin-top:20px">div</div>
		</div>	
	</body>
</html>