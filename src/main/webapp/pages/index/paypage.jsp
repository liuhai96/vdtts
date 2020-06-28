<%--
  Created by IntelliJ IDEA.
  User: test
  Date: 2020/6/23
  Time: 16:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>支付页面</title>
</head>
<body>
<form id="payform" action="/aliPayController/pay"  method="get">
    <input type="hidden" name="studentId" value="${sessionScope.student.SId}">
    <input type="hidden" name="studentName" value="${sessionScope.student.SName}">
    <input type="hidden" name="schoolId" value="${sid}">
    <input type="hidden" name="schoolName" value="${name}">
    <input type="hidden" name="registerFee" value="${sRegisteryFee}">
<%--    <input type="submit" name="form1" id="paysubmit">--%>
</form>
<script>
    window.onload= function(){
        document.getElementById("payform").submit();
    }
</script>
<%--<script language=javascript>--%>
<%--    var payForm = document.getElementById("paysubmit");--%>
<%--    function pay() {--%>
<%--        payForm.submit();--%>
<%--        // setTimeout("",1000);--%>
<%--    }--%>
<%--    window.onload=pay;--%>

<%--</script>--%>
</body>

</html>
