<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>�鿴����Ϣ</title>
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
              <font color="#000000"><b>���Ͷ���Ϣ</b>--����������������Ϣ</font></td>
          </tr>
          <tr> 
            <td> <b>�����ˣ�</b></td> 
            <td  valign=middle>
              <input type=text name="incept"  size=70 value="<c:out value='${listMessage.sender}'></c:out>">
            </td>
          </tr>
          <tr> 
            <td  valign=top><b>���⣺</b></td>
            <td  valign=middle>
              <input type=text name="title" size=70 maxlength=80  value="<c:out value='${listMessage.title}'></c:out>">&nbsp;���޶�50����
            </td>
          </tr>
          <tr> 
            <td  valign=top><b>���ݣ�</b><br></td>
            <td  valign=middle>
              <textarea cols=70 rows=8 name="content" title="" ><c:out value="${listMessage.content}"></c:out></textarea>
            </td>
          </tr>
          <tr> 
            <td valign=middle colspan=2  align="right"> 
              <input type=Submit value="�ظ�" name=Submit>
              &nbsp; 
              <input type="reset" name="Clear" value="���">
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
