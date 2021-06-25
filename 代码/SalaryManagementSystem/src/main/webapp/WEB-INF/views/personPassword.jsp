<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 吴彦祖2号
  Date: 2020/12/3
  Time: 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改密码</title>
    <%@ include file="/moban/css.jsp" %>
</head>
<body class="animsition">
<div class="page-wrapper">
    <!-- PAGE CONTAINER-->
    <%@ include file="/moban/sidebar.jsp" %>
    <div class="page-container">
        <%@ include file="/moban/header.jsp" %>
        <!-- MAIN CONTENT-->
        <div class="main-content">
            <div class="section__content section__content--p30">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card" style="width:40%;margin:0 auto;">
                                <div class="card-body">
                                    <div class="card-title">
                                        <h3 class="text-center title-2">修改密码
                                        </h3>
                                    </div>
                                    <hr>
                                    <c:if test="${error != null}">
                                        <div class="alert alert-danger" role="alert">
                                                ${error}
                                        </div>
                                    </c:if>
                                    <form action="updatePassword.do" method="post" novalidate="novalidate">
                                        <div class="form-group" hidden>
                                            <label for="inputID" class="control-label mb-1">工号</label>
                                            <input type="text" class="form-control" id="inputID" name="id"
                                                   value="${loginUser.id}" maxlength="20"
                                                   readonly/>
                                        </div>
<%--                                        <div class="form-group" hidden>--%>
<%--                                            <label for="inputAuthorization" class="control-label mb-1">权限</label>--%>
<%--                                            <select class="form-control" id="inputAuthorization" name="authorization">--%>
<%--                                                <option value="1" ${loginUser.authorization==1?'selected="selected"':''}>--%>
<%--                                                    管理员--%>
<%--                                                </option>--%>
<%--                                                <option value="0" ${loginUser.authorization==0?'selected="selected"':''}>--%>
<%--                                                    普通员工--%>
<%--                                                </option>--%>
<%--                                            </select>--%>
<%--                                        </div>--%>
                                        <div class="form-group">
                                            <label for="inputPassword" class="control-label mb-1">原密码</label>
                                            <input type="text" class="form-control" id="inputPassword" name="password"/>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputNewPassword" class="control-label mb-1">新密码</label>
                                            <input type="text" class="form-control" id="inputNewPassword"
                                                   name="newPassword"/>
                                        </div>
                                        <div>
                                            <button id="payment-button" type="submit"
                                                    class="btn btn-lg btn-info btn-block">
                                                <span id="payment-button-amount">确认</span>
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END MAIN CONTENT-->
        <!-- END PAGE CONTAINER-->
    </div>
</div>
<%@ include file="/moban/script.jsp" %>
</body>
</html>
