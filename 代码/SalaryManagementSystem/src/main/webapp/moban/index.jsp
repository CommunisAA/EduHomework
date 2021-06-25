<%@ page import="com.my.entity.Salary" %><%--
  Created by IntelliJ IDEA.
  User: 吴彦祖2号
  Date: 2020/7/9
  Time: 15:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="page_var.jsp" %>
<%
    Salary login_salary = userService.getLatestSalaryById(login_employee.getId());
%>
<html>
<head>
    <title>首页</title>
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
                            <div class="au-card">
                                <div id="main" style="width:100%;height:500px;margin:0 auto;text-align:center;"></div>
                            </div>
                            <script type="text/javascript">
                                // 基于准备好的dom，初始化echarts实例
                                var myChart = echarts.init(document.getElementById('main'));
                                // 指定图表的配置项和数据
                                var option = {
                                    title: {
                                        text: "<%=(login_salary.getDate().getMonth()+1) + "月工资"%>",
                                        subtext: "<%="总计" + login_salary.getSalTotal() + "元"%>",
                                        left: 'center'
                                    },
                                    tooltip: {
                                        trigger: 'item',
                                        formatter: '{a} <br/>{b}: {c} ({d}%)'
                                    },
                                    legend: {
                                        orient: 'vertical',
                                        left: 10,
                                        data: ['底薪', '加班', '提成', '奖金', '请假', '迟到', '旷工']
                                    },
                                    series: [
                                        {
                                            name: '罚款',
                                            type: 'pie',
                                            selectedMode: 'single',
                                            radius: [0, '20%'],

                                            label: {
                                                position: 'inner'
                                            },
                                            labelLine: {
                                                show: false
                                            },
                                            data: [
                                                {value: <%=login_salary.getSalLeave()%>, name: '请假'},
                                                {value: <%=login_salary.getSalLate()%>, name: '迟到'},
                                                {value: <%=login_salary.getSalAbsent()%>, name: '缺席'}
                                            ]
                                        },
                                        {
                                            name: '工资',
                                            type: 'pie',
                                            radius: ['30%', '50%'],
                                            label: {
                                                formatter: '{a|{a}}{abg|}\n{hr|}\n  {b|{b}：}{c}  {per|{d}%}  ',
                                                backgroundColor: '#eee',
                                                borderColor: '#aaa',
                                                borderWidth: 1,
                                                borderRadius: 4,
                                                // shadowBlur:3,
                                                // shadowOffsetX: 2,
                                                // shadowOffsetY: 2,
                                                // shadowColor: '#999',
                                                // padding: [0, 7],
                                                rich: {
                                                    a: {
                                                        color: '#999',
                                                        lineHeight: 22,
                                                        align: 'center'
                                                    },
                                                    // abg: {
                                                    //     backgroundColor: '#333',
                                                    //     width: '100%',
                                                    //     align: 'right',
                                                    //     height: 22,
                                                    //     borderRadius: [4, 4, 0, 0]
                                                    // },
                                                    hr: {
                                                        borderColor: '#aaa',
                                                        width: '100%',
                                                        borderWidth: 0.5,
                                                        height: 0
                                                    },
                                                    b: {
                                                        fontSize: 16,
                                                        lineHeight: 33
                                                    },
                                                    per: {
                                                        color: '#eee',
                                                        backgroundColor: '#334455',
                                                        padding: [2, 4],
                                                        borderRadius: 2
                                                    }
                                                }
                                            },
                                            data: [
                                                {value: <%=login_salary.getSalBasic()%>, name: '底薪'},
                                                {value: <%=login_salary.getSalOvertime()%>, name: '加班'},
                                                {value: <%=login_salary.getSalCommission()%>, name: '提成'},
                                                {value: <%=login_salary.getSalBonus()%>, name: '奖金'}
                                            ]
                                        }
                                    ]
                                };
                                // 使用刚指定的配置项和数据显示图表。
                                myChart.setOption(option);
                            </script>
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
    $("#index").addClass("active");
</script>
</body>
</html>
<!-- end document-->
