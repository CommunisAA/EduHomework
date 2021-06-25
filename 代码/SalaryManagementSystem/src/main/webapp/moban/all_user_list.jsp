<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.my.entity.User" %>
<%@ page import="com.my.entity.Department" %><%--
  Created by IntelliJ IDEA.
  User: 吴彦祖2号
  Date: 2020/7/9
  Time: 20:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="page_var.jsp" %>
<%
    //--------------------------------------------------检查page---------------------------------------------------------
    int IntPage = 1;
    String StringPage = "1";

    if (request.getParameter("page") != null) {
        StringPage = request.getParameter("page");
        try {
            IntPage = Integer.parseInt(StringPage);
        } catch (NumberFormatException e) {
            StringPage = "1";
            e.printStackTrace();
        }
    }

    if (IntPage < 0) {
        IntPage = 1;
        StringPage = "1";
    }

    //-------------------------------------------------------------------------------------------------------------------

    ArrayList<Employee> EmployeeList = null;
    ArrayList<User> UserList = new ArrayList<User>();

    //--------------------------------------------------检查search-------------------------------------------------------

    Boolean isSearch = true;
    if (request.getParameter("search") != null) {
        //System.out.println(request.getParameter("search"));
        EmployeeList = adminService.find(request.getParameter("search"));
        for (Employee employee : EmployeeList) {
            UserList.add(adminService.getUserById(employee.getId()));
        }
    } else {
        UserList = adminService.getUserPage("4", StringPage);
        isSearch = false;
    }

    //------------------------------------------------------------------------------------------------------------------

    Iterator<User> UserIter = UserList.iterator();
%>
<html>
<head>
    <title>全体用户</title>
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
                            <!-- USER DATA-->
                            <div class="user-data m-b-30">
                                <h3 class="text-center title-5 m-b-35">
                                    全 体 用 户 表
                                </h3>
                                <div class="filters m-b-45">
                                    <div class="rs-select2--dark rs-select2--md m-r-10 rs-select2--border">
                                        <div class="rs-select2--light rs-select2--md">
                                        </div>
                                    </div>
                                    <div class="rs-select2--dark rs-select2--sm rs-select2--border">
                                        <form class="form-header" action="all_user_list.jsp" method="POST">
                                            <input class="au-input au-input--xl" type="text" name="search"
                                                   style="border-radius:3px;" placeholder="Search"/>
                                            <button class="au-btn--submit" type="submit" style="border-radius:3px;">
                                                <i class="zmdi zmdi-search"></i>
                                            </button>
                                        </form>
                                    </div>
                                </div>
                                <div class="table-responsive table-data">
                                    <table class="table">
                                        <thead>
                                        <tr>
                                            <td>
                                                ID
                                            </td>
                                            <td>
                                                姓名
                                            </td>
                                            <td>
                                                权限
                                            </td>
                                            <td>
                                                状态
                                            </td>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <%while (UserIter.hasNext()) {%>
                                        <%
                                            User user = UserIter.next();
                                        %>
                                        <tr>
                                            <td><%=user.getId()%>
                                            </td>
                                            <td><%=adminService.getEmployeeById(user.getId()).getName()%>
                                            </td>
                                            <td>
                                                <div class="rs-select2--trans rs-select2--sm">
                                                    <select class="js-select2" name="property" id="level">
                                                        <%if (user.getUserRight() == 0) {%>
                                                        <option value="0" selected="selected">管理员</option>
                                                        <%} else {%>
                                                        <option value="0">管理员</option>
                                                        <%}%>

                                                        <%if (user.getUserRight() == 5) {%>
                                                        <option value="5" selected="selected">部门主管</option>
                                                        <%} else {%>
                                                        <option value="5">部门主管</option>
                                                        <%}%>

                                                        <%if (user.getUserRight() == 9) {%>
                                                        <option value="9" selected="selected">普通员工</option>
                                                        <%} else {%>
                                                        <option value="9">普通员工</option>
                                                        <%}%>
                                                    </select>
                                                    <div class="dropDownSelect2"></div>
                                                </div>

                                            </td>
                                            <td>
                                                <label class="switch switch-3d switch-success mr-3">
                                                    <input type="checkbox" id="state"
                                                           class="switch-input" <%if(user.isAvailable()) out.print("checked=\"true\"");%>>
                                                    <span class="switch-label"></span>
                                                    <span class="switch-handle"></span>
                                                </label>
                                            </td>
                                        </tr>
                                        <%}%>
                                        </tbody>
                                    </table>
                                </div>
                                <%if (!isSearch) {%>
                                <div class="card-body" style="text-align:center;">
                                    <%if (IntPage > 1) {%>
                                    <button type="button" class="btn btn-outline-primary"><a
                                            href="all_user_list.jsp?page=<%=IntPage-1%>">上一页</a></button>
                                    <%}%>
                                    <%if (15 * IntPage >= UserList.size()) {%>
                                    <button type="button" class="btn btn-outline-info"><a
                                            href="all_user_list.jsp?page=<%=IntPage+1%>">下一页</a></button>
                                    <%}%>
                                </div>
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
<script>
    $("#all_user_list").addClass("active");


    $("[id = state]").change(function () {
        console.log($(this).is(':checked'));
        console.log($(this).parent().parent().parent().children()[0].innerText);
        $.ajax({
            url: 'AdminServlet',
            type: 'post',
            data: {
                "action": "UpdateUser",
                "id": $(this).parent().parent().parent().children()[0].innerText,
                "available": $(this).is(':checked')
            },
            dataType: 'text',
            success: function (data) {
                console.log(data);
                //alert(data);
            }
        })
    });

    $("[id = level]").change(function () {
        console.log($(this).val());
        console.log($(this).parent().parent().parent().children()[0].innerText);
        $.ajax({
            url: 'AdminServlet',
            type: 'post',
            data: {
                "action": "UpdateUser",
                "id": $(this).parent().parent().parent().children()[0].innerText,
                "level": $(this).val()
            },
            dataType: 'text',
            success: function (data) {
                console.log(data);
                //alert(data);
            }
        })
    });

</script>
</body>
</html>
<!-- end document-->
