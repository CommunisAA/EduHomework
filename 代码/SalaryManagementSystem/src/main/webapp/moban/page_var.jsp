<%@ page import="com.my.util.CookieUtil" %>
<%@ page import="com.my.service.UserService" %>
<%@ page import="com.my.service.AdminService" %>
<%@ page import="com.my.entity.Employee" %>
<%--
  Created by IntelliJ IDEA.
  User: 吴彦祖2号
  Date: 2020/7/9
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    AdminService adminService = new AdminService();
    UserService userService = new UserService();
    CookieUtil cookieUtil = new CookieUtil(request.getCookies());
    Employee login_employee = userService.getEmployeeById(cookieUtil.getName("id"));
%>
