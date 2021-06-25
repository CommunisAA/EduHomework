<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 吴彦祖2号
  Date: 2020/12/2
  Time: 21:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- Title Page-->
    <title>登录</title>

    <%@ include file="/moban/css.jsp" %>

</head>

<body class="animsition">
<div class="page-wrapper">
    <div class="page-content--bge5">
        <div class="container">
            <div class="login-wrap">
                <div class="login-content">
                    <div class="login-logo">
                        <a href="#">
                            <img src="/moban/images/icon/logo.png" alt="MyAdmin">
                        </a>
                    </div>
                    <div class="login-form">
                        <c:if test="${error != null}">
                            <div class="alert alert-danger" role="alert">
                                    ${error}
                            </div>
                        </c:if>
                        <form action="/sms/all/login.do" method="post">
                            <div class="form-group">
                                <label>ID</label>
                                <input class="au-input au-input--full" type="text" name="id" maxlength="20"
                                       placeholder="ID" oninput="value=value.replace(/[^\d]/g,'')">
                            </div>
                            <div class="form-group">
                                <label>密码</label>
                                <input class="au-input au-input--full" type="password" name="password" maxlength="20"
                                       placeholder="密码">
                            </div>
                            <button class="au-btn au-btn--block au-btn--green m-b-20" type="submit">登录</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<%@ include file="/moban/script.jsp" %>

</body>

</html>
