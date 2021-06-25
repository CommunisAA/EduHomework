<%--
  Created by IntelliJ IDEA.
  User: 吴彦祖2号
  Date: 2020/12/10
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- MENU SIDEBAR-->
<aside class="menu-sidebar d-none d-lg-block">
    <div class="logo">
        <a href="/sms/all/index">
            <img src="/moban/images/icon/logo.png" alt="Cool Admin"/>
        </a>
    </div>
    <div class="menu-sidebar__content js-scrollbar1">
        <nav class="navbar-sidebar">
            <ul class="list-unstyled navbar__list">
                <li id="index">
                    <a href="/sms/all/index">
                        <i class="fas fa-desktop"></i>首页</a>
                </li>
                <li id = "salaryHistory">
                    <a href="/sms/salaryHistory/list.do">
                        <i class="fas fa-list-ol"></i>我的工资</a>
                </li>
                <li id="salary">
                    <a href="/sms/salary/list.do">
                        <i class="fas fa-chart-bar"></i>工资管理</a>
                </li>
                <shiro:hasPermission name="3:1">
                    <li id="salaryHistoryQuery">
                        <a href="/sms/salaryHistory/listE.do">
                            <i class="fas fa-list-ul"></i>发放记录</a>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="3:2">
                    <li id="salaryHistoryQuery">
                        <a href="/sms/salaryHistory/listE.do">
                            <i class="fas fa-list-ul"></i>发放记录</a>
                    </li>
                    <li id="listTax">
                        <a href="/sms/tax/list.do">
                            <i class="fas fa-table"></i>税率设置</a>
                    </li>
                </shiro:hasPermission>
            </ul>
        </nav>
    </div>
</aside>
<!-- END MENU SIDEBAR-->