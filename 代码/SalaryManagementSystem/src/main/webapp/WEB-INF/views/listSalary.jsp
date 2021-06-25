<%--
  Created by IntelliJ IDEA.
  User: 吴彦祖2号
  Date: 2020/12/3
  Time: 8:40
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>工资管理</title>
    <%@ include file="/moban/css.jsp" %>
</head>
<body class="animsition">
<div class="page-wrapper">
    <!-- PAGE CONTAINER-->
    <%@ include file="/moban/sidebar.jsp" %>
    <div class="page-container">
        <%@ include file="/moban/header.jsp" %>
        <!-- MAIN CONTENT-->
        <div class="main-content">
            <div class="section__content section__content--p30">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h3 class="text-center title-5 m-b-35">
                                职 工 工 资 表
                            </h3>
                            <div class="table-data__tool">
                                <div class="table-data__tool-left">
                                    <div class="rs-select2--light rs-select2--md">
                                        <select class="js-select2" name="property" id="select-page">
                                            <c:forEach var="pageNumber" begin="1" end="${pageInfo.pages}">
                                                <option value="${pageNumber}"
                                                        <c:if test="${pageNumber == pageInfo.current}">selected="selected"</c:if>>
                                                    第${pageNumber}页
                                                </option>
                                            </c:forEach>
                                        </select>
                                        <div class="dropDownSelect2"></div>
                                    </div>
                                </div>
                                <div>
                                    <form class="form-header" action="find.do" method="POST">
                                        <input class="au-input au-input--xl" type="text" name="find"
                                               style="border-radius:3px;" placeholder="查找"/>
                                        <button class="au-btn--submit" type="submit" style="border-radius:3px;">
                                            <i class="zmdi zmdi-search"></i>
                                        </button>
                                    </form>
                                </div>
                                <div class="table-data__tool-right">
                                    <button class="au-btn au-btn-icon au-btn--green au-btn--small" data-toggle="modal" style="visibility: hidden"
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
                                            岗位工资
                                        </th>
                                        <th>
                                            薪级工资
                                        </th>
                                        <th>
                                            职务津贴
                                        </th>
                                        <th>
                                            绩效工资
                                        </th>
                                        <th>
                                            应发工资
                                        </th>
                                        <th>
                                            个人所得税
                                        </th>
                                        <th>
                                            实发工资
                                        </th>
                                        <th>
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${pageInfo.records==null?salaries:pageInfo.records}"
                                               var="item">
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                                <input type="text" class="data_info" maxlength="20"
                                                       style="background-color:transparent;border:0;width:50px;"
                                                       value="${item.id}" readonly/>
                                            </td>
                                            <td>
                                                <input type="text" class="data_info" maxlength="10"
                                                       style="background-color:transparent;border:0;width:50px;"
                                                       oninput="value=value.replace(/[^\d^\.]/g,'')"
                                                       value="${item.postsalary}"/>
                                            </td>
                                            <td>
                                                <input type="text" class="data_info" maxlength="10"
                                                       style="background-color:transparent;border:0;width:50px;"
                                                       oninput="value=value.replace(/[^\d^\.]/g,'')"
                                                       value="${item.scalesalary}"/>
                                            </td>
                                            <td>
                                                <input type="text" class="data_info" maxlength="10"
                                                       style="background-color:transparent;border:0;width:50px;"
                                                       oninput="value=value.replace(/[^\d^\.]/g,'')"
                                                       value="${item.allowance}"/>
                                            </td>
                                            <td>
                                                <input type="text" class="data_info" maxlength="10"
                                                       style="background-color:transparent;border:0;width:100px;"
                                                       oninput="value=value.replace(/[^\d^\.]/g,'')"
                                                       value="${item.performancesalary}"/>
                                            </td>
                                            <td>
                                                <input type="text" class="data_info" maxlength="10"
                                                       style="background-color:transparent;border:0;width:50px;"
                                                       oninput="value=value.replace(/[^\d^\.]/g,'')"
                                                       value="${item.totalsalary}" readonly/>
                                            </td>
                                            <td>
                                                <input type="text" class="data_info" maxlength="10"
                                                       style="background-color:transparent;border:0;width:50px;"
                                                       oninput="value=value.replace(/[^\d^\.]/g,'')"
                                                       value="${item.tax}" readonly/>
                                            </td>
                                            <td>
                                                <input type="text" class="data_info" maxlength="10"
                                                       style="background-color:transparent;border:0;width:50px;"
                                                       oninput="value=value.replace(/[^\d^\.]/g,'')"
                                                       value="${item.salary}" readonly/>
                                            </td>
                                            <td>
                                                <div class="table-data-feature">
                                                        <%--                                                    <button class="item" data-toggle="tooltip" data-placement="top"--%>
                                                        <%--                                                            title="Edit">--%>
                                                        <%--                                                        <i class="zmdi zmdi-edit"></i>--%>
                                                        <%--                                                    </button>--%>
                                                    <button class="item delete_btn">
                                                        <i class="zmdi zmdi-delete"></i>
                                                    </button>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div class="card-body" style="text-align:center;">
                                <c:if test="${pageInfo.hasPrevious}">
                                    <button type="button" class="btn btn-outline-primary"><a
                                            href="list.do?page=${pageInfo.current-1}">上一页</a></button>
                                </c:if>
                                <c:if test="${pageInfo.hasNext}">
                                    <button type="button" class="btn btn-outline-info"><a
                                            href="list.do?page=${pageInfo.current+1}">下一页</a></button>
                                </c:if>
                            </div>
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
                                <form id="add" action="/sms/all/add.do" method="post">
                                    <%--                                    <div class="form-group" hidden>--%>
                                    <%--                                        <div class="input-group">--%>
                                    <%--                                            <input name="action" value="AddEmployee"/>--%>
                                    <%--                                        </div>--%>
                                    <%--                                    </div>--%>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="inputID" name="id"
                                                   maxlength="20" placeholder="ID"
                                                   oninput="value=value.replace(/[^\d]/g,'')"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="inputPassword" name="password"
                                                   maxlength="20" placeholder="密码"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <select class="form-control" id="inputAuthorization" name="authorization">
                                                <option value="3">财务</option>
                                                <option value="2">人事</option>
                                                <option value="1">管理员</option>
                                                <option value="0">普通员工</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="inputName" name="name"
                                                   maxlength="20" placeholder="姓名"/>
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
                                            <input type="text" class="form-control" id="inputAge"
                                                   name="age"
                                                   maxlength="2" placeholder="年龄"
                                                   oninput="value=value.replace(/[^\d]/g,'')"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="inputPostsalary"
                                                   name="postsalary"
                                                   maxlength="10" placeholder="岗位工资"
                                                   oninput="value=value.replace(/[^\d^\.]/g,'')"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="inputScalesalary"
                                                   name="scalesalary"
                                                   maxlength="10" placeholder="薪级工资"
                                                   oninput="value=value.replace(/[^\d^\.]/g,'')"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="inputAllowance" name="allowance"
                                                   maxlength="10" placeholder="职务津贴"
                                                   oninput="value=value.replace(/[^\d^\.]/g,'')"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="inputPerformancesalary"
                                                   name="performancesalary"
                                                   maxlength="10" placeholder="绩效工资"
                                                   oninput="value=value.replace(/[^\d^\.]/g,'')"/>
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
<%@ include file="/moban/script.jsp" %>
<script>
    $("#salary").addClass("active");

    <shiro:hasPermission name="3:0">$(".data_info").attr("disabled","disabled"); $(".delete_btn").hide();</shiro:hasPermission>
    <shiro:hasPermission name="3:1">$(".delete_btn").hide();</shiro:hasPermission>

    $(".data_info").change(function () {
        //console.log($(this).closest("tr").children("td:eq(3)").find("select").val());
        $.ajax({
            url: 'update.do',
            type: 'post',
            data: {
                "id": $(this).closest("tr").children("td:eq(1)").find("input").val(),
                "postsalary": $(this).closest("tr").children("td:eq(2)").find("input").val(),
                "scalesalary": $(this).closest("tr").children("td:eq(3)").find("input").val(),
                "allowance": $(this).closest("tr").children("td:eq(4)").find("input").val(),
                "performancesalary": $(this).closest("tr").children("td:eq(5)").find("input").val()
            },
            dataType: 'json',
            success: function (data) {
                console.log(data);
            }
        })
    });

    $("#select-page").change(function () {
        window.location.href = "list.do?page=" + $(this).val();
    });

    $("#add").submit(function (event) {
        event.preventDefault();
        let form = $(this);
        //普通表单
        $.ajax({
            type: form.attr('method'),
            url: form.attr('action'),
            data: form.serialize(),
            success: function (data) {
                if (data == "true")
                    window.location.reload();
                else
                    alert("ID已存在!")
            }
        })
    });

    $(".delete_btn").click(function () {
        if (confirm("确认删除吗?") !== true)
            return;

        let delete_tr = $(this).closest('tr');

        $.ajax({
            url: '/sms/all/delete.do',
            type: 'post',
            data: {
                "id": $(this).closest("tr").children("td:eq(1)").find("input").val()
            },
            dataType: 'json',
            success: function (data) {
                delete_tr.remove();
                console.log(data)
            }
        })
    });
</script>
</body>
</html>

