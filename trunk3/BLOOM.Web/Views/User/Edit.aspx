<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Project.Master" Inherits="System.Web.Mvc.ViewPage<BLOOM.Models.User.PersonalInfo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <% using (Html.BeginForm()) {%>
        <h3>个人信息修改</h3>
        <div class="Validate">
             <%= Html.ValidationSummary("注册有误！请更正以下错误：") %>
         </div>
         
        <fieldset>
            <legend>基本信息（必填）</legend>
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
            	<tr>
                    <td style="width: 220px"><label for="UserName">用户名：</label></td>
                    <td><%= Html.TextBox("UserName", Model.UserName) %></td>
                    <td><%= Html.ValidationMessage("UserName", "*") %></td>
                </tr>
                <tr>
                    <td style="width: 220px"><label for="NickName">昵称：</label></td>
                    <td><%= Html.TextBox("NickName", Model.NickName) %></td>
                    <td><%= Html.ValidationMessage("NickName", "*") %></td>
                </tr>
                <tr>
                    <td style="width: 220px"><label for="password">密码：</label></td>
                    <td><%= Html.TextBox("password", Model.password) %></td>
                    <td><%= Html.ValidationMessage("password", "*") %></td>
                </tr>
                <tr>
                    <td style="width: 220px"><label for="Confirmpassword">确认密码：</label></td>
                    <td><%= Html.TextBox("Confirmpassword", Model.Confirmpassword) %></td>
                    <td><%= Html.ValidationMessage("Confirmpassword", "*") %></td>
                </tr>
                <tr>
                    <td style="width: 220px"><label for="PasswordQuestion">密码提示问题：</label></td>
                    <td><%= Html.TextBox("PasswordQuestion", Model.PasswordQuestion) %></td>
                    <td><%= Html.ValidationMessage("PasswordQuestion", "*") %></td>
                </tr>            
                <tr>
                    <td style="width: 220px"><label for="PasswordAnswer">密码提示答案：</label></td>
                    <td><%= Html.TextBox("PasswordAnswer", Model.PasswordAnswer) %></td>
                    <td><%= Html.ValidationMessage("PasswordAnswer", "*") %></td>
                </tr>
                <tr>
                    <td style="width: 220px"><label for="EMail">邮箱：</label></td>
                    <td><%= Html.TextBox("EMail", Model.EMail) %></td>
                    <td><%= Html.ValidationMessage("EMail", "*") %></td>
                </tr>
            </table>
        </fieldset>
        
        <fieldset>
            <legend>详细信息</legend>
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr>
            	    <td style="width: 220px"><label for="Gender">性别：</label></td>             
                    <td><%= Html.DropDownList("Sex", ViewData["Gender"] as SelectList)%></td>
            	</tr>
            	<tr>
            	    <td style="width: 220px"><label for="Age">年龄：</label></td>
            	    <td><%= Html.TextBox("Age", Model.Age) %></td>
            	</tr>
            	<tr>
            		<td style="width: 220px"><label for="Occupation">职业：</label></td>
            		<td><%= Html.DropDownList("Occupation", ViewData["Occupation"] as SelectList)%></td>
            	</tr>
            </table>
        </fieldset>
            <p>
                <input type="submit" value="修改" />
            </p>

    <% } %>

</asp:Content>

