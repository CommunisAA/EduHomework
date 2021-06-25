<%--
  Created by IntelliJ IDEA.
  User: 吴彦祖2号
  Date: 2020/7/11
  Time: 20:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- MENU SIDEBAR-->
<aside class="menu-sidebar d-none d-lg-block">
    <div class="logo">
        <a href="index.jsp">
            <img src="images/icon/logo.png" alt="Cool Admin"/>
        </a>
    </div>
    <div class="menu-sidebar__content js-scrollbar1">
        <nav class="navbar-sidebar">
            <ul class="list-unstyled navbar__list">
                <li id = "index">
                    <a href="index.jsp">
                        <i class="fas fa-desktop"></i>首页</a>
                </li>
                <li id = "personal_performance">
                    <a href="personal_performance.jsp">
                        <i class="fas fa-check-square"></i>录入</a>
                </li>
                <li id = "personal_salary">
                    <a href="personal_salary.jsp">
                        <i class="fas fa-chart-bar"></i>个人工资</a>
                </li>
                <li id = "department_salary">
                    <a href="department_salary.jsp">
                        <i class="fas fa-table"></i>部门工资</a>
                </li>
                <li id = "department_employee">
                    <a href="department_employee.jsp">
                        <i class="fas fa-list-ul"></i>部门员工</a>
                </li>
            </ul>
        </nav>
    </div>
</aside>
<!-- END MENU SIDEBAR-->