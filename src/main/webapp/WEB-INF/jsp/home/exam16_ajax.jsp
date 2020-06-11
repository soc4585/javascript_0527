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
		
		<c:if test="${sessionMid == null}">
			<script>
				loginStatus = false;
			</script>
		</c:if>
		
		<c:if test="${sessionMid != null}">
			<script>
				loginStatus = true;
			</script>
		</c:if>
		
		<script>
			// 마지막에 실행됨
			$(function() {
				if(loginStatus) {
					$("#loginForm").hide()
					$("#logoutDiv").show()
				}else {
					$("#loginForm").show()
					$("#logoutDiv").hide()
				}
			});
		
			function fun1() {
				$.ajax({
					// url(비동기 요청 경로)
					url:"ajaxContent1.do", 
					// settings(Callback: 응답이 도착했을 때 자동 실행)
					success:function(data, textStatus, jqXHR) {
						console.log("비동기 결과가 왔습니다.")
						$("#div1").html(data);
					}
				});			
				console.log("나 실행이 먼저되요~");
			}

			function fun2() {
				$.ajax({
					url:"ajaxContent2.do",
					success:function(data) {
						$("#img2").attr("src", "${pageContext.request.contextPath}/resource/img/" + data.img);
					}
				});
			}
			
			function fun3() {
				$("#errorMid").html("");
				$("#errorMpassword").html("");
				
				var mid = $("#mid").val();
				var mpassword = $("#mpassword").val();
				if(mid == "" || mpassword == "") return;
				
				$.ajax({
					url: "ajaxLogin.do",
					data: {mid:mid, mpassword:mpassword},	// 파라미터이름:파라미터값, 파라미터이름:파라미터값
					success: function(data) {	// {"result":"success"} or {"result":"wrongMid or wrongMpassword"}
						if(data.result == "success") {
							$("#loginForm").hide()
							$("#logoutDiv").show()
						} else if(data.result == "wrongMid") {
							$("#errorMid").html(" *ID가 존재하지 않습니다.");
						} else if(data.result == "wrongMpassword") {
							$("#errorMpassword").html(" *비밀번호가 틀립니다.");
						}
					}
				});
			}
			
			function fun4() {
				$.ajax({
					url: "ajaxLogout.do",
					success: function(data) {
						if(data.result == "ok") {
							$("#loginForm").show()
							$("#logoutDiv").hide()
						}
					}
				});
			}
		</script>
	</head>
	<body>
		<h5 class="alert alert-info">/home/exam16_ajax.jsp</h5>	
		
		<div style="margin-bottom:20px; padding:10px; border-top:1px solid black">
			<button onclick="fun1()" style="margin-bottom:10px;">AJAX로 HTML 조각 받기</button>
			<div id="div1" style="margin:10px; padding: 10px; border:1px solid black">
			</div>
		</div>	
		
		<div style="margin-bottom:20px; padding:10px; border-top:1px solid black">
			<button onclick="fun2()" style="margin-bottom:10px;">AJAX로 Data(JSON) 받기</button>
			<div id="div2" style="margin:10px; padding: 10px; border:1px solid black">
				<img id="img2" width="100px" height="100px" src="${pageContext.request.contextPath}/resource/img/bg1.jpg"/>
			</div>
		</div>
		
		<div style="margin-bottom:20px; padding:10px; border-top:1px solid black">
			<div id="div3" style="margin:10px; padding: 10px; border:1px solid black">
				<form id="loginForm" name="loginForm">
					ID: <input id="mid" name="mid" type="text"/><span id="errorMid" style="color:red;"></span> <br/>
					PW: <input id="mpassword" name="mpassword" type="password"/><span id="errorMpassword" style="color:red;"></span> <br/> <br/>
					<input onclick="fun3()" type="button" value="AJAX로 로그인 처리" class="btn btn-danger btn-sm"/>
					<a href="javascript:fun3()"  class="btn btn-danger btn-sm">AJAX로 로그인</a>
				</form>
				<div id="logoutDiv" style="display:none;">
					<a href="javascript:fun4()"  class="btn btn-danger btn-sm">AJAX로 로그아웃</a>
				</div>
			</div>
		</div>
	</body>
</html>
