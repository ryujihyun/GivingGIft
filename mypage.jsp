<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
	<title>Giving Gift Mypage</title>
	<link href="stylesheets/mypageEdit.css" rel="stylesheet" type="text/css">
	<script src='js/jquery-1.8.2.min.js'></script>
</head>
<body>
	<jsp:include page="share/header.jsp"></jsp:include>
	<div id="header_p">
		<div>
			<h1>My page</h1>
		</div>
	</div>
	<div id="header">
		<div id="header_content">
			<h2>안녕하세요 ??님</h2>
			<a href="#">회원 정보 수정</a>
		</div>	
	</div>
	<div id="content">
		<div id="present">
			<h1>개설된 강좌</h1>
			<div class="present_tab">
				<ul>
					<li><a href="#"><span>내가 개설한 강좌</span></a>
						<div>
							<ul>
								<div>
									내가 개설한 강좌 목록
								</div>
							</ul>
						</div>
					</li>
					<li><a href="#"><span>내가 신청한 강좌</span></a>
						<div>
							내가 신청한 강좌 목록 
						</div>
					</li>
				</ul>
			</div>
		</div>
		<div id="past">
			<h1>완료된 강좌</h1>
			<div class="past_tab">
				<ul>
					<li><a href="#"><span>내가 개설한 강좌</span></a>
						<div>
							<ul>
								<div>
									내가 개설한 강좌 목록
								</div>
							</ul>
						</div>
					</li>
					<li><a href="#"><span>내가 신청한 강좌</span></a>
						<div>
							내가 신청한 강좌 목록 
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<jsp:include page="share/footer.jsp"></jsp:include>
</body>
</html>

<script type="text/javascript">

$(function() {
	var tab=$(".present_tab");
	tab.find('li>a').click(function() {
		$(".present_tab>ul>li").removeClass('selected');
		$(".present_tab>ul>li>div").hide();
		$(this).parent().addClass('selected')
		$(this).parent().find("div").show();
	});
	$(".present_tab li>a:first").click();
	
	var tab=$(".past_tab");
	tab.find('li>a').click(function() {
		$(".past_tab>ul>li").removeClass('selected');
		$(".past_tab>ul>li>div").hide();
		$(this).parent().addClass('selected')
		$(this).parent().find("div").show();
	});
	$(".past_tab li>a:first").click();
});
</script>