<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html >
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="icon" href="./assets//images/favicon.png" type="image/gif" sizes="20x20">
    <title>Sign in</title>
    <link rel="stylesheet" href="./assets//css/signStyle.css">

</head>
<body>
<% String error = request.getAttribute("error")!=null?(String) request.getAttribute("error"):"";
	String success = request.getAttribute("success")!=null?(String) request.getAttribute("success"):"";
	String errorRegister = request.getAttribute("errorRegister")!=null?(String) request.getAttribute("errorRegister"):"";
	String route = request.getAttribute("route") == null?null:(String) request.getAttribute("route");
%>
	<div class="logo">
		<a href="/projectWeb_war/user/views/home"><img src="./assets//images/logo-w.png" alt="logo"></a>
	</div>
<div class="container <%=route==null?"":route.equals("register")?"right-panel-active":""%>"  id="container">
	<div class="form-container sign-up-container">
		<form action="/projectWeb_war/user/views/doRegister" method="POST" class="sign-up-container-valid">
			<h1>Tạo Tài Khoản</h1>
			<div class="social-container">
				<a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
				<a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
				<a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
			</div>
			<span><%=success%></span>
			<div class="field">
				<input class="name" name="username" type="text" placeholder="User Name" />
				<span style="color: red"><%=errorRegister%></span>
			</div>
			<div class="field">
				<input class="email" name="email"  type="email" placeholder="Email" />
				<span></span>
			</div>
			<div class="field">
				
				<input class="password" name="password"  type="password" placeholder="Password" />
				<span></span>
			</div>
			<div class="field">
				<input class="repeat-password" name="repeat-password" type="password" placeholder="Repeat password" />	
				<span></span>
			</div>
			<button  >Đăng Ký</button>
			<span class="signHere signInHere">Đăng nhập ở đây</span>
		</form>
	</div>
	<div class="form-container sign-in-container">
		<form action="/projectWeb_war/user/views/doLogin" method="POST" class="sign-in-container-valid">
			<h1>Đăng Nhập</h1>
			<div class="social-container">
				<a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
				<a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
				<a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
			</div>
			<span>Hoặc sử dụng tài khoản của bạn</span>
			<!--
				sign in form submit
			-->
			<div class="field">
				
				<input name="username" type="text" placeholder="Username" />
				<span style="color: red"><%=error%></span>
			</div>
			<div class="field">
				<input name="password" type="password" placeholder="Password" />
				<span></span>
			</div>
			<a href="forgotPassword.jsp">Quên mật khẩu</a>
			<!-- form-submit type="submit" -->
			<button >Đăng Nhập</button>
			<span class="signHere signUpHere">Đăng Ký ở đây</span>
		</form>
	</div>
	<div class="overlay-container">
		<div class="overlay">
			<div class="overlay-panel overlay-left">
				<h1>Xin chào, Bạn!</h1>
				
				<p>Để kết nối vào trang web, hãy cung cấp cho chúng tôi một số thông tin của bạn</p>
				<button class="ghost" id="signIn">Đăng Nhập</button>
				
			</div>
			<div class="overlay-panel overlay-right">
				<h1>Chào mừng trở lại!</h1>
				<p>Hãy nhập thông tin của bạn để truy cập vào trang web của chúng tôi</p>
				<button class="ghost" id="signUp">Đăng Ký</button>
			</div>
		</div>
	</div>
</div>

<!-- <footer>
	<p>
		Created with <i class="fa fa-heart"></i> by
		<a target="_blank" href="https://florin-pop.com">Florin Pop</a>
		- Read how I created this and how you can join the challenge
		<a target="_blank" href="https://www.florin-pop.com/blog/2019/03/double-slider-sign-in-up-form/">here</a>.
	</p>
</footer> -->

<script src="./assets//js/signJS.js"></script>
 <script>

	Validator({
		form : '.sign-up-container-valid',
		rules :[
		Validator.isRequired('.name'),
		Validator.isEmail('.email'),
		Validator.isPassword('.password',6),
		Validator.isRequired('.repeat-password'),
		Validator.isConfirmed('.repeat-password',function () {
			return document.querySelector('.sign-up-container .field .password').value;

		},'Mật khẩu nhập lại không khớp'),
		]
	});




</script>
    
</body>
</html>