now = new Date();
  
h=now.getHours();   
m=now.getMinutes();   
s=now.getSeconds();   
setInterval("time_show()",100);   
function time_show()   
{   
  
  s=s+0.1;   
  //h=h+1;   
  
  ss=parseInt(s);   
  
  if (ss>59)   
  {   
    ss=0;   
    s=0;   
    m++;   
  }   
  
  if(m>59)   
  {   
    m=0;   
    h++;   
  }   
  
  d=now.getDate();   
  M=now.getMonth();   
  if(h>23)   
  {   
    h=0;   
    d++;   
  }   
  now.setDate(d);   
  dd=now.getDate();   
  if (dd<d)   
  {   
    now.setMonth(M+1);   
  }   
  MM=now.getMonth()+1;   
  
  hh=h;   
  mm=m;   
  if(h<10) hh='0'+h;    
  if(m<10) mm='0'+m;   
  if(ss<10) ss='0'+ss;   
  timeBox.innerHTML=""+MM+"\u6708"+dd+"\u65e5 "+hh+":"+mm+":"+ss;   
  
}   