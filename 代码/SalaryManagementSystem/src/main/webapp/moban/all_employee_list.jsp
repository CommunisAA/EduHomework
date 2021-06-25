<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.my.entity.Department" %><%--
  Created by IntelliJ IDEA.
  User: 吴彦祖2号
  Date: 2020/7/9
  Time: 19:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="page_var.jsp" %>
<%
    //--------------------------------------------------检查page--------------------------------------------------------
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

    //-----------------------------------------------------------------------------------------------------------------

    ArrayList<Employee> EmployeeList = null;

//    if (request.getAttribute("EmployeeList") != null) {
//        EmployeeList = (ArrayList<Employee>) request.getAttribute("EmployeeList");
//        System.out.println("yyyyyyyyyyy");
//    } else {
//        EmployeeList = adminService.getEmployeePage("15", "0");
//        System.out.println("nnnnnnnnnn");
//    }

    //--------------------------------------------------检查search-------------------------------------------------------

    String DepartmentName = "所有部门";
    Boolean isSearch = true;

    if (request.getParameter("search") != null) {
        EmployeeList = adminService.find(request.getParameter("search"));
    } else if (request.getParameter("department") != null && !DepartmentName.equals(request.getParameter("department"))) {
        DepartmentName = request.getParameter("department");
        EmployeeList = adminService.getEmployeeListByDepartmentName(request.getParameter("department"));
    } else {
        EmployeeList = adminService.getEmployeePage("15", StringPage);
        isSearch = false;
    }

    //-------------------------------------------------------------------------------------------------------------------

    Iterator<Employee> EmployeeIter = EmployeeList.iterator();

%>
<html>
<head>
    <title>全体员工</title>
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
                                全 体 员 工 表
                            </h3>
                            <div class="table-data__tool">
                                <div class="table-data__tool-left">
                                    <div class="rs-select2--light rs-select2--md">
                                        <select class="js-select2" name="property" id="select-department">
                                            <option <%if (DepartmentName.equals("所有部门")) {%> selected="selected"<%}%>>
                                                所有部门
                                            </option>
                                            <%for (Department department : adminService.getAllDepartment()) {%>
                                            <option value="<%=department.getDepName()%>" <%if (DepartmentName.equals(department.getDepName())) {%>
                                                    selected="selected"<%}%>><%=department.getDepName()%>
                                            </option>
                                            <%}%>
                                        </select>
                                        <div class="dropDownSelect2"></div>
                                    </div>
                                </div>
                                <div>
                                    <form class="form-header" action="all_employee_list.jsp" method="POST">
                                        <input class="au-input au-input--xl" type="text" name="search"
                                               style="border-radius:3px;" placeholder="Search"/>
                                        <button class="au-btn--submit" type="submit" style="border-radius:3px;">
                                            <i class="zmdi zmdi-search"></i>
                                        </button>
                                    </form>
                                </div>
                                <div class="table-data__tool-right">
                                    <button class="au-btn au-btn-icon au-btn--green au-btn--small" data-toggle="modal"
                                            data-target="#mediumModal">
                                        <i class="zmdi zmdi-plus"></i>添加员工
                                    </button>
                                </div>
                            </div>
                            <div class="table-responsive table-responsive-data2">
                                <table class="table table-data2">
                                    <thead>
                                    <tr>
                                        <th>
                                        </th>
                                        <th>
                                            ID
                                        </th>
                                        <th>
                                            姓名
                                        </th>
                                        <th>
                                            性别
                                        </th>
                                        <th>
                                            年龄
                                        </th>
                                        <th>
                                            部门
                                        </th>
                                        <th>
                                            手机号码
                                        </th>
                                        <th>
                                            底薪
                                        </th>
                                        <th>
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%while (EmployeeIter.hasNext()) {%>
                                    <%
                                        Employee employee = EmployeeIter.next();
                                    %>

                                    <%--
                                    <%for (int i = 15 * (IntPage - 1); i < 15 * IntPage; i++) {%>
                                    <%
                                        if (i >= EmployeeList.size()) {
                                            break;
                                        }
                                        Employee employee = EmployeeList.get(i);
                                    %>
                                    --%>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                            <input type="text" id="employee_info" maxlength="10"
                                                   style="background-color:transparent;border:0;width:50px;"
                                                   value="<%=employee.getId()%>" readonly/>
                                        </td>
                                        <td>
                                            <input type="text" id="employee_info" maxlength="10"
                                                   style="background-color:transparent;border:0;width:50px;"
                                                   value="<%=employee.getName()%>"/>
                                        </td>
                                        <td>
                                            <div class="rs-select2--trans rs-select2--sm" style="width:50px;">
                                                <select class="js-select2" name="property" id="employee_info">
                                                    <option value="男" <%
                                                        if (employee.getSex().equals("男"))
                                                            out.print("selected=\"selected\"");
                                                    %>>男
                                                    </option>
                                                    <option value="女" <%
                                                        if (employee.getSex().equals("女"))
                                                            out.print("selected=\"selected\"");
                                                    %>>女
                                                    </option>
                                                </select>
                                                <div class="dropDownSelect2"></div>
                                            </div>
                                        </td>
                                        <td>
                                            <input type="text" id="employee_info" maxlength="2"
                                                   style="background-color:transparent;border:0;width:50px;"
                                                   oninput="value=value.replace(/[^\d]/g,'')"
                                                   value="<%=employee.getAge()%>"/>
                                        </td>
                                        <td>
                                            <div class="rs-select2--trans rs-select2--sm" style="width:150px;">
                                                <select class="js-select2" name="property" id="employee_info">
                                                    <option <%if (employee.getDepartment().equals("")) {%>
                                                            selected="selected"<%}%>>
                                                    </option>
                                                    <%for (Department department : adminService.getAllDepartment()) {%>
                                                    <option value="<%=department.getDepName()%>" <%if (employee.getDepartment().equals(department.getDepName())) {%>
                                                            selected="selected"<%}%>><%=department.getDepName()%>
                                                    </option>
                                                    <%}%>
                                                </select>
                                                <div class="dropDownSelect2"></div>
                                            </div>
                                        </td>
                                        <td>
                                            <input type="text" id="employee_info" maxlength="11"
                                                   style="background-color:transparent;border:0;width:100px;"
                                                   oninput="value=value.replace(/[^\d]/g,'')"
                                                   value="<%=employee.getPhone()%>"/>
                                        </td>
                                        <td>
                                            <input type="text" id="BaseSalary" maxlength="8"
                                                   style="background-color:transparent;border:0;width:50px;"
                                                   oninput="value=value.replace(/[^\d]/g,'')"
                                                   value="<%=adminService.getBaseSalaryById(employee.getId())%>"/>
                                        </td>
                                        <td>
                                            <div class="table-data-feature">
                                                <!--
                                                <button class="item" data-toggle="tooltip" data-placement="top"
                                                        title="Edit">
                                                    <i class="zmdi zmdi-edit"></i>
                                                </button>
                                                -->
                                                <button class="item" id="delete_btn">
                                                    <i class="zmdi zmdi-delete"></i>
                                                </button>
                                            </div>
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
                                        href="all_employee_list.jsp?page=<%=IntPage-1%>">上一页</a></button>
                                <%}%>
                                <%if (15 * IntPage >= EmployeeList.size()) {%>
                                <button type="button" class="btn btn-outline-info"><a
                                        href="all_employee_list.jsp?page=<%=IntPage+1%>">下一页</a></button>
                                <%}%>
                            </div>
                            <%}%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END MAIN CONTENT-->
        <!-- END PAGE CONTAINER-->
        <!-- modal medium -->
        <div class="modal fade" id="mediumModal" tabindex="-1" role="dialog" aria-labelledby="mediumModalLabel"
             aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">

                    <div class="modal-body">
                        <div class="card">
                            <div class="card-header">添加员工</div>
                            <div class="card-body card-block">
                                <form action="AdminServlet" method="post">
                                    <div class="form-group" hidden>
                                        <div class="input-group">
                                            <input name="action" value="AddEmployee"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="inputID" name="id"
                                                   maxlength="10" placeholder="ID"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="inputName" name="name"
                                                   maxlength="10" placeholder="姓名"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <select class="form-control" id="inputSex" name="sex">
                                                <option value="男">男</option>
                                                <option value="女">女</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="inputAge" name="age"
                                                   maxlength="2" placeholder="年龄"
                                                   oninput="value=value.replace(/[^\d]/g,'')"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <select class="form-control" id="inputDepartment" name="department">
                                                <%for (Department department : adminService.getAllDepartment()) {%>
                                                <option value="<%=department.getDepName()%>"><%=department.getDepName()%>
                                                </option>
                                                <%}%>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="inputPhone" name="phone"
                                                   maxlength="11" placeholder="联系方式"
                                                   oninput="value=value.replace(/[^\d]/g,'')"/>
                                        </div>
                                    </div>
                                    <div class="form-actions form-group">
                                        <button type="submit" class="btn btn-success btn-sm">添加</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!-- end modal medium -->
    </div>
