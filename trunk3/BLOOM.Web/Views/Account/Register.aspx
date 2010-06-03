<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<BLOOM.Models.User.aspnet_AccountInfo>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Register</title>
    <link href="../../Content/Project.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            height: 19px;
            width:180px;
        }
    </style>
</head>
<body>

    <% using (Html.BeginForm()) {%>
        
        <div class="Sidebar_Register">
            <div>
                <asp:Image ID="Image2" runat="server" 
                    ImageUrl="~/Image/pic/bloom.jpg" Height="100%" Width="100%" />  
            </div>
            <div class="Step">
                <h3>注册流程</h3>
                <ul>
        	        <li class="Current">1.填写注册信息</li>
        	        <li>2.完成注册</li>
                </ul>
            </div>
        </div>
        
        <div class="Main_Register">
            <div id="Title_Register">
                <h3>欢迎注册BLOOM在线数字图书馆！</h3>
                <h3>享受最棒的在线阅读体验。</h3>
                <p>请认真填写以下各项信息，网站保证不对外泄露任何个人信息</p>
            </div>
            <div>
              <%= Html.ValidationSummary("Create was unsuccessful. Please correct the errors and try again.") %>
            </div>
            <fieldset id="BasicInfo">
                <legend>基本信息(必填)</legend>
                <table class="Table_Register" border="0" cellspacing="0" cellpadding="0" width="100%">
            	    <tr>
            		    <td><label for="UserName">用户名：</label></td>
            		    <td><%= Html.TextBox("UserName") %></td>
            		    <td><%= Html.ValidationMessage("UserName", "*") %></td>
            	    </tr>
            	    <tr>
            	        <td><label for="NickName">昵称：</label></td>
            	        <td><%= Html.TextBox("NickName") %></td>
            	        <td><%= Html.ValidationMessage("NickName", "*") %></td>
            	    </tr>
            	    <tr>
            	        <td><label for="Password">密码：</label></td>
            	        <td><%= Html.Password("Password") %></td>
            	        <td><%= Html.ValidationMessage("Password", "*") %></td>
            	    </tr>
            	    <tr>
            	        <td><label for="Confirmpassword">确认密码：</label></td>
            	        <td><%= Html.Password("Confirmpassword") %></td>
            	        <td><%= Html.ValidationMessage("Confirmpassword", "*") %></td>
            	    </tr>
            	    <tr>
            	        <td class="style1"><label for="PasswordQuestion">密码提示问题：</label></td>
            	        <td class="style1"><%= Html.TextBox("PasswordQuestion") %></td>
            	        <td class="style1"><%= Html.ValidationMessage("PasswordQuestion", "*") %></td>
            	    </tr>
            	    <tr>
            	        <td><label for="PasswordAnswer">密码提示答案：</label></td>
            	        <td><%= Html.TextBox("PasswordAnswer") %></td>
            	        <td><%= Html.ValidationMessage("PasswordAnswer", "*") %></td>
            	    </tr>
            	    <tr>
            	        <td><label for="EMail">邮箱：</label></td>
            	        <td><%= Html.TextBox("EMail") %></td>
            	        <td><%= Html.ValidationMessage("EMail", "*") %></td>
            	    </tr>
                </table>
            </fieldset>
            
            <div id="Partition">
                <img src="../../Image/02hisila3.gif" alt="..."/>
            </div>

        
            <fieldset id="FurtherInfo">
                <legend>详细信息</legend>
                <table class="Table_Register" border="0" cellspacing="0" cellpadding="0" width="100%">
            	    <tr>
            		    <td><label for="Age">年龄：</label></td>
            		    <td><%= Html.TextBox("Age") %></td>
            	    </tr>
            	    <tr>
            	        <td><label for="Gender">性别：</label></td>
            	        <td><%= Html.DropDownList("Sex", ViewData["Gender"] as SelectList)%></td>
            	    </tr>
            	    <tr>
            	        <td><label for="Occupation">职业：</label></td>
            	        <td><%= Html.DropDownList("Occupation", ViewData["Occupation"] as SelectList)%></td>
            	    </tr>
                </table>
            </fieldset>
            
            <p id="Submit_Register">
                <input type="submit" value="提交" />
            </p>
        </div>


    <% } %>


</body>
</html>

