<%@page contentType="text/html;charset=UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>emplist</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.10.1.js"></script>
    <script>
        function deleteOne(id) {
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/employee/delete.do",
                data: "id=" + id,
                dataType: "text",
                success: function (result) {
                    $("#" + id).remove();
                }
            });
        };

    </script>


</head>
<body>
<div id="wrap">
    <div id="top_content">
        <div id="header">
            <div id="rightheader">
                <p>
                    <script type="text/javascript">
                        function getTime() {
                            var d = new Date().toLocaleString() + ' 星期' + '日一二三四五六'.charAt(new Date().getDay());
                            ;
                            document.getElementById("rightheader").innerHTML = d;
                            window.setTimeout("getTime()", 1000);
                        }

                        window.onload = getTime;
                    </script>


                    <br/>
                </p>
            </div>
            <div id="topheader">
                <h1 id="title">
                    <a href="#">main</a>
                </h1>
            </div>
            <div id="navigation">
            </div>
        </div>
        <div id="content">
            <p id="whereami">
            </p>
            <h1>
                Welcome!
            </h1>
            <table class="table">
                <tr class="table_header">
                    <td>
                        ID
                    </td>
                    <td>
                        Name
                    </td>
                    <td>
                        Salary
                    </td>
                    <td>
                        Age
                    </td>
                    <td>
                        Operation
                    </td>
                </tr>


                <c:forEach items="${requestScope.list}" var="employee" varStatus="status">

                    <tr id="${employee.id}"
                        <c:if test="${employee.id}%2==1">class="row1" </c:if>
                            <c:if test="${employee.id}%2==0">class="row2"</c:if> >
                        <td id="${employee.id}">
                                ${ employee.id}
                        </td>
                        <td>
                                ${ employee.name}
                        </td>
                        <td>
                                ${ employee.salary}
                        </td>
                        <td>
                                ${ employee.age}
                        </td>
                        <td>
                            <a href="#" id="delete" onclick='deleteOne(${ employee.id})'>delete emp</a>&nbsp;<a
                                href="updateEmp.html">update emp</a>
                        </td>
                    </tr>

                </c:forEach>

            </table>
            <p>
                <input type="button" class="button" value="Add Employee"
                       onclick="location='${pageContext.request.contextPath}/addEmp.jsp'"/>
            </p>
        </div>
    </div>
    <div id="footer">
        <div id="footer_bg">
            ABC@126.com
        </div>
    </div>
</div>
</body>
</html>
