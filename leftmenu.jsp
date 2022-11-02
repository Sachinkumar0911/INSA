<%@page import="java.util.Iterator"%>
<%@page import="com.sits.menu.TreeMenuBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sits.menu.TreeMenu"%>
<%@page import="com.sits.general.ReadProps"%>
<%@include file="myCks.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content='width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no' />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Cache-Control"  content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<title><%=ReadProps.getkeyValue("welcome.title", "sitsResource") %></title>
<script src="js/treemenu/jquery.js" type="text/javascript"></script>
<script src="js/treemenu/jquery-ui.js" type="text/javascript"></script>
<script src="js/treemenu/jquery.cookie.js" type="text/javascript"></script>
<script src="js/treemenu/jquery.dynatree.js" type="text/javascript"></script>
<link href="css/ui.dynatree.css" rel="stylesheet" type="text/css" id="skinSheet">
<link href="css/commonStyle.css" type="text/css">
<style type="text/css">
.treeboxheader1{    
   font-family:verdana; 
   font-size:11px;
   height: 13px;
   background-image: -ms-linear-gradient(bottom, #79BAEC 0%, #9CD5FF 100%); /*ie10*/  
   filter: progid:DXImageTransform.Microsoft.Gradient(gradientType=0,startColorStr=#79BAEC,endColorStr=#9CD5FF);
   /* background: -moz-linear-gradient(top, #79BAEC 0%, #9CD5FF 100%);     
   background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#79BAEC), color-stop(100%,#9CD5FF));  */ 
   background:#201212;
   background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#201212), color-stop(100%,#201212));
 }

::-webkit-scrollbar {
    height: 12px;
  width: 12px;
  background: #EEEEEE;
 }
::-webkit-scrollbar-thumb {
    background: #DAF0FF;
    -webkit-border-radius: 5px;
    -webkit-box-shadow: 0px 1px 2px rgba(0, 77, 132, 0.80);
}
::-webkit-scrollbar-corner {
    background: #E2E2E2;
} 
.dynatree-title{
 cursor: pointer;
}

</style>

<script type="text/javascript">
function LTrim( value ) {
    var re = /\s*((\S+\s*)*)/;
    return value.replace(re, "$1");
  }
  function movetofirstRecord(x) {
    document.getElementById(x).focus();
  }
  function RTrim( value ) {
    var re = /((\s*\S+)*)\s*/;
    return value.replace(re, "$1");
  }
  function trim( value ) {
    return LTrim(RTrim(value));
  }

function trim1(s)
{
   return s.replace(/(^\s+)|(\s+$)/g, "");
}


  function ajaxFunction() {
    var xmlHttp;
    try {
      // Firefox, Opera 8.0, Safari
      xmlHttp=new XMLHttpRequest();
    } catch (e){
      // Internet Explorer
      try{
        xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
      } catch (e) {
        try{
          xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
        } catch (e) {
          alert(1);
        }
      }
    }
    return xmlHttp;
  }

   function uppCase(a) {
    var s=a.value
    if(s!=""){
     var str=""
     var s=a.value
     var l=s.length
     for(i=0;i<l;i++) {
       str=str+s.charAt(i)
     }
     var str1=str.toUpperCase()
     a.value=str1
    }
   }

function submenuitem2(filename,p,m) {//alert("1 :"+filename+"|"+p+"|"+m);
  xmlH1=ajaxFunction();
    s="menu_access.jsp?txtperm="+p+"&txtmnu="+m+"&xuser_id=<%=user_id%>";
    executesubmenuitem(xmlH1,s,filename,p);
}

function executesubmenuitem(xmlHttp1,url,fname,p) {//alert("leftmenu : "+url);
  xmlHttp1.onreadystatechange = function() {//alert(xmlHttp1.readyState+" | "+xmlHttp1.status);
    if (xmlHttp1.readyState == 4 && xmlHttp1.status == 200 ) {
      var dobj = document.getElementById("ajaxMenu");
        x=xmlHttp1.responseText;
        dobj.innerHTML = trim(x);
        //var z = document.getElementById("recflag").value;
        //submenuitem1(fname,p);
    }
  }
  xmlHttp1.open("POST",url,true);
  xmlHttp1.send(url);
}

function submenuitem(filename,p,m,pname){//debugger;
	if(	(pname == '<%=ReadProps.getkeyValue("fms.war", "sitsResource")%>') || (pname == '<%=ReadProps.getkeyValue("snp.war", "sitsResource")%>') 
		|| (pname == '<%=ReadProps.getkeyValue("itax.war", "sitsResource")%>') || (pname == '<%=ReadProps.getkeyValue("preadmission.war", "sitsResource")%>')
		|| (pname == '<%=ReadProps.getkeyValue("hostel.war", "sitsResource")%>') || (pname == '<%=ReadProps.getkeyValue("hostelfee.war", "sitsResource")%>')
		|| (pname == '<%=ReadProps.getkeyValue("recruitment.war", "sitsResource")%>') || (pname == '<%=ReadProps.getkeyValue("asset.war", "sitsResource")%>')
		|| (pname == '<%=ReadProps.getkeyValue("studattendance.war", "sitsResource")%>') || (pname == '<%=ReadProps.getkeyValue("research.war", "sitsResource")%>')
		|| (pname == '<%=ReadProps.getkeyValue("alumni.war", "sitsResource")%>') || (pname == '<%=ReadProps.getkeyValue("dispensary.war", "sitsResource")%>')
		|| (pname == '<%=ReadProps.getkeyValue("guesthouse.war", "sitsResource")%>')
	){
		p = '<%=ReadProps.getkeyValue("package.url", "sitsResource")%>'+pname+'/'+p;
	}
	//alert("url : "+p+"|"+pname);
	parent.soaright.addTab(filename,p,m,1);
}

function submenuitem1(filename,p) {//alert("2 :"+filename+"|"+p);
   try {
    f1.action= filename;
    f1.submit();
   } catch (err) {
     alert(err);
   }  
}


$.ui.dynatree.nodedatadefaults["icon"] = false;
$(function(){
  $("#tree").dynatree({    
        minExpandLevel: 2,
        onActivate: function(node) {//alert("node : "+node);
        var r= isNaN(parseFloat(node.data.key));
      //alert(node.data.key); 
      if (r) {
          x1=node.data.key;
      		if (x1.substring(0,1)=="#") {
          		url=x1.substring(1)+"&title="+node.data.title;//alert("OM : "+url);
            	window.showModalDialog(node.data.key, top, "dialogWidth:400px;dialogHeight:150px");
          		w = window.open(url, 'w', 'width=400,height=150,left=200,top=200');
          		w.focus();
            } else {//alert("OM1 : "+node.data.title+" ~ "+node.data.key);
              //parent.soaright.addTab(node.data.title,node.data.key,1);
              submenuitem(p,filename,m);
          }
      }  
        }
    });      
});   

$(document).ready(function() {
    $("#idiv1").hide();
      $("#idiv2").click(function () {
        $("#div2").hide("slide", { direction: "left" }, 100,function(){
            $("#idiv2").hide(100,function(){
                $("#idiv1").show();
                parent.document.getElementById('itree_tab_msg').setAttribute('cols', '20,*');
              });
          });
      });
  });

$(document).ready(function() {
    $("#idiv1").click(function () {
        $("#idiv1").hide();
          $("#idiv2").show();
          $("#div2").show("slide", { direction: "right" }, 1);      
          $("#idiv1").hide(); 
          parent.document.getElementById('itree_tab_msg').setAttribute('cols', '300,*');
      });
  });


document.onkeydown = function (evt) {
    var keyCode = evt ? (evt.which ? evt.which : evt.keyCode) : event.keyCode;
    if (keyCode == 123){ 
      return false;
    }else {
      return true;
    }
};
</script>
<%
  response.setHeader("Cache-Control","no-store"); //HTTP 1.1
  response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");   
  response.setHeader("Pragma","no-cache"); //HTTP 1.0
  response.setDateHeader ("Expires", -1); //prevents caching at the proxy
%>
</head>
<!-- <body topmargin="0" leftmargin="0" rightmargin="0" oncontextmenu="return false"> -->
<body topmargin="0" leftmargin="0" rightmargin="0">
<form name="f1" action="" method="post" target="soaright">
<div class="div1-box" id="div1" style="background-color: #0c426f;">
<table width="100%" cellspacing="0" cellpadding="0" border="0"  style="background-color: #0c426f;">
<tr>
  <td width="9%" align="left" ><img src="images/exp1.png" title="Expand menu bar." id="idiv1"></td>     
</tr>  
</table>
</div>
<div id="div2" style="border:0px solid #00799A;">
<table width="100%" cellspacing="0" cellpadding="0" border="0" style="border:0px solid #000000; background-color:  #201212;">
<tr>
  <td width="99%" align="right" class="treeboxheader1" ><img src="images/shr1.png" title="Shrink menu bar." id="idiv2" ></td>
</tr>
</table>
<% 

  //String role_id=General.checknull((String)session.getAttribute("s_role_id"));
  //System.out.println("leftmenu.jsp : "+ddoLoctId);
  String sql="", sel="", sql1="", sel1="";
  TreeMenu TreeMenuDAO = new TreeMenu();
  ArrayList<TreeMenuBean> TreeMenuList0 = TreeMenuDAO.getResult("tree_menu",user_status,user_id,suser_type);  
  Iterator it0 = TreeMenuList0.iterator();
%>
<div id="myDivbaby" style="width:100%;height:98vh !important;overflow:auto;border:0px solid #000000;background-color: #0c426f;"> /* height:550px */
<table width="100%" cellspacing="0" cellpadding="0" border="0" height="100%" style="background-color: #201212;">
<tr>
  <td valign="top">
  <div id="tree" style="border:0px solid #000000;">
  <ul id="treeData">
  <% 
    while(it0.hasNext()){
      TreeMenuBean tmBean0 = (TreeMenuBean)it0.next();
      sel = tmBean0.getMenuPrompt();
  %>
  <li id="<%=tmBean0.getMenu_Id() %>" class="folder"><%=sel%>
  <ul>
  <%
    ArrayList<TreeMenuBean> TreeMenuList1 = TreeMenuDAO.getResult1(tmBean0.getChild_id(),"tree_menu",user_status,user_id,suser_type);
    Iterator<TreeMenuBean> it1 = TreeMenuList1.iterator();
    while(it1.hasNext()) {
      TreeMenuBean tmBean1 = (TreeMenuBean)it1.next();
      sel1 = tmBean1.getMenuPrompt();
      int subMenu0 = tmBean1.getNoSubMenu();
      if(subMenu0 > 0){
  %>
      <li id="<%=tmBean1.getMenu_Id() %>" class="folder"><%=sel1 %>
      <ul>
      <% 
        ArrayList<TreeMenuBean> TreeMenuList2 = TreeMenuDAO.getResult2(tmBean1.getMenu_Id(),"tree_menu",user_status,user_id,suser_type);
        Iterator<TreeMenuBean> it2 = TreeMenuList2.iterator();
        while(it2.hasNext()){
          TreeMenuBean tmBean2 = (TreeMenuBean)it2.next();
          sel1 = Integer.toString(tmBean2.getMenu_Id());
          int subMenu1 = tmBean2.getNoSubMenu();
          if(subMenu1 > 0){
      %>
        <li id="<%=tmBean2.getMenu_Id() %>" class="folder"><%=tmBean2.getMenuPrompt() %>
        <ul>
      <% 
        ArrayList<TreeMenuBean> TreeMenuList3 = TreeMenuDAO.getResult3(tmBean2.getMenu_Id(),"tree_menu",user_status,user_id,suser_type);
        Iterator<TreeMenuBean> it3 = TreeMenuList3.iterator();
        while(it3.hasNext()){
          TreeMenuBean tmBean3 = (TreeMenuBean)it3.next();
          int subMenu2 = tmBean3.getNoSubMenu();
          if(subMenu2 > 0) {
      %>
      	<li id="<%=tmBean3.getMenu_Id() %>" class="folder"><%=tmBean3.getMenuPrompt() %>
      	<ul>	
      <%  	  
	      ArrayList<TreeMenuBean> TreeMenuList4 = TreeMenuDAO.getResult4(tmBean3.getMenu_Id(),"tree_menu",user_status,user_id,suser_type);
	      Iterator<TreeMenuBean> it4 = TreeMenuList4.iterator();
	      while(it4.hasNext()){
	        TreeMenuBean tmBean4 = (TreeMenuBean)it4.next();
	  %>
	  	<li id="<%=tmBean4.getMenuPrompt()%>" class="folder"><a href="javascript:submenuitem('<%=tmBean4.getMenuPrompt() %>','<%=tmBean4.getJspFile() %>','<%=tmBean4.getPageType() %>^<%=tmBean4.getMenu_Id() %>','<%=tmBean4.getPackageName() %>')"  data-page-id=<%=tmBean4.getMenu_Id() %> page_type=<%=tmBean4.getPageType() %> data-title=<%=tmBean4.getMenuPrompt() %> style="width: 90px;"><%=tmBean4.getMenuPrompt() %></a>
	  <%      
	      }
	  %>
	  	</ul>
	  <%    
          } else {
      %>
        <li id="<%=tmBean3.getMenuPrompt()%>" class="folder"><a href="javascript:submenuitem('<%=tmBean3.getMenuPrompt()%>','<%=tmBean3.getJspFile() %>','<%=tmBean3.getPageType() %>^<%=tmBean3.getMenu_Id() %>','<%=tmBean3.getPackageName() %>')" data-page-id=<%=tmBean3.getMenu_Id() %> page_type=<%=tmBean3.getPageType() %> data-title=<%=tmBean3.getMenuPrompt() %> style="width: 90px;"><%=tmBean3.getMenuPrompt() %></a>
      <%}}%>    
        </ul>
      <% } else { %>
          <li id="<%=tmBean2.getMenuPrompt() %>" class="folder"><a href="javascript:submenuitem('<%=tmBean2.getMenuPrompt() %>','<%=tmBean2.getJspFile() %>','<%=tmBean2.getPageType()%>^<%=tmBean2.getMenu_Id()%>','<%=tmBean2.getPackageName() %>')" data-page-id=<%=tmBean2.getMenu_Id() %> page_type=<%=tmBean2.getPageType() %> data-title=<%=tmBean2.getMenuPrompt() %> style="width: 90px;"><%=tmBean2.getMenuPrompt() %></a>
      <%      
          }
        }
      %>
      </ul>
  <%      
      } else {
  %>
        <li id="<%= tmBean1.getMenuPrompt() %>" class="folder"><%=tmBean1.getMenuPrompt()%>    
  <%  
      }
    }
  %>
  </ul>
  <%    
    }
  %>
  </ul>
  </div>
  </td>
</tr>
</table>
</div>
</div>
<div id="ajaxMenu" style="display:none;"></div>
</form>
<script type="text/javascript">
var frame = parent.document.getElementById("isoaleft");
document.getElementById("myDivbaby").style.height = frame.scrollHeight-20+"px"; 
//alert(document.getElementById("myDivbaby").style.height+"|"+frame.scrollWidth);
</script>
</body>
</html>