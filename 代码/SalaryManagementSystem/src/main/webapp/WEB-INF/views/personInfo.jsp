<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 吴彦祖2号
  Date: 2020/12/3
  Time: 9:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人信息</title>
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
                            <div class="card" style="width:40%;margin:0 auto;">
                                <div class="card-body">
                                    <div class="card-title">
                                        <h3 class="text-center title-2">基本信息
                                        </h3>
                                    </div>
                                    <hr>
                                    <c:if test="${tips != null}">
                                        <div class="alert alert-success" role="alert">
                                                ${tips}
                                        </div>
                                    </c:if>
                                    <form action="updateInfo.do" method="post" novalidate="novalidate">
                                        <div class="form-group">
                                            <label for="inputID" class="control-label mb-1">工号</label>
                                            <input type="text" class="form-control" id="inputID" name="id"
                                                   value="${loginEmployee.id}" maxlength="10"
                                                   readonly/>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputName" class="control-label mb-1">姓名</label>
                                            <input type="text" class="form-control" id="inputName" name="name"
                                                   value="${loginEmployee.name}" maxlength="10"/>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputSex" class="control-label mb-1">性别</label>
                                            <select class="form-control" id="inputSex" name="sex">
                                                <option value="男" ${loginEmployee.sex=='男'?'selected="selected"':''}>
                                                    男
                                                </option>
                                                <option value="女" ${loginEmployee.sex=='女'?'selected="selected"':''}>
                                                    女
                                                </option>
                                            </select>

                                        </div>
                                        <div class="form-group">
                                            <label for="inputAge" class="control-label mb-1">年龄</label>

                                            <input type="text" class="form-control" id="inputAge" name="age"
                                                   value="${loginEmployee.age}" maxlength="2"
                                                   oninput="value=value.replace(/[^\d]/g,'')"/>

                                        </div>
                                        <div>
                                            <button id="payment-button" type="submit"
                                                    class="btn btn-lg btn-info btn-block">
                                                <span id="payment-button-amount">保存修改</span>
                                            </button>
                                        </div>
                                    </form>
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
<%@ include file="/moban/script.jsp" %>
</body>
</html>
