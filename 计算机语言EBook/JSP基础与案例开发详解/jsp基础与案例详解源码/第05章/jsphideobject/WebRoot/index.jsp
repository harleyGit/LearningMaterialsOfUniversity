<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>表单提交</title>
</head>

<body><br/>
<form id="form1" name="form1" method="post" action="test">
  <p align="center"><strong>表单提交</strong></p>
  <table width="331" height="147" border="1" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td width="76" height="35">username：</td>
      <td width="183"><label>
        <input type="text" name="name" id="textfield"  height="20"/>
      </label></td>
      <td width="50">&nbsp;</td>
    </tr>
    <tr>
      <td>sex：</td>
      <td><input type="radio" name="sex" value="boy"/>boy<input type="radio" name="sex"  value="girl"/>girl</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>address：</td>
      <td><input type="text" name="address" id="textfield3" height="20"/></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>likes：</td>
      <td><label>
      <input type="checkbox" name="likes" id="checkbox" value="sing" />sing
      <input type="checkbox" name="likes" id="checkbox2"  value="dance"/>dance
      <input type="checkbox" name="likes" id="checkbox3"   value="game"/>game
      </label></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><input name="" type="submit" value="submit" />
      <input name="" type="reset" value="reset" /></td>
      <td>&nbsp;</td>
    </tr>
  </table>
</form>
</body>
</html>
