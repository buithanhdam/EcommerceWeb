<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
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
	 <%String error = request.getAttribute("error")==null?null:(String) request.getAttribute("error");%>
	<div class="form-container ">
		<form action="/projectWeb_war/user/views/forgotPassword" method="POST" class="forgotpassowrd">
			<h1>Quên mật khẩu</h1>
			
			
			<!--
				sign in form submit
			-->

			<div class="field">
				
				<input name="email" type="email" placeholder="Email" required/>
				<span style="font-size: 1rem;color: red"><%=error==null?"":error%></span>
				<span></span>
			</div>
			<!-- <div class="field">
				<input name="password" type="password" placeholder="Password" />
				<span></span>
			</div> -->
			
			<button type="submit" class="qmk">Tiếp tục</button>
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

<script src="./assets/js/signJS.js"></script>
<script>
	// const qmk = document.querySelector('.qmk');
	// qmk.onclick = (e) => {
	// 	e.preventDefault();
	// 	window.location.href = "forgotPassword-validate.jsp"
	// }
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