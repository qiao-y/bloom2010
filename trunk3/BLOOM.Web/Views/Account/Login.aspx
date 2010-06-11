<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" AutoEventWireup="true"%>

<%@ Register Assembly="System.Web.Silverlight" Namespace="System.Web.UI.SilverlightControls"
    TagPrefix="asp" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Login</title>
    <link href="../../Content/Project.css" rel="stylesheet" type="text/css" />
</head>
 <% using (Html.BeginForm()) {%>
    <body id="Login_Body">
        <div id="Login">
                <table border="0" cellspacing="0" cellpadding="0" width="100%">
            	    <tr>
            		    <td><img src="../../Image/Login/login_left.jpg" /></td>
            		   
            		    <td id="Login_Login">
            		         <div>
                               <%= Html.ValidationSummary("信息有误！") %>
                              </div>
            		        <fieldset>
            		    
            		            <p class="Left">
            		                <label for ="Name">用户名： </label>
            		            </p>
            		            <p>
            		                <%=Html.TextBox("Name") %>
            		                <%--<% =Html.ValidationMessage("Name","*") %>--%>
            		            </p>
            		            <p class="Left">
            		                <label for ="Password">密码： </label>
            		            </p>
            		            <p>
            		                <%=Html.Password("Password") %>
            		                <%=Html.ValidationMessage("Password","*") %>
            		            </p>
            		            <p class="Left">
            		                <label for ="ValidateCode">验证码： </label>
            		                <img src="../Account/GetValidateCode" alt="验证码" />
            		            </p>
            		            
            		            <p>
            		                <%=Html.TextBox("ValidateCode") %>
            		            </p>
            		            <p>
            		                <input type="submit" value="登陆"/>
            		                <input type="button" value="忘记密码"/>
            		            </p>
            		        </fieldset>
            		    </td>
            		    <td id="Login_Register">
            		        <p>还没有BLOOM账号？</p>
            		        <p>立刻</p>  
            		        <p> 
            		         <input type="button" value="注册" onclick = "window.location.href='./Register'"/></p>
            		    </td>
            		    <td><img src="../../Image/Login/login_right.jpg" /></td>
            	    </tr>
        
                </table>
        </div>
                <form id="form2" runat="server" style="height:100%;">
        <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>
        <div  style="height:100%;">
            <asp:Silverlight InitParameters="PageName=Page" ID="Silverlight1" runat="server" Source="~/ClientBin/BLOOM.xap" MinimumVersion="2.0.31005.0" Width="100%" Height="100%" />
        </div>
    </form>
        <% } %>

</body>
</html>
