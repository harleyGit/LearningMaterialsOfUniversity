<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
  <head>
    <title>�鿴����Ϣ</title>
    <link href="css/forum.css" rel="stylesheet" type="text/css">
  </head>
  
  <body>
  
  <form action="mess?path=delete" method=post name=form>
  <%@ include file="/inc/top.jsp"%>
  <br>
<table width=95% border=0 align="center" cellpadding=0 cellspacing=0 bordercolor="#0099CC" class="table">
<tr>
                <td width=38 align=center valign=middle bgcolor="#99CCFF"><div align="center"><b>�Ѷ�</b></div></td>
    <td width=119 align=center valign=middle bgcolor="#99CCFF"><div align="center"><b>������</b></div></td>
    <td width=277 align=center valign=middle bgcolor="#99CCFF"><div align="center"><b>����</b></div></td>
    <td width=192 align=center valign=middle bgcolor="#99CCFF"><div align="center"><b>����</b></div></td>
    <td width=190 align=center valign=middle bgcolor="#99CCFF"><div align="center"><b>�鿴����</b></div></td>
    <td width=71 align=center valign=middle bgcolor="#99CCFF"><div align="center"><b>����</b></div></td>
  </tr>
    
         <c:choose> 
        <c:when test="${listMessage!=null}">
           <c:forEach items="${listMessage}" var="list">
                <tr>	    
				     
				     <c:choose>
        <c:when test="${list.flag=='0'}">
         <td align=center valign=middle><img src="pic/m_issend_2.gif" title="δ��"><br></td>
        </c:when>
        
        <c:when test="${list.flag=='1'}">
           <td align=center valign=middle><div align="center"><img src="pic/m_issend_1.gif" title="�Ѷ�"><br>
           </div></td>
        </c:when>  
                    </c:choose>
				    
                    <td align=center valign=middle><div align="center">${list.sender}<br>
                  </div></td>
                    <td align=left><div align="center">${list.title}<br>
                  </div></td>
                    <td><div align="center">${list.sendtime}<br>
                  </div></td>
                    <td><div align="center"><a href="mess?path=selectid&id=${list.id}&name=${list.incept}">�鿴����</a></div></td>
                    <td align=center valign=middle width=39><input type=checkbox name=id value="${list.id}"></td>
            
             </tr>
          </c:forEach>
           </c:when>
            
             <c:otherwise>
              <tr>
                <td  align=center valign=middle colspan=6>�����ռ�����û���κ����ݡ�</td>
               </tr>
        </c:otherwise>  
    </c:choose>  
                     
        <tr> 
          <td align=right valign=middle colspan=6>��ʡÿһ�ֿռ䣬�뼰ʱɾ��������Ϣ&nbsp;
          <input type=checkbox name=chkall value=on onClick="CheckAll(this.form)">
          ѡ��������ʾ��¼ <a href="/FlyBBS/message/preMess.jsp">д����Ϣ</a>          &nbsp;
          <input type=submit name=action onClick="{if(confirm('ȷ��ɾ��ѡ���ļ�¼��?')){this.document.inbox.submit();return true;}return false;}" value="ɾ��ѡ����Ϣ">
          &nbsp;
          <input type=submit name=action onClick="{if(confirm('ȷ��������������еļ�¼��?')){this.document.inbox.submit();return true;}return false;}" value="����Ѷ���Ϣ"></td>
    </tr>
    </table>
                <%@ include file="/inc/foot.jsp"%>
  </form>
  </body>
</html>
