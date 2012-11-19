<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
String code=request.getParameter("code");
Connection conn=null;
Statement stmt=null;
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(
		"jdbc:mysql://localhost:3306/givinggift","root","tiger");
	
	if (conn==null)
	{
		throw new Exception("데이터베이스에 연결할 수 없습니다.");
		stmt=conn.createStatement();
		ResultSet rs=stmt.executeQuery(
				"select*from member where email = ' "+email+"';");
		if(!rs-next())
			throw new Exception(
					"(해당맴버("+email+")에 해당하는 데이터가 없습니다.");
					String password=rs.getString("password");
					String name=rs.getString("name");
					String address=rs.getString("address");
					String phone=rs.getString("phone");
					String birthdate=rs.getString("birthdate");
					String gender=rs.getString("gender");
					int type=rs.getInt("type");
					
					request.setAttribute("Password",password);
					request.setAttribute("Email",email);
					request.setAttribute("Address",address);
					request.setAttribute("Phone",phone);
					request.setAttribute("Birthdate",birthdate);
					request.setAttribute("Gender",gender);
					request.setAttribute("Type",type);
	
	ResultSet rs=stmt.executeQuery(
			"select*from class where id = ' "+id+"';");
	if(!rs-next())
		throw new Exception(
				"(해당맴버("+id+")에 해당하는 데이터가 없습니다.");
				String name=rs.getString("name");
				String content=rs.getString("content");
				String address=rs.getString("address");
				String interest=rs.getString("interest");
				String latitute=rs.getString("latitute");
				String longtitude=rs.getString("longtude");
				String teacher_id=rs.getString("teacher_id");
				int type=rs.getInt("number");
				
				request.setAttribute("Name",name);
				request.setAttribute("Content",content);
				request.setAttribute("Address",address);
				request.setAttribute("Interest",interest);
				request.setAttribute("Latitute",latitute);
				request.setAttribute("Longtitude",longtitude);
				request.setAttribute("Teacher_id",Teacher_id);
				request.setAttribute("Number",number);

	}
}



%> 
    
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="page-exit" content="BlendTans(Duration=3.0)">
	<meta http-equiv="page-Enter" content="BlendTans(Duration=3.0)">rdr
	<title> Giving Gift learning </title>
	<link href="css/teaching.css" rel="stylesheet" type="text/css">\
	<script src='js/jquery-1.8.2.min.js'></script>
	<script src="js/bootstrap.min.js"></script>
