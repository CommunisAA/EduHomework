<%@ page import="com.my.entity.Salary" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.my.entity.Performance" %><%--
  Created by IntelliJ IDEA.
  User: 吴彦祖2号
  Date: 2020/7/9
  Time: 16:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="page_var.jsp" %>
<%
    ArrayList<Salary> SalaryList = userService.getSalaryById(login_employee.getId());
    Iterator<Salary> SalaryIter = SalaryList.iterator();
%>
<html>
<head>
    <title>个人工资</title>
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
                            <h3 class="text-center title-5 m-b-35">
                                工 资 表
                            </h3>
                            <div class="table-responsive table--no-card m-b-30">
                                <table class="table table-borderless table-striped">
                                    <thead>
                                    <tr>
                                        <th>
                                            底薪
                                        </th>
                                        <th>
                                            加班
                                        </th>
                                        <th>
                                            提成
                                        </th>
                                        <th>
                                            奖金
                                        </th>
                                        <th>
                                            请假
                                        </th>
                                        <th>
                                            迟到
                                        </th>
                                        <th>
                                            旷工
                                        </th>
                                        <th>
                                            总计
                                        </th>
                                        <th>
                                            时间
                                        </th>
                                        <th>
                                            详情
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    <%while (SalaryIter.hasNext()) {%>
                                    <%
                                        Salary salary = SalaryIter.next();
                                        Performance performance = userService.getPerformanceById(salary.getId(), salary.getDate());
                                        if (performance == null) {
                                            performance = new Performance(login_employee.getId());
                                        }
                                    %>
                                    <tr>
                                        <td><%=salary.getSalBasic()%>
                                        </td>
                                        <td><%=salary.getSalOvertime()%>
                                        </td>
                                        <td><%=salary.getSalCommission()%>
                                        </td>
                                        <td><%=salary.getSalBonus()%>
                                        </td>
                                        <td><%=salary.getSalLeave()%>
                                        </td>
                                        <td><%=salary.getSalLate()%>
                                        </td>
                                        <td><%=salary.getSalAbsent()%>
                                        </td>
                                        <td><%=salary.getSalTotal()%>
                                        </td>
                                        <td><%=salary.getDate()%>
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-outline-success btn-sm"
                                                    data-html="true" data-container="body" data-toggle="popover"
                                                    data-placement="left"
                                                    data-content="请假: <%=performance.getPerLeave()%><br>迟到: <%=performance.getPerLate()%><br>旷工: <%=performance.getPerAbsent()%><br>周末加班: <%=performance.getPerWeekendOvertime()%><br>节日加班: <%=performance.getPerHolidayOvertime()%>">
                                                详情
                                            </button>
                                        </td>
                                    </tr>
                                    <%}%>
                                    </tbody>
                                </table>
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
    $("#personal_salary").addClass("active");

    $(function () {
        $("[data-toggle='popover']").popover()
    });

</script>
</body>
</html>
<!-- end document-->
