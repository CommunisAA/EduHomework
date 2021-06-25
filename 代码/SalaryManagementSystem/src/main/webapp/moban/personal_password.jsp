<%--
  Created by IntelliJ IDEA.
  User: 吴彦祖2号
  Date: 2020/7/9
  Time: 17:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="page_var.jsp" %>
<%
    String msg = "msg";
    if (request.getAttribute("msg") != null)
        msg = (String) request.getAttribute("msg");
%>
<html>
<head>
    <title>修改密码</title>
    <%@ include file="css.jsp" %>
</head>
<body class="animsition">
<div class="page-wrapper">
    <%if (adminService.getUserById(login_employee.getId()).getUserRight() == 0) {%>
    <%@ include file="sidebar_admin.jsp" %>
    <%}%>
    <%if (adminService.getUserById(login_employee.getId()).getUserRight() == 5) {%>
    <%@ include file="sidebar_manager.jsp" %>
    <%}%>
    <%if (adminService.getUserById(login_employee.getId()).getUserRight() == 9) {%>
    <%@ include file="sidebar_personal.jsp" %>
    <%}%>
    <!-- PAGE CONTAINER-->
    <div class="page-container">
        <%@ include file="header.jsp" %>
        <!-- MAIN CONTENT-->
        <div class="main-content">
            <div class="section__content section__content--p30">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card" style="width:40%;margin:0 auto;">
                                <div class="card-body">
                                    <%if (msg.equals("true")) {%>
                                    <div class="alert alert-success" role="alert">
                                        修改成功!
                                    </div>
                                    <%}%>
                                    <%if (msg.equals("false")) {%>
                                    <div class="alert alert-danger" role="alert">
                                        密码错误!
                                    </div>
                                    <%}%>
                                    <div class="card-title">
                                        <h3 class="text-center title-2">修改密码
                                        </h3>
                                    </div>
                                    <hr>
                                    <form action="UserServlet" method="post" novalidate="novalidate">
                                        <div class="form-group" hidden>
                                            <label class="control-label mb-1">action</label>
                                            <input name="action" value="UpdatePassword"/>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputOld" class="col-sm-4 control-label">原密码</label>

                                            <input type="password" class="form-control" id="inputOld"
                                                   name="old_password" maxlength="20"/>

                                        </div>
                                        <div class="form-group">
                                            <label for="inputNew" class="col-sm-4 control-label">新密码</label>

                                            <input type="password" class="form-control" id="inputNew"
                                                   name="new_password" maxlength="20"/>

                                        </div>
                                        <div>
                                            <button id="payment-button" type="submit"
                                                    class="btn btn-lg btn-info btn-block">
                                                <span id="payment-button-amount">确认修改</span>
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
<%@ include file="script.jsp" %>
</body>
</html>
<!-- end document-->
