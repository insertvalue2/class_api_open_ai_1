<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap 4 Website Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
.fakeimg {
	height: 200px;
	background: #aaa;
}

.loader-container {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.3);
	z-index: 9999;
	display: none;
}

.loader {
	border: 16px solid #f3f3f3;
	border-top: 16px solid #3498db;
	border-radius: 50%;
	width: 120px;
	height: 120px;
	margin: auto;
	position: absolute; 
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	animation: spin 2s linear infinite;
}
@keyframes spin {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
  }
}

</style>
</head>
<body>

	<div class="jumbotron text-center" style="margin-bottom: 0">
		<h1>OPEN AI TEST</h1>
		<p>spring boot & JSP 활용</p>
	</div>

	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<a class="navbar-brand" href="#">Navbar</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="#">Home</a></li>
			</ul>
		</div>
	</nav>

	<div class="container" style="margin-top: 30px">
		<div class="row">
			<div class="col-sm-12">
				<form onsubmit="return false;">
					<div class="form-group">
						<label for="myPrompt">질문 사항을 입력하세요</label> <input type="text"
							class="form-control" placeholder="무엇이든 물어보세요" id="myPrompt"
							name="prompt" autocomplete="off">
					</div>
				</form>
				<input type="button" id="btn-call" class="btn btn-primary"
					value="질문하기">
			</div>

		</div>
		<!-- 로딩 바 -->
		<div class="loader-container">
			<div class="loader"></div>
		</div>
		<br> <br>
		<div class="alert alert-success" style="display: none;">
			<strong>Success!</strong><br>
			<p class="gpt--content"></p>
		</div>

	</div>
	<script type="text/javascript">
$(document).ready(function() {
	$(document).ajaxStart(function() {
	    $('.loader-container').show();
	  }).ajaxStop(function() {
	    $('.loader-container').hide();
	  });
	 $("#btn-call").bind("click", () => {
		
		 let data = {
				model : "gpt-3.5-turbo", 
				messages: [
						{
						 "role" : "user",
						 "content" : $("#myPrompt").val()	 
						}
					],
		 		temperature: 0.7
		 };
		// console.log(JSON.stringify(data));	
		$.ajax({
			type: "POST", 
			url: "/api/prompt",
			data: JSON.stringify(data),  
			contentType: "application/json; charset=utf-8", 
			dataType: "json" 
		}).done(function(data, textStatus, xhr) {
			var content = data.choices[0].message.content;
			$('.alert-success').show();
			$('.gpt--content').text(content);
			
		}).fail(function(error) {
			
			alert("chat gpt 가 응답하지 않습니다");
		});		
	 });
});
</script>
</body>
</html>
