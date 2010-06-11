<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Administrator</title>
    <link href="../../Content/Project.css" rel="stylesheet" type="text/css" />
</head>

<body>
    <div id = "Adm_head">
        <img src="../../Image/pic/bloom.jpg" style="width: 30%; height: 30%" /> 
        图书馆内部管理系统</div>
    <div id = "Adm_sidebar">
    	<img id="adm_user" src="../../Image/adm/adm1.jpg" />
    	<img id="adm_book" src="../../Image/adm/adm2.jpg" />
    	<img id="adm_other" src="../../Image/adm/adm3.jpg" />   
    </div>
    <div id = "user_menu">
    </div>
    <div id = "book_menu">
    </div>
    
    <div id="adm_main">
        <% Html.RenderPartial("book_creat"); %>
    </div>
    
</body>
</html>
