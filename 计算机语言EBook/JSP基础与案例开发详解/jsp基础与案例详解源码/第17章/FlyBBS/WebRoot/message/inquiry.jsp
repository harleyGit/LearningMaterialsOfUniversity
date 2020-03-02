<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
  <head>
    <title>查看短消息</title>
    <link href="css/forum.css" rel="stylesheet" type="text/css">
  </head>
  
  <body>
  
  <form action="mess?path=delete" method=post name=form>
  <%@ include file="/inc/top.jsp"%>
  <br>
<table width=95% border=0 align="center" cellpadding=0 cellspacing=0 bordercolor="#0099CC" class="table">
<tr>
                <td width=38 align=center valign=middle bgcolor="#99CCFF"><div align="center"><b>已读</b></div></td>
    <td width=119 align=center valign=middle bgcolor="#99CCFF"><div align="center"><b>发送人</b></div></td>
    <td width=277 align=center valign=middle bgcolor="#99CCFF"><div align="center"><b>主题</b></div></td>
    <td width=192 align=center valign=middle bgcolor="#99CCFF"><div align="center"><b>日期</b></div></td>
    <td width=190 align=center valign=middle bgcolor="#99CCFF"><div align="center"><b>查看详情</b></div></td>
    <td width=71 align=center valign=middle bgcolor="#99CCFF"><div align="center"><b>操作</b></div></td>
  </tr>
    
         <c:choose> 
        <c:when test="${listMessage!=null}">
           <c:forEach items="${listMessage}" var="list">
                <tr>	    
				     
				     <c:choose>
        <c:when test="${list.flag=='0'}">
         <td align=center valign=middle><img src="pic/m_issend_2.gif" title="未读"><br></td>
        </c:when>
        
        <c:when test="${list.flag=='1'}">
           <td align=center valign=middle><div align="center"><img src="pic/m_issend_1.gif" title="已读"><br>
           </div></td>
        </c:when>  
                    </c:choose>
				    
                    <td align=center valign=middle><div align="center">${list.sender}<br>
                  </div></td>
                    <td align=left><div align="center">${list.title}<br>
                  </div></td>
                    <td><div align="center">${list.sendtime}<br>
                  </div></td>
                    <td><div align="center"><a href="mess?path=selectid&id=${list.id}&name=${list.incept}">查看详情</a></div></td>
                    <td align=center valign=middle width=39><input type=checkbox name=id value="${list.id}"></td>
            
             </tr>
          </c:forEach>
           </c:when>
            
             <c:otherwise>
              <tr>
                <td  align=center valign=middle colspan=6>您的收件箱中没有任何内容。</td>
               </tr>
        </c:otherwise>  
    </c:choose>  
                     
        <tr> 
          <td align=right valign=middle colspan=6>节省每一分空间，请及时删除无用信息&nbsp;
          <input type=checkbox name=chkall value=on onClick="CheckAll(this.form)">
          选中所有显示记录 <a href="/FlyBBS/message/preMess.jsp">写短消息</a>          &nbsp;
          <input type=submit name=action onClick="{if(confirm('确定删除选定的纪录吗?')){this.document.inbox.submit();return true;}return false;}" value="删除选定消息">
          &nbsp;
          <input type=submit name=action onClick="{if(confirm('确定清除发件箱所有的纪录吗?')){this.document.inbox.submit();return true;}return false;}" value="清空已读信息"></td>
    </tr>
    </table>
                <%@ include file="/inc/foot.jsp"%>
  </form>
  </body>
</html>
