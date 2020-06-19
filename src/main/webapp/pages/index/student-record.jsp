<%--
  Created by IntelliJ IDEA.
  User: LiLang9725
  Date: 2020/6/18
  Time: 19:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String[] head = {"科目一成绩","科目一状态","科目二学时","科目二成绩","科目二状态","科目三学时"
            ,"科目三成绩","科目三状态","科目四成绩","科目四状态"};
    String[] head2 = {"考试科目","考试成绩","考试时间"};
%>
<html>
<head>
    <meta charset="utf-8">
    <title>学员考试记录</title>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <script src="https://www.layuicdn.com/layui/layui.js"></script>
    <link href="https://www.layuicdn.com/layui/css/layui.css" rel="stylesheet" type="text/css"/>
    <script src="<%=path+"/static/custom_tool.js"%>"></script>
</head>
    <body>
        <div>
            链接(入口)样式：（用后删）localhost:8080/examResultController/getStudentResult?sId=1
            <input hidden="hidden" value="<%=path%>" id="path">
            <div style="text-align: center;"><br>
                <label style="font-size: 25px;color: #7077d2">&nbsp;&nbsp;考&nbsp;试&nbsp;记&nbsp;录&nbsp;&nbsp;</label>
            </div>
            <div style="text-align: center;width: 80%;margin: 3% 10% 0 10%">
                <table width="100%" border="1" cellpadding="1" cellspacing="1">
                    <tr>
                        <c:forEach items="<%=head%>" begin="0" step="1" end="10" var="h">
                            <td style="font-size: 20px;text-align: center;">${h}</td>
                        </c:forEach>
                    </tr>
                    <tr>
                        <td style="text-align: center;">${data.data.examResult.erScore1}</td>
                        <td style="text-align: center;">
                            <button onclick="LookESR(1)">
                                <c:if test="${data.data.examResult.erState1 == 0}">未通过</c:if>
                                <c:if test="${data.data.examResult.erState1 == 1}">已通过</c:if>
                                <c:if test="${data.data.examResult.erState1 == 2}">考试中</c:if>
                            </button>
                        </td>
                        <td style="text-align: center;">${data.data.examResult.erTime2}</td>
                        <td style="text-align: center;">${data.data.examResult.erScore2}</td>
                        <td style="text-align: center;">
                            <button onclick="LookESR(2)">
                                <c:if test="${data.data.examResult.erState2 == 0}">未通过</c:if>
                                <c:if test="${data.data.examResult.erState2 == 1}">已通过</c:if>
                                <c:if test="${data.data.examResult.erState2 == 2}">考试中</c:if>
                            </button>
                        </td>
                        <td style="text-align: center;">${data.data.examResult.erTime3}</td>
                        <td style="text-align: center;">${data.data.examResult.erScore3}</td>
                        <td style="text-align: center;">
                            <button onclick="LookESR(3)">
                                <c:if test="${data.data.examResult.erState3 == 0}">未通过</c:if>
                                <c:if test="${data.data.examResult.erState3 == 1}">已通过</c:if>
                                <c:if test="${data.data.examResult.erState3 == 2}">考试中</c:if>
                            </button>
                        </td>
                        <td style="text-align: center;">${data.data.examResult.erScore4}</td>
                        <td style="text-align: center;">
                            <button onclick="LookESR(4)">
                                <c:if test="${data.data.examResult.erState4 == 0}">未通过</c:if>
                                <c:if test="${data.data.examResult.erState4 == 1}">已通过</c:if>
                                <c:if test="${data.data.examResult.erState4 == 2}">考试中</c:if>
                            </button>
                        </td>
                    </tr>
                </table>
            </div>
            <div style="text-align: center; margin: 3% 20% 0 20%"><br>
                <label style="font-size: 22px;">考试历史记录</label><br><br>
                <table width="100%" border="1" cellpadding="1" cellspacing="1" id="esr1">
                    <tr>
                        <c:forEach items="<%=head2%>" begin="0" step="1" end="10" var="h">
                            <td style="font-size: 20px;text-align: center;">${h}</td>
                        </c:forEach>
                    </tr>
                    <c:forEach items="${data.data.esr1}" begin="0" step="1" end="10" var="esr">
                        <tr>
                            <td style="text-align: center;">科目一</td>
                            <td style="text-align: center;">${esr.esrScore}</td>
                            <td style="text-align: center;">${esr.esrTime}</td>
                        </tr>
                    </c:forEach>
                </table>
                <table width="100%" border="1" cellpadding="1" cellspacing="1" hidden="hidden" id="esr2">
                    <tr>
                        <c:forEach items="<%=head2%>" begin="0" step="1" end="10" var="h">
                            <td style="font-size: 20px;text-align: center;">${h}</td>
                        </c:forEach>
                    </tr>
                    <c:forEach items="${data.data.esr2}" begin="0" step="1" end="10" var="esr">
                        <tr>
                            <td style="text-align: center;">科目二</td>
                            <td style="text-align: center;">${esr.esrScore}</td>
                            <td style="text-align: center;">${esr.esrTime}</td>
                        </tr>
                    </c:forEach>
                </table>
                <table width="100%" border="1" cellpadding="1" cellspacing="1" hidden="hidden" id="esr3">
                    <tr>
                        <c:forEach items="<%=head2%>" begin="0" step="1" end="10" var="h">
                            <td style="font-size: 20px;text-align: center;">${h}</td>
                        </c:forEach>
                    </tr>
                    <c:forEach items="${data.data.esr3}" begin="0" step="1" end="10" var="esr">
                        <tr>
                            <td style="text-align: center;">科目三</td>
                            <td style="text-align: center;">${esr.esrScore}</td>
                            <td style="text-align: center;">${esr.esrTime}</td>
                        </tr>
                    </c:forEach>
                </table>
                <table width="100%" border="1" cellpadding="1" cellspacing="1" hidden="hidden" id="esr4">
                    <tr>
                        <c:forEach items="<%=head2%>" begin="0" step="1" end="10" var="h">
                            <td style="font-size: 20px;text-align: center;">${h}</td>
                        </c:forEach>
                    </tr>
                    <c:forEach items="${data.data.esr4}" begin="0" step="1" end="10" var="esr">
                        <tr>
                            <td style="text-align: center;">科目四</td>
                            <td style="text-align: center;">${esr.esrScore}</td>
                            <td style="text-align: center;">${esr.esrTime}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    <script>
        function LookESR(box) {
            for (let i = 1;i < 5;i++) {
                HideOrShow($("#esr"+i),true);
            }
            HideOrShow($("#esr"+box),false);
        }
    </script>
    </body>
</html>
