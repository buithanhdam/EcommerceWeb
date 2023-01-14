<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html >
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="icon" href="./user/views/assets/images/favicon.png" type="image/gif" sizes="20x20">
    <title>TravelLab - Khám phá đất nước của chúng ta</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    <style>
        body{
            background-color: black;
        }
.background{
    background-color: black;
    height: 100%;
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;

}
.inner{
    width: 90%;
    height: 700px;
    display: flex;
    gap: 2rem;
    justify-content: center;
    align-items: center;
    
}
.inner-item{
    width: 500px;
    height: 500px;
   
    display: flex;
    justify-content: center;
    align-items: center;
}
.inner-item a{text-decoration: none;}
.circle{
    background-color: #009b77;
    height: 200px;
    width: 200px;
    border-radius: 50%;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    gap: 1rem;
}
.circle i{
    font-size: 60px;
    color: white;
   
}
.circle span{
    font-size: 1.5rem;
    color: white;
    text-decoration: none;
}

    </style>

</head>
<body>
	
<div class="background" >
	<div class="inner" >
        <div class="inner-item">
            <a href="/projectWeb_war/admin/Index">
                <div class="circle">
                    <i class="fa-solid fa-user"></i>
                  <span>Đến trang quản trị</span>
                </div>
            </a>
            
        </div>
        <div class="inner-item">
            <a href="/projectWeb_war/user/views/home">
                <div class="circle">
                    <i class="fa-solid fa-plane"></i>
                    <span>Đến trang khách</span>
                </div>
            </a>
           
        </div>

    </div>
	
</div>


    
</body>
</html>