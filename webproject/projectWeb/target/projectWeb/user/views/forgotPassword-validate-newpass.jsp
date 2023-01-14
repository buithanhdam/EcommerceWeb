<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html >
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="icon" href="./assets/images/favicon.png" type="image/gif" sizes="20x20">
    <title>Sign in</title>
    <link rel="stylesheet" href="./assets/css/signStyle.css">

</head>
<body>
	<div class="logo">
		<a href="/projectWeb_war/user/views/home"><img src="./assets/images/logo-w.png" alt="logo"></a>
	</div>
<div class="container forgotpassowrd-container" id="container">
	 <%
	 String email = session.getAttribute("email")==null?null:(String) session.getAttribute("email");
	 %>
	<div class="form-container ">
		<form action="/projectWeb_war/user/views/newPassword" method="POST" class="forgotpassowrd">
			<h1>Tạo mật khẩu mới</h1>
			
			<!--
				sign in form submit
			-->
			<input class="password" style="display: none" name="email" value="<%=email==null?"":email%>"  type="email"   />
			<input disabled value="<%=email==null?"":email%>"  type="email"   />
			<div class="field">
				
				<input class="password" id="password" name="password"  type="password" placeholder="Password" required />
				<span id="pError" style="color: red; font-size: 0.6rem"></span>
			</div>
			<div class="field">
				<input class="repeat-password" id="repeat-password" name="repeat-password" type="password" placeholder="Repeat password" required />
				<span id="rpError"  style="color: red; font-size: 0.6rem"></span>
			</div>
			<button type="submit" id="butt"  class="xac-nhan-ma">Xác nhận</button>
			
		</form>
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

<script src=./assets/js/signJS.js"></script>
<script>
	// const qmk = document.querySelector('.xac-nhan-ma');
	// qmk.onclick = (e) => {
	// 	e.preventDefault();
	// 	window.location.href = "sign.jsp"
	// }
	const  password = document.getElementById("password")
	const  Rpassword = document.getElementById("repeat-password")
	const  pError = document.getElementById("pError")
	const  rpError = document.getElementById("rpError")
	const  butt = document.getElementById("butt")
	password.oninput = (e)=>{
		if(e.target.value < 6){
			pError.innerText = 'Mật khẩu phải hơn 6 ký tự'
			butt.disabled = true;
		}else {
			pError.innerText =''
			butt.disabled = false;
		}

		if (e.target.value === Rpassword.value){
			pError.innerText =''
			butt.disabled = false;
		}else{
			pError.innerText ='Mật khẩu xác nhận không trùng nhau'
			butt.disabled = true;
		}
	}

	Rpassword.oninput = (e)=>{

		if(e.target.value < 6){
			rpError.innerText = 'Mật khẩu phải hơn 6 ký tự'
			butt.disabled = true;
		}else {
			rpError.innerText =''
			butt.disabled = false;
		}

		if (e.target.value === Rpassword.value){
			rpError.innerText =''
			butt.disabled = false;
		}else{
			rpError.innerText ='Mật khẩu xác nhận không trùng nhau'
			butt.disabled = true;
		}
	}

</script>
<!-- <script>

	Validator({
		form : '.sign-up-container-valid',
		rules :[
		Validator.isRequired('.name'),
		Validator.isEmail('.email'),
		Validator.isPassword('.password',6),		
		Validator.isRequired('.repeat-password'),
		Validator.isConfirmed('.repeat-password',function () {
			return document.querySelector('.sign-up-container .field .password').value;
			
		},'Repeat password not correct'),	
		],
		onSubmit : function (data) {
			console.log(data);
			
		}
		,postData : function (data) {
			var api = 'http://localhost:3000/content';
				
					var options = {
						method: 'POST',
						body: JSON.stringify(data),
						headers: {
							'Content-Type': 'application/json'
						}
					}
					fetch(api,options)
					.then(function (response) {
						return response.json()
						
					})
					.then(function (datas) {
						console.log(datas)
						
					})
		
				
			
			}


	});

	SignIn({
		form : ".sign-in-container-valid",
		checkSignin : function (data) {
			var api = 'http://localhost:3000/content';
				
				fetch(api)
				.then(function (response) {
					return response.json()
					
				})
				.then(function (values) {

					const guest = values.filter(function (value,index) {
						return (value.email === data.email && value.password === data.password)
						
						
					});
					
					if (guest ) {
						console.log(guest);
					}else{
						console.log('sai tai khoan');
					}


					
					
				})
			
		}

	});


</script> -->
    
</body>
</html>