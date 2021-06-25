<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 吴彦祖2号
  Date: 2020/12/3
  Time: 0:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页</title>
    <%@ include file="/moban/css.jsp" %>
</head>
<body class="animsition">
<div class="page-wrapper">
    <%@ include file="/moban/sidebar.jsp" %>
    <!-- PAGE CONTAINER-->
    <div class="page-container">
        <%@ include file="/moban/header.jsp" %>
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
                                        text: "个人工资(${lastSalary.date})",
                                        subtext: "总计${lastSalary.totalsalary}元,实发${lastSalary.salary}元(个人所得税: ${lastSalary.tax})",
                                        left: 'center'
                                    },
                                    tooltip: {
                                        trigger: 'item',
                                        formatter: '{a} <br/>{b}: {c} ({d}%)'
                                    },
                                    legend: {
                                        orient: 'vertical',
                                        left: 10,
                                        data: ['岗位工资', '薪级工资', '职务津贴', '绩效工资', '请假', '实发工资', '个税']
                                    },
                                    series: [
                                        {
                                            name: '实发',
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
                                                {value: ${lastSalary.salary}, name: '实发工资'},
                                                {value: ${lastSalary.tax}, name: '个税'}
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
                                                {value: ${lastSalary.postsalary}, name: '岗位工资'},
                                                {value: ${lastSalary.scalesalary}, name: '薪级工资'},
                                                {value: ${lastSalary.allowance}, name: '职务津贴'},
                                                {value: ${lastSalary.performancesalary}, name: '绩效工资'}
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
<%@ include file="/moban/script.jsp" %>
<script>
    $("#index").addClass("active");
</script>
</body>
</html>
