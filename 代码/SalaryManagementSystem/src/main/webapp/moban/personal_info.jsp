<%@ page import="com.my.entity.Department" %><%--
  Created by IntelliJ IDEA.
  User: 吴彦祖2号
  Date: 2020/7/9
  Time: 17:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="page_var.jsp" %>
<html>
<head>
    <title>个人信息</title>
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
                                    <div class="card-title">
                                        <h3 class="text-center title-2">基本信息
                                        </h3>
                                    </div>
                                    <hr>
                                    <form action="UserServlet" method="post" novalidate="novalidate">
                                        <div class="form-group" hidden>
                                            <label class="control-label mb-1">action</label>
                                            <input name="action" value="UpdateEmployee"/>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputID" class="control-label mb-1">工号</label>
                                            <input type="text" class="form-control" id="inputID" name="id"
                                                   value="<% out.println(login_employee.getId()); %>" maxlength="10"
                                                   readonly/>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputName" class="control-label mb-1">姓名</label>
                                            <input type="text" class="form-control" id="inputName" name="name"
                                                   value="<% out.println(login_employee.getName()); %>" maxlength="10"/>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputSex" class="control-label mb-1">性别</label>

                                            <select class="form-control" id="inputSex" name="sex">
                                                <option value="男" <%if (login_employee.getSex().equals("男")) out.print("selected");%>>男
                                                </option>
                                                <option value="女" <%if (login_employee.getSex().equals("女")) out.print("selected");%>>女
                                                </option>
                                            </select>

                                        </div>
                                        <div class="form-group">
                                            <label for="inputAge" class="control-label mb-1">年龄</label>

                                            <input type="text" class="form-control" id="inputAge" name="age"
                                                   value="<% out.println(login_employee.getAge()); %>" maxlength="2"
                                                   oninput="value=value.replace(/[^\d]/g,'')"/>

                                        </div>
                                        <div class="form-group">
                                            <label for="inputDepartment" class="control-label mb-1">部门</label>
                                            <select class="form-control" id="inputDepartment" name="department">
                                                <option></option>
                                                <%
                                                    for (Department department : adminService.getAllDepartment()) {
                                                        if (department.getDepName().equals(login_employee.getDepartment())) {
                                                %>
                                                <option value="<%=department.getDepName()%>"
                                                        selected><%=department.getDepName()%>
                                                </option>
                                                <%} else {%>
                                                <option value="<%=department.getDepName()%>"><%=department.getDepName()%>
                                                </option>
                                                <%
                                                        }
                                                    }
                                                %>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputPhone" class="control-label mb-1">电话号码</label>

                                            <input type="text" class="form-control" id="inputPhone" name="phone"
                                                   value="<% out.println(login_employee.getPhone()); %>" maxlength="11"
                                                   oninput="value=value.replace(/[^\d]/g,'')"/>

                                        </div>
                                        <div>
                                            <button id="payment-button" type="submit"
                                                    class="btn btn-lg btn-info btn-block">
                                                <span id="payment-button-amount">保存修改</span>
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
