<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 吴彦祖2号
  Date: 2020/7/9
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- HEADER DESKTOP-->
<header class="header-desktop">
    <div class="section__content section__content--p30">
        <div class="container-fluid">
            <div class="header-wrap">
                <h3 class="text-center title-4">
                    欢 迎 使 用 工 资 管 理 系 统
                </h3>
                <div class="header-button">
                    <div class="account-wrap">
                        <div class="account-item clearfix js-item-menu">
                            <div class="image">
                                <img src="/moban/images/icon/avatar-0${loginEmployee.id%6+1}.jpg" alt="img"/>
                            </div>
                            <div class="content">
                                <a class="js-acc-btn" href="#">${loginEmployee.name}
                                </a>
                            </div>
                            <div class="account-dropdown js-dropdown">
                                <div class="info clearfix">
                                    <div class="image">
                                        <a href="#">
                                            <img src="/moban/images/icon/avatar-0${loginEmployee.id%6+1}.jpg" alt="img"/>
                                        </a>
                                    </div>
                                    <div class="content">
                                        <h5 class="name">
                                            <a href="#">${loginEmployee.name}
                                            </a>
                                        </h5>
                                        <span class="email">${loginEmployee.id}</span>
                                    </div>
                                </div>
                                <div class="account-dropdown__body">
                                    <div class="account-dropdown__item">
                                        <a href="/sms/employee/person">
                                            <i class="zmdi zmdi-account"></i>个人信息</a>
                                    </div>
                                    <div class="account-dropdown__item">
                                        <a href="/sms/user/password">
                                            <i class="zmdi zmdi-settings"></i>修改密码</a>
                                    </div>
                                </div>
                                <div class="account-dropdown__footer">
                                    <a href="/sms/all/logout.do">
                                        <i class="zmdi zmdi-power"></i>退出</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<!-- HEADER DESKTOP-->
