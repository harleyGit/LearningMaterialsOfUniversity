<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>结果页面</title>
</head>

<body><br/>
<form id="form1" name="form1" method="post" action="">
  <p align="center"><strong>表单 提交<br /></strong></p>
  <table width="331" height="147" border="1" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td width="76" height="35">username：</td>
      <td width="183"><label>
        <%=request.getAttribute("name") %>
      </label></td>
      <td width="50">&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;&nbsp;&nbsp;&nbsp; sex：</td>
      <td> <%= request.getAttribute("sex")%></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;address：</td>
      <td> <%= request.getAttribute("name") %></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;&nbsp; likes：</td>
      <td><label>
       <%= request.getAttribute("likes") %>
      </label></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>
     <a href="index.jsp">back index.jsp<br /></a></td>
      <td>&nbsp;</td>
    </tr>
  </table>
</form>
</body>
</html>
