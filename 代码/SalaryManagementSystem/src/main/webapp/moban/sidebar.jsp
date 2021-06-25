<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 吴彦祖2号
  Date: 2020/12/3
  Time: 1:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<shiro:hasRole name="3">
    <%@ include file="/moban/sidebar_caiwu.jsp" %>
</shiro:hasRole>
<shiro:hasRole name="2">
    <%@ include file="/moban/sidebar_renshi.jsp" %>
</shiro:hasRole>
<shiro:hasRole name="1">
    <%@ include file="/moban/sidebar_admin.jsp" %>
</shiro:hasRole>
<shiro:hasRole name="0">
    <%@ include file="/moban/sidebar_personal.jsp" %>
</shiro:hasRole>
<%--<shiro:hasRole name="3">--%>

<%--</shiro:hasRole>--%>