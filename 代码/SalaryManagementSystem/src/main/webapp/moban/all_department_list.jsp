<%@ page import="com.my.entity.Department" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %><%--
  Created by IntelliJ IDEA.
  User: 吴彦祖2号
  Date: 2020/7/9
  Time: 20:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="page_var.jsp" %>
<%
    ArrayList<Department> DepartmentList = adminService.getAllDepartment();
    Iterator<Department> DepartmentIter = DepartmentList.iterator();
%>
<html>
<head>
    <title>所有部门</title>
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
                                所 有 部 门
                            </h3>
                            <div class="table-responsive table--no-card m-b-30">
                                <table class="table table-borderless table-striped">
                                    <thead>
                                    <tr>
                                        <th>
                                        </th>
                                        <th>
                                            部门
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
                                            周末加班
                                        </th>
                                        <th>
                                            节日加班
                                        </th>
                                        <th>
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    <%while (DepartmentIter.hasNext()) {%>
                                    <%
                                        Department department = DepartmentIter.next();
                                    %>
                                    <tr id="<%=department.getDepName()%>">
                                        <td>
                                            <label class="au-checkbox">
                                                <input type="checkbox" value="<%=department.getDepName()%>">
                                                <span class="au-checkmark"></span>
                                            </label>
                                        </td>
                                        <td>
                                            <input type="text" id="department_info" maxlength="10"
                                                   style="background-color:transparent;border:0;width:100px;"
                                                   value="<%=department.getDepName()%>"/>
                                        </td>
                                        <td>
                                            <input type="text" id="department_info" maxlength="5"
                                                   style="background-color:transparent;border:0;width:50px;"
                                                   oninput="value=value.replace(/[^\d]/g,'')"
                                                   value="<%=department.getDepLeave()%>"/>
                                        </td>
                                        <td>
                                            <input type="text" id="department_info" maxlength="5"
                                                   style="background-color:transparent;border:0;width:50px;"
                                                   oninput="value=value.replace(/[^\d]/g,'')"
                                                   value="<%=department.getDepLate()%>"/>
                                        </td>
                                        <td>
                                            <input type="text" id="department_info" maxlength="5"
                                                   style="background-color:transparent;border:0;width:50px;"
                                                   oninput="value=value.replace(/[^\d]/g,'')"
                                                   value="<%=department.getDepAbsent()%>"/>
                                        </td>
                                        <td>
                                            <input type="text" id="department_info" maxlength="5"
                                                   style="background-color:transparent;border:0;width:50px;"
                                                   oninput="value=value.replace(/[^\d]/g,'')"
                                                   value="<%=department.getDepWeekendOvertime()%>"/>
                                        </td>
                                        <td>
                                            <input type="text" id="department_info" maxlength="5"
                                                   style="background-color:transparent;border:0;width:50px;"
                                                   oninput="value=value.replace(/[^\d]/g,'')"
                                                   value="<%=department.getDepHolidayOvertime()%>"/>
                                        </td>
                                        <td>
                                            <div class="table-data-feature">
                                                <%--                                                <button class="item" id="save_btn" hidden>--%>
                                                <%--                                                    <i class="fa fa-save"></i>--%>
                                                <%--                                                </button>--%>
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

                            <div class="table-data__tool">
                                <div class="table-data__tool-left">
                                    <div id="merge_Department" style="display: none;">
                                        <input class="au-input" id="merge_Department_input" type="text"
                                               style="color:#63C76A" placeholder="新部门"/>
                                        <button class="au-btn au-btn-icon au-btn--green au-btn--small"
                                                id="merge_Department_btn">
                                            <i class="zmdi zmdi-plus"></i>合并部门
                                        </button>
                                    </div>
                                </div>
                                <div class="table-data__tool-right">
                                    <button class="au-btn au-btn-icon au-btn--green au-btn--small" id="add_department">
                                        <i class="zmdi zmdi-plus"></i>添加部门
                                    </button>
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
    $("#all_department_list").addClass("active");

    $("#add_department").click(function () {
        if ($("#new_tr").length > 0) {
            console.log($(this).closest('tr').attr("id"));
            $.ajax({
                url: 'AdminServlet',
                type: 'post',
                data: {
                    "action": "AddDepartment",
                    "old_depName": $("#new_tr").attr("id"),
                    "depName": $("#new_tr").children("td:eq(1)").find("input").val(),
                    "depLeave": $("#new_tr").children("td:eq(2)").find("input").val(),
                    "depLate": $("#new_tr").children("td:eq(3)").find("input").val(),
                    "depAbsent": $("#new_tr").children("td:eq(4)").find("input").val(),
                    "depWeekendOvertime": $("#new_tr").children("td:eq(5)").find("input").val(),
                    "depHolidayOvertime": $("#new_tr").children("td:eq(6)").find("input").val(),
                },
                dataType: 'text',
                success: function (data) {
                    console.log(data)
                    location.reload();
                }
            })
            return;
        }
        $("tbody").append('<tr id="new_tr"><td><label class="au-checkbox"><input type="checkbox"disabled="disabled"><span class="au-checkmark"></span></label></td><td><input type="text"id="department_info"maxlength="10"style="background-color:transparent;border:0;width:100px;color:#63C76A;"value="新部门"></td><td><input type="text"id="department_info"maxlength="5"style="background-color:transparent;border:0;width:50px;color:#63C76A;"oninput="value=value.replace(/[^\\d]/g,\'\')"value="50"></td><td><input type="text"id="department_info"maxlength="5"style="background-color:transparent;border:0;width:50px;color:#63C76A;"oninput="value=value.replace(/[^\\d]/g,\'\')"value="100"></td><td><input type="text"id="department_info"maxlength="5"style="background-color:transparent;border:0;width:50px;color:#63C76A;"oninput="value=value.replace(/[^\\d]/g,\'\')"value="200"></td><td><input type="text"id="department_info"maxlength="5"style="background-color:transparent;border:0;width:50px;color:#63C76A;"oninput="value=value.replace(/[^\\d]/g,\'\')"value="200"></td><td><input type="text"id="department_info"maxlength="5"style="background-color:transparent;border:0;width:50px;color:#63C76A;"oninput="value=value.replace(/[^\\d]/g,\'\')"value="300"></td><td><div class="table-data-feature"><button class="item"id="new_delete_btn"><i class="fa fa-times"></i></button></div></td></tr>');
        $("#new_tr").hide();
        $("#new_tr").show(2000);
        $("#add_department").html('<i class="zmdi zmdi-plus"></i>确认添加');
    });

    $("#merge_Department_btn").click(function () {
        let checked_length = $("input[type='checkbox']:checked").length;
        if (checked_length != 2) {
            alert("必须选择2个哦");
            return;
        }

        console.log($("input[type='checkbox']:checked")[0].value);
        console.log($("input[type='checkbox']:checked")[1].value);
        console.log($("#merge_Department_input").val());

        if ($("#merge_Department_input").val() == "") {
            alert("请填写新部门名称!");
            return;
        }
        $.ajax({
            url: 'AdminServlet',
            type: 'post',
            data: {
                "action": "MergeDepartment",
                "newDepartmentName": $("#merge_Department_input").val(),
                "oldDepartmentName1": $("input[type='checkbox']:checked")[0].value,
                "oldDepartmentName2": $("input[type='checkbox']:checked")[1].value
            },
            dataType: 'text',
            success: function (data) {
                console.log(data)
                alert("已合并");
                location.reload();
            }
        })
    });

    $("input[type='checkbox']").change(function () {
        let checked_length = $("input[type='checkbox']:checked").length;
        console.log(checked_length);

        if (checked_length == 0) {
            $("#merge_Department").hide(1000);
        }
        if (checked_length > 0) {
            $("#merge_Department").show(1000);
        }
        if (checked_length > 2) {
            $(this).prop("checked", false);
            alert("最多只能选择2个哦");
        }
    });

    $("[id = department_info]").change(function () {
        console.log($(this).closest('tr').attr("id"));
        // console.log($(this).closest("tr").children("td:eq(1)").find("input").val());
        // console.log($(this).closest("tr").children("td:eq(2)").find("input").val());
        // console.log($(this).closest("tr").children("td:eq(3)").find("input").val());
        // console.log($(this).closest("tr").children("td:eq(4)").find("input").val());
        // console.log($(this).closest("tr").children("td:eq(5)").find("input").val());
        // console.log($(this).closest("tr").children("td:eq(6)").find("input").val());

        $.ajax({
            url: 'AdminServlet',
            type: 'post',
            data: {
                "action": "UpdateDepartment",
                "old_depName": $(this).closest('tr').attr("id"),
                "depName": $(this).closest("tr").children("td:eq(1)").find("input").val(),
                "depLeave": $(this).closest("tr").children("td:eq(2)").find("input").val(),
                "depLate": $(this).closest("tr").children("td:eq(3)").find("input").val(),
                "depAbsent": $(this).closest("tr").children("td:eq(4)").find("input").val(),
                "depWeekendOvertime": $(this).closest("tr").children("td:eq(5)").find("input").val(),
                "depHolidayOvertime": $(this).closest("tr").children("td:eq(6)").find("input").val(),
            },
            dataType: 'text',
            success: function (data) {
                console.log(data)
                //alert("已保存");
            }
        })
    });

    // $("[id = save_btn]").click(function () {
    //     console.log($(this).closest('tr').attr("id"));
    //     $.ajax({
    //         url: 'AdminServlet',
    //         type: 'post',
    //         data: {
    //             "action": "UpdateDepartment",
    //             "old_depName": $(this).closest('tr').attr("id"),
    //             "depName": $(this).closest('tr').children()[1].innerText,
    //             "depLeave": $(this).closest('tr').children()[2].innerText,
    //             "depLate": $(this).closest('tr').children()[3].innerText,
    //             "depAbsent": $(this).closest('tr').children()[4].innerText,
    //             "depWeekendOvertime": $(this).closest('tr').children()[5].innerText,
    //             "depHolidayOvertime": $(this).closest('tr').children()[6].innerText
    //         },
    //         dataType: 'text',
    //         success: function (data) {
    //             console.log(data)
    //             alert("已保存");
    //         }
    //     })
    // });

    $("[id = delete_btn]").click(function () {
        console.log($(this).parent().parent().parent().children()[1].innerText);

        if (confirm("确认删除吗?") != true)
            return;

        let delete_tr = $(this).closest('tr');

        $.ajax({
            url: 'AdminServlet',
            type: 'post',
            data: {
                "action": "DeleteDepartment",
                "depName": $(this).closest('tr').attr("id")
            },
            dataType: 'text',
            success: function (data) {
                console.log(data)
                delete_tr.remove();
            }
        })
    });


    $("table").on('click', '#new_delete_btn', function () {
        $(this).closest('tr').remove();
        $("#add_department").html('<i class="zmdi zmdi-plus"></i>添加部门');
    });

    // $("table").on('click', '#new_save_btn', function () {
    //     console.log($(this).closest('tr').attr("id"));
    //
    //     $.ajax({
    //         url: 'AdminServlet',
    //         type: 'post',
    //         data: {
    //             "action": "AddDepartment",
    //             "old_depName": $(this).closest('tr').attr("id"),
    //             "depName": $(this).closest("tr").children("td:eq(1)").find("input").val(),
    //             "depLeave": $(this).closest("tr").children("td:eq(2)").find("input").val(),
    //             "depLate": $(this).closest("tr").children("td:eq(3)").find("input").val(),
    //             "depAbsent": $(this).closest("tr").children("td:eq(4)").find("input").val(),
    //             "depWeekendOvertime": $(this).closest("tr").children("td:eq(5)").find("input").val(),
    //             "depHolidayOvertime": $(this).closest("tr").children("td:eq(6)").find("input").val(),
    //         },
    //         dataType: 'text',
    //         success: function (data) {
    //             console.log(data)
    //             location.reload();
    //         }
    //     })
    // });

</script>
</body>
</html>
<!-- end document-->