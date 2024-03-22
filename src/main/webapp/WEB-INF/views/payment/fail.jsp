<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.parser.JSONParser" %>
<%@ page import="org.json.simple.parser.ParseException" %>


<%
 String message = request.getParameter("message");
  String code = request.getParameter("code");
%>

<!DOCTYPE html>

    <body>
        <div class="result wrapper">
            <div class="box_section">            
                <h2 style="padding: 20px 0px 10px 0px">
                    <img
                    width="25px"
                    src="https://static.toss.im/3d-emojis/u1F6A8-apng.png"
                    />
                    결제 실패
                </h2>
                <span>code = <%= code %></span>
                <p>message = <%= message %></p>
                
                <div class="result wrapper">
                    <button class="button" onclick="location.href='https://docs.tosspayments.com/guides/payment-widget/integration';"
                    style="margin-top:30px; ">연동 문서</button>
                    <button class="button" onclick="location.href='https://discord.gg/A4fRFXQhRu';"
                    style="margin-top:30px;background-color: #e8f3ff;color:#1b64da ">실시간 문의</button>
                  </div>                 
            </div>
        </div>
 