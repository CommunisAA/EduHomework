<%@ page import="com.my.entity.Performance" %>
<%@ page import="java.sql.Date" %><%--
  Created by IntelliJ IDEA.
  User: 吴彦祖2号
  Date: 2020/7/9
  Time: 16:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="page_var.jsp" %>
<%
    Performance login_performance = userService.getLatestPerformanceById(login_employee.getId());
    Date date = new Date(System.currentTimeMillis());
    if(login_performance.getDate().getMonth() != date.getMonth()) {
        login_performance = new Performance(login_employee.getId());
    }
%>
<html>
<head>
    <title>录入</title>
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
                                        <h3 class="text-center title-2"><%=1900 + date.getYear() + "年" + (date.getMonth() + 1) + "月"%>
                                        </h3>
                                    </div>
                                    <hr>
                                    <form action="UserServlet" method="post" novalidate="novalidate">
                                        <div class="form-group" hidden>
                                            <label class="control-label mb-1">action</label>
                                            <input name="action" value="UpdatePerformance"/>
                                        </div>
                                        <div class="form-group">
                                            <label for="input1" class="control-label mb-1">请假次数</label>

                                            <input type="text" class="form-control" id="input1" name="perLeave"
                                                   value="<%=login_performance.getPerLeave()%>" maxlength="2"
                                                   oninput="value=value.replace(/[^\d]/g,'')"/>

                                        </div>
                                        <div class="form-group">
                                            <label for="input2" class="control-label mb-1">迟到次数</label>

                                            <input type="text" class="form-control" id="input2" name="perLate"
                                                   value="<%=login_performance.getPerLate()%>" maxlength="2"
                                                   oninput="value=value.replace(/[^\d]/g,'')"/>

                                        </div>
                                        <div class="form-group">
                                            <label for="input3" class="control-label mb-1">旷工次数</label>

                                            <input type="text" class="form-control" id="input3" name="perAbsent"
                                                   value="<%=login_performance.getPerAbsent()%>" maxlength="2"
                                                   oninput="value=value.replace(/[^\d]/g,'')"/>

                                        </div>
                                        <div class="form-group">
                                            <label for="input4" class="control-label mb-1">周末加班</label>

                                            <input type="text" class="form-control" id="input4"
                                                   name="perWeekendOvertime"
                                                   value="<%=login_performance.getPerWeekendOvertime()%>" maxlength="2"
                                                   oninput="value=value.replace(/[^\d]/g,'')"/>

                                        </div>
                                        <div class="form-group">
                                            <label for="input5" class="control-label mb-1">节日加班</label>

                                            <input type="text" class="form-control" id="input5"
                                                   name="perHolidayOvertime"
                                                   value="<%=login_performance.getPerHolidayOvertime()%>" maxlength="2"
                                                   oninput="value=value.replace(/[^\d]/g,'')"/>

                                        </div>

                                        <div>
                                            <button id="payment-button" type="submit"
                                                    class="btn btn-lg btn-info btn-block">
                                                <span id="payment-button-amount">保存</span>
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
<script>
    $("#personal_performance").addClass("active");
</script>
</body>
</html>
<!-- end document-->