</head>
<body>
	<div id="top">
		<div id="top_container">
			<div id="top_left">
				<ul>
					<li><a href="index.html" id="top_logo">GivingGift</a></li>
					<li><a href="learning.html">Learn</a></li>
					<li><div id="create_class"><a href="#" id="create_click">Teach</a></div></li>
				</ul>
			</div>
			<div id="top_right">
				<ul>
					<li><a href="mypage.html"> My Page </a></li>
					<li><a href="board.html"> Help </a></li>
					<li><a href="#"> Log out </a></li>
				</ul>			
			</div>
		</div>
	</div>
	<div id="wrap">
		<div id="content">
			<div id ="aside">
				<aside id="category">
					<div id='cssmenu'>
						<ul>
						   <li class='has-sub'><a href='#'><span>인문</span></a>
						   		<ul>
						   			<li><a href="#"><span> 한국어 </span></a></li>
						   			<li><a href="#"><span> 영어 </span></a></li>
						   			<li><a href="#"><span> 불어 </span></a></li>
						   			<li><a href="#"><span> 프랑스어 </span></a></li>
						   			<li><a href="#"><span> 기타 </span></a></li>
						   		</ul>
						   </li>
						  </li>
						   <li class='has-sub'><a href='#'><span>사회</span></a>
								<ul>
						   			<li><a href="#"><span> 경제 </span></a></li>
						   			<li><a href="#"><span> 역사 </span></a></li>
						   			<li><a href="#"><span> 정치 </span></a></li>
						   		</ul>
						   </li>
						   <li class='has-sub'><a href='#'><span>과학</span></a>
						   		<ul>
						   			<li><a href="#"><span> 물리 </span></a></li>
						   			<li><a href="#"><span> 화학 </span></a></li>
						   			<li><a href="#"><span> 생물 </span></a></li>
						   			<li><a href="#"><span> 지구과학 </span></a></li>
						   		</ul>
						   	</li>
						   <li class='has-sub'><a href='#'><span>기술</span></a>
						   		<ul>
						   			<li><a href="#"><span> 프로그래밍 </span></a></li>
						   			<li><a href="#"><span> 공학 </span></a></li>
						   		</ul>
						   </li>
						   <li class='has-sub'><a href='#'><span>예체능</span></a>
						   		<ul>
						   			<li><a href="#"><span> 음악 </span></a></li>
						   			<li><a href="#"><span> 예술</span></a></li>
						   			<li><a href="#"><span> 체육 </span></a></li>
						   		</ul>
						   </li>
						</ul>
					</div>
				</aside>

				<aside id ="teaching_aside">
					

					<section class="buttons">
						<label for="first">추천강좌</label>
					</section>
					<div class="tab_item">
						<ul>
							<li class="item"><a href="#">
								<div class="thumbnail">
									<img src = "./images/piano.png"/>
								</div>
								<div class="description">
									<strong> piano Gift </strong>
									<p> 2012-11-05</p>
								</div>
							</a></li>
							<li class="item"><a href="#">
								<div class="thumbnail">
									<img src = "./images/book.png"/>
								</div>
								<div class="description">
									<strong> Book Gift </strong>
									<p> 2012-11-06</p>
								</div>
							</a></li>
							<li class="item"><a href="#">
								<div class="thumbnail">
									<img src = "./images/science.png"/>
								</div>
								<div class="description">
									<strong> Science Gift </strong>
									<p> 2012-11-07</p>
								</div>
							</a></li>
						</ul>
					</div>
				<aside id ="volunteer">
					<section class="buttons">
						<label for="first">추천 봉사자</label>
					</section>
					<div class="tab_item">
						<ul>
							<li class="item"><a href="#">
								<div class="thumbnail">
									<img src = "./images/piano.png"/>
								</div>
								<div class="description">
									<strong> piano Gift </strong>
									<p> 2012-11-05</p>
								</div>
							</a></li>
							<li class="item"><a href="#">
								<div class="thumbnail">
									<img src = "./images/book.png"/>
								</div>
								<div class="description">
									<strong> Book Gift </strong>
									<p> 2012-11-06</p>
								</div>
							</a></li>
							<li class="item"><a href="#">
								<div class="thumbnail">
									<img src = "./images/science.png"/>
								</div>
								<div class="description">
									<strong> Science Gift </strong>
									<p> 2012-11-07</p>
								</div>
							</a></li>
						</ul>
					</div>
				</aside>
			</div>

			<section id="teaching_section1">
				<article class="teaching_article1">
					<div id ="left"><a href="learning_detail.html">

						<img src="./images/human.png"></img>

					</div>
					<h1>학생 정보</h1>
					이름:홍택민</br>
					나이:22살</br>
					직업:학생</br>
					신청중인강좌:</br>
					사는지역:서울</br>
					취미:수학</br>
					etc:...</br>
					</a>
				</article>
				
			</section>
			<section id="teaching_section2">

				<article class="teaching_article2">
				<h1>학생 정보</h1></br>
					이름:홍택민</br>
					나이:22살</br>
					직업:학생</br>
					신청중인강좌:</br>
					사는지역:서울</br>
					취미:수학</br>
					etc:...</br>
					이름:홍택민</br>
					나이:22살</br>
					직업:학생</br>
					신청중인강좌:</br>
					사는지역:서울</br>
					취미:수학</br>
					etc:...</br>
					이름:홍택민</br>
					나이:22살</br>
					직업:학생</br>
					신청중인강좌:</br>
					사는지역:서울</br>
					취미:수학</br>
					etc:...</br>
				</article>
			</section>
			<section id="teaching_section2">
				<article class="teaching_article2">
				<h1>학생 정보</h1></br>
					이름:홍택민</br>
					나이:22살</br>
					직업:학생</br>
					신청중인강좌:</br>
					사는지역:서울</br>
					취미:수학</br>
					etc:...</br>
					이름:홍택민</br>
					나이:22살</br>
					직업:학생</br>
					신청중인강좌:</br>
					사는지역:서울</br>
					취미:수학</br>
					etc:...</br>
					이름:홍택민</br>
					나이:22살</br>
					직업:학생</br>
					신청중인강좌:</br>
					사는지역:서울</br>
					취미:수학</br>
					etc:...</br>

				</article>
			</section>
			<section id="teaching_section2">

				<article class="teaching_article2">
				<h1>학생 정보</h1></br>
					이름:홍택민</br>
					나이:22살</br>
					직업:학생</br>
					신청중인강좌:</br>
					사는지역:서울</br>
					취미:수학</br>
					etc:...</br>
					이름:홍택민</br>
					나이:22살</br>
					직업:학생</br>
					신청중인강좌:</br>
					사는지역:서울</br>
					취미:수학</br>
					etc:...</br>
					이름:홍택민</br>
					나이:22살</br>
					직업:학생</br>
					신청중인강좌:</br>
					사는지역:서울</br>
					취미:수학</br>
					etc:...</br>
				</article>
			</section>
		</div>
		<footer id="learning_footer">
			<h3> 사이트맵 | 고객센터</h3>
			<address> CopyWrite c GivingGift All rights reserved | 2012.11.06 | club.cyworld.com/givinggift</address>
		</footer>
	</div>
</body>
</html>
<script type="text/javascript">

$(function(){
	$(document).ready(function() {
		$(window).scroll(function() {
			var scrollHeight=$(window).scrollTop()+ $(window).height();
			var documentHeight = $(document).height();

			if(scrollHeight + 200 >= documentHeight){
				for(var i=0; i<10; i++){
					$('<h1>Infinity Scroll<h1>').appendTo('body');
				}
			}
		});
	});

	//mouse event
	$("article.teaching_article1").mouseover(function() {
		$(this).css("background", "#C4DEFF");
		$(this).css("color", "#ffffff");
	});

	$("article.teaching_article1").mouseout(function() {
		$(this).css("background", "#ffffff");
	});
	$("article.teaching_article2").mouseover(function() {
		$(this).css("background", "#ffffff");
	});
	$("article.teaching_article3").mouseout(function() {
		$(this).css("background", "#ffffff");
	});

});
</script>