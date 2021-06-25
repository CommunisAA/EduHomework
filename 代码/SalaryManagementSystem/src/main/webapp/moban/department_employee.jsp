<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.my.entity.Department" %><%--
  Created by IntelliJ IDEA.
  User: 吴彦祖2号
  Date: 2020/7/9
  Time: 19:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="page_var.jsp" %>
<%
    ArrayList<Employee> EmployeeList = adminService.getEmployeeListByDepartmentName(login_employee.getDepartment());
    Iterator<Employee> EmployeeIter = EmployeeList.iterator();
%>
<html>
<head>
    <title>部门员工</title>
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
                                部 门 员 工 表
                            </h3>
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
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%while (EmployeeIter.hasNext()) {%>
                                    <%
                                        Employee employee = EmployeeIter.next();
                                    %>
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
    $("#department_employee").addClass("active");

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
</script>
</body>
</html>
<!-- end document-->