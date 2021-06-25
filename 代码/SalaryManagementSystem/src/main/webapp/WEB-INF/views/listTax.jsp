<%--
  Created by IntelliJ IDEA.
  User: 吴彦祖2号
  Date: 2020/12/1
  Time: 22:02
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>税率设置</title>
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
                                税 率 设 置
                            </h3>
                            <div class="table-data__tool">
                                <div class="table-data__tool-left"  style="visibility: hidden;">
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
                                <div style="visibility: hidden;">
                                    <form class="form-header" action="find.do" method="POST">
                                        <input class="au-input au-input--xl" type="text" name="find"
                                               style="border-radius:3px;" placeholder="查找"/>
                                        <button class="au-btn--submit" type="submit" style="border-radius:3px;">
                                            <i class="zmdi zmdi-search"></i>
                                        </button>
                                    </form>
                                </div>
                                <div class="table-data__tool-right">
                                    <button class="au-btn au-btn-icon au-btn--green au-btn--small" data-toggle="modal"
                                            data-target="#mediumModal">
                                        <i class="zmdi zmdi-plus"></i>添加
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
                                        </th>
                                        <th>
                                        </th>
                                        <th>
                                        </th>
                                        <th>
                                        </th>
                                        <th>
                                        </th>
                                        <th>
                                        </th>
                                        <th>
                                        </th>
                                        <th>
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${pageInfo.records==null?employees:pageInfo.records}"
                                               var="item">
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                                <input type="text" class="data_info" maxlength="20"
                                                       value="${item.id}" readonly hidden/>
                                            </td>
                                            <td>
                                                从
                                            </td>
                                            <td>
                                                <input type="text" class="data_info" maxlength="20"
                                                       style="background-color:transparent;border:0;width:80px;"
                                                       oninput="value=value.replace(/[^\d^\.]/g,'')"
                                                       value="${item.start}"/>
                                            </td>
                                            <td>
                                                至
                                            </td>
                                            <td>
                                                <input type="text" class="data_info" maxlength="20"
                                                       style="background-color:transparent;border:0;width:80px;"
                                                       oninput="value=value.replace(/[^\d^\.]/g,'')"
                                                       value="${item.end==-1?"":item.end}"/>
                                            </td>
                                            <td>
                                                税率为
                                            </td>
                                            <td>
                                                <input type="text" class="data_info" maxlength="20"
                                                       style="background-color:transparent;border:0;width:80px;"
                                                       oninput="value=value.replace(/[^\d^\.]/g,'')"
                                                       value="${item.ratio}"/>
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
                            <div class="card-header">添加</div>
                            <div class="card-body card-block">
                                <form id="add" action="/sms/tax/add.do" method="post">
                                    <%--                                    <div class="form-group" hidden>--%>
                                    <%--                                        <div class="input-group">--%>
                                    <%--                                            <input name="action" value="AddEmployee"/>--%>
                                    <%--                                        </div>--%>
                                    <%--                                    </div>--%>
                                    <div class="form-group" hidden>
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="inputID" name="id"
                                                   maxlength="20" placeholder="ID"
                                                   oninput="value=value.replace(/[^\d]/g,'')"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="inputPostsalary"
                                                   name="start"
                                                   maxlength="10" placeholder="从"
                                                   oninput="value=value.replace(/[^\d^\.]/g,'')"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="inputScalesalary"
                                                   name="end"
                                                   maxlength="10" placeholder="至"
                                                   oninput="value=value.replace(/[^\d^\.]/g,'')"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="inputAllowance" name="ratio"
                                                   maxlength="10" placeholder="税率"
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
    $("#listTax").addClass("active");

    $(".data_info").change(function () {
        //console.log($(this).closest("tr").children("td:eq(3)").find("select").val());
        $.ajax({
            url: 'update.do',
            type: 'post',
            data: {
                "id": $(this).closest("tr").children("td:eq(1)").find("input").val(),
                "start": $(this).closest("tr").children("td:eq(3)").find("input").val(),
                "end": $(this).closest("tr").children("td:eq(5)").find("input").val(),
                "ratio": $(this).closest("tr").children("td:eq(7)").find("input").val(),
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
            url: '/sms/tax/delete.do',
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
