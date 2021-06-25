<%@ page import="com.my.entity.Salary" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%--
  Created by IntelliJ IDEA.
  User: 吴彦祖2号
  Date: 2020/7/9
  Time: 17:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="page_var.jsp" %>
<%
    ArrayList<Salary> SalaryList = adminService.getSalaryByManager(login_employee.getId());
    Iterator<Salary> SalaryIter = SalaryList.iterator();
%>
<html>
<head>
    <title>部门工资</title>
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
                                部 门 工 资 表
                            </h3>
                            <div class="table-responsive table--no-card m-b-30">
                                <table class="table table-borderless table-striped" id='example-table'>
                                    <thead>
                                    <tr>
                                        <th data-override="id">
                                            ID
                                        </th>
                                        <th data-override="name">
                                            姓名
                                        </th>
                                        <th data-override="salBasic">
                                            底薪
                                        </th>
                                        <th data-override="salOvertime">
                                            加班
                                        </th>
                                        <th data-override="salCommission">
                                            提成
                                        </th>
                                        <th data-override="salBonus">
                                            奖金
                                        </th>
                                        <th data-override="salLeave">
                                            请假
                                        </th>
                                        <th data-override="salLate">
                                            迟到
                                        </th>
                                        <th data-override="salAbsent">
                                            旷工
                                        </th>
                                        <th data-override="salTotal">
                                            总计
                                        </th>
                                        <th data-override="date">
                                            时间
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%while (SalaryIter.hasNext()) {%>
                                    <%
                                        Salary salary = SalaryIter.next();
                                    %>
                                    <tr>
                                        <td><%=salary.getId()%>
                                        </td>
                                        <td><%=adminService.getEmployeeById(salary.getId()).getName()%>
                                        </td>
                                        <td><%=salary.getSalBasic()%>
                                        </td>
                                        <td><%=salary.getSalOvertime()%>
                                        </td>
                                        <td contentEditable="true"><%=salary.getSalCommission()%>
                                        </td>
                                        <td contentEditable="true"><%=salary.getSalBonus()%>
                                        </td>
                                        <td contentEditable="true"><%=salary.getSalLeave()%>
                                        </td>
                                        <td contentEditable="true"><%=salary.getSalLate()%>
                                        </td>
                                        <td contentEditable="true"><%=salary.getSalAbsent()%>
                                        </td>
                                        <td><%=salary.getSalTotal()%>
                                        </td>
                                        <td>
                                            <%
                                                java.sql.Date date = new java.sql.Date(System.currentTimeMillis());
                                                date.setDate(1);
                                                out.print(date);
                                            %>
                                        </td>
                                    </tr>
                                    <%}%>
                                    </tbody>
                                </table>
                            </div>

                            <div style="text-align:center">
                                <%if (adminService.getLatestSalaryById(login_employee.getId()).getDate().getMonth() == new java.sql.Date(System.currentTimeMillis()).getMonth()) {%>
                                <button type="button" class="btn btn-outline-secondary" disabled="disabled">已发放</button>
                                <%} else {%>
                                <button type="button" class="btn btn-outline-success" id="convert-table">申请发放</button>
                                <%}%>
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
<script src="js/jquery.tabletojson.min.js"></script>
<script>
    $("#department_salary").addClass("active");

    $('#convert-table').click(function () {
        var table = $('#example-table').tableToJSON();
        $.ajax({
            url: 'AdminServlet',
            type: 'post',
            data: {
                "action": "UpdateSalaryReview",
                "salary_json": JSON.stringify(table)
            },
            dataType: 'text',
            success: function (data) {
                console.log(data);
                alert("申请成功");
            }
        })
        console.log(table);
        console.log(JSON.stringify(table));
        //alert(JSON.stringify(table));
    });

</script>
</body>
</html>
<!-- end document-->