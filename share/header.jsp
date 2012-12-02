<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<div id="top">
	<div id="top_container">
		<div id="top_left">
			<ul>
				<li><a href="index.jsp" id="top_logo">GivingGift</a></li>
				<li><a href="Learning.jsp">Learn</a></li>
				<li><div id="create_class"><a href="teaching.jsp" id="create_click">Teach</a></div></li>
			</ul>
		</div>
		<div id="top_right">
			<ul>
				<c:choose>
					<c:when test="${sessionScope.SID == null}">
						<li><a href="#"> Log In </a></li>
						<li><a href="#.jsp"> Join </a></li>
					</c:when>
					<c:otherwise>
						<li><a href="mypage.jsp"> My Page </a></li>
						<li><a href="logout_page.jsp"> Log out </a></li>
					</c:otherwise>
				</c:choose>
				<li><a href="board.jsp"> Help </a></li>
			</ul>			
		</div>
	</div>
</div>