<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<TITLE>회원 정보 수정</TITLE>
</head>

<BODY>
<FORM ACTION =Updater.jsp METHOD=POST>
이메일:<INPUT TYPE = TEXT NAME=email SIZE=5
VALUE='${name }' READONLY =TREU><BR>
이름:<INPUT TYPE = TEXT NAME=name SIZE=5
VALUE='${name }' READONLY =TREU><BR>
주소:<INPUT TYPE = TEXT NAME=address SIZE=50
VALUE='${address }' READONLY =TREU><BR>

폰번호:<INPUT TYPE = TEXT NAME=phone SIZE=30
VALUE='${phone }' READONLY =TREU><BR>

<INPUT TYPE=SUBMIT VALUE='수정'>
</FORM>



</BODY>
</HTML>