</div>
<%@ include file="script.jsp" %>
<script>
    $("#all_employee_list").addClass("active");

    $("[id = BaseSalary]").change(function () {
        console.log($(this).closest("tr").children("td:eq(1)").find("input").val());
        $.ajax({
            url: 'AdminServlet',
            type: 'post',
            data: {
                "action": "UpdateBaseSalary",
                "id": $(this).closest("tr").children("td:eq(1)").find("input").val(),
                "BaseSalary": $(this).val()
            },
            dataType: 'text',
            success: function (data) {
                console.log(data);
            }
        })
    });

    $("[id = employee_info]").change(function () {
        console.log($(this).val());
        //console.log($(this).closest("tr").children("td:eq(3)").find("select").val());

        $.ajax({
            url: 'AdminServlet',
            type: 'post',
            data: {
                "action": "UpdateEmployee",
                "id": $(this).closest("tr").children("td:eq(1)").find("input").val(),
                "name": $(this).closest("tr").children("td:eq(2)").find("input").val(),
                "sex": $(this).closest("tr").children("td:eq(3)").find("select").val(),
                "age": $(this).closest("tr").children("td:eq(4)").find("input").val(),
                "department": $(this).closest("tr").children("td:eq(5)").find("select").val(),
                "phone": $(this).closest("tr").children("td:eq(6)").find("input").val()
            },
            dataType: 'text',
            success: function (data) {
                console.log(data);
            }
        })
    });


    $("[id = select-department]").change(function () {
        if ($(this).val() == "所有部门")
            window.location.href = "all_employee_list.jsp";
        window.location.href = "all_employee_list.jsp?department=" + $(this).val();
    });

    $("[id = delete_btn]").click(function () {
        console.log($(this).closest('tr').children()[0].innerText);

        if (confirm("确认删除吗?") != true)
            return;

        let delete_tr = $(this).closest('tr');

        $.ajax({
            url: 'AdminServlet',
            type: 'post',
            data: {
                "action": "DeleteEmployee",
                "id": $(this).closest("tr").children("td:eq(1)").find("input").val()
            },
            dataType: 'text',
            success: function (data) {
                console.log(data)
                delete_tr.remove();
            }
        })
    });
</script>
</body>
</html>
<!-- end document-->
