<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>查看短消息</title>
</head>
<body>
<%@ include file="/inc/top.jsp"%>

<form action="mess?path=reply" method=post name=messager>
  <c:forEach items="${listMessage}" var="listMessage">
  <input type="hidden" name="sender" value="${listMessage.incept}">
  <input type="hidden" name="incept" value="${listMessage.sender}">
  <table cellpadding=0 cellspacing=0 border=0  bgcolor="" align=center>
    <tr> 
      <td> 
        <table cellpadding=3 cellspacing=1 border=0 width=100%>
          <tr> 
            <td colspan=2 align=center> 
              <font color="#000000"><b>发送短消息</b>--请完整输入下列信息</font></td>
          </tr>
          <tr> 
            <td> <b>发件人：</b></td> 
            <td  valign=middle>
              <input type=text name="incept"  size=70 value="<c:out value='${listMessage.sender}'></c:out>">
            </td>
          </tr>
          <tr> 
            <td  valign=top><b>标题：</b></td>
            <td  valign=middle>
              <input type=text name="title" size=70 maxlength=80  value="<c:out value='${listMessage.title}'></c:out>">&nbsp;请限定50字内
            </td>
          </tr>
          <tr> 
            <td  valign=top><b>内容：</b><br></td>
            <td  valign=middle>
              <textarea cols=70 rows=8 name="content" title="" ><c:out value="${listMessage.content}"></c:out></textarea>
            </td>
          </tr>
          <tr> 
            <td valign=middle colspan=2  align="right"> 
              <input type=Submit value="回复" name=Submit>
              &nbsp; 
              <input type="reset" name="Clear" value="清除">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  </c:forEach>
</form>
<%@ include file="/inc/foot.jsp"%>

</body>
</html>
