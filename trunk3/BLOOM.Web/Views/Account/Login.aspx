<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

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
                               <%= Html.ValidationSummary("��Ϣ����") %>
                              </div>
            		        <fieldset>
            		    
            		            <p class="Left">
            		                <label for ="Name">�û����� </label>
            		            </p>
            		            <p>
            		                <%=Html.TextBox("Name") %>
            		                <%--<% =Html.ValidationMessage("Name","*") %>--%>
            		            </p>
            		            <p class="Left">
            		                <label for ="Password">���룺 </label>
            		            </p>
            		            <p>
            		                <%=Html.Password("Password") %>
            		                <%=Html.ValidationMessage("Password","*") %>
            		            </p>
            		            <p class="Left">
            		                <label for ="ValidateCode">��֤�룺 </label>
            		                <img src="../Account/GetValidateCode" alt="��֤��" />
            		            </p>
            		            
            		            <p>
            		                <%=Html.TextBox("ValidateCode") %>
            		            </p>
            		            <p>
            		                <input type="submit" value="��½"/>
            		                <input type="button" value="��������"/>
            		            </p>
            		        </fieldset>
            		    </td>
            		    <td id="Login_Register">
            		        <p>��û��BLOOM�˺ţ�</p>
            		        <p>����</p>  
            		        <p> 
            		         <input type="button" value="ע��" onclick = "window.location.href='./Register'"/></p>
            		    </td>
            		    <td><img src="../../Image/Login/login_right.jpg" /></td>
            	    </tr>
        
                </table>
        </div>
        <% } %>
</body>
</html>
