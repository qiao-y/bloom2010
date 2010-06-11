<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Project.Master" Inherits="System.Web.Mvc.ViewPage<BLOOM.Models.User.PersonalInfo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <% using (Html.BeginForm()) {%>
        <h3>������Ϣ�޸�</h3>
        <div class="Validate">
             <%= Html.ValidationSummary("ע��������������´���") %>
         </div>
         
        <fieldset>
            <legend>������Ϣ�����</legend>
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
            	<tr>
                    <td style="width: 220px"><label for="UserName">�û�����</label></td>
                    <td><%= Html.TextBox("UserName", Model.UserName) %></td>
                    <td><%= Html.ValidationMessage("UserName", "*") %></td>
                </tr>
                <tr>
                    <td style="width: 220px"><label for="NickName">�ǳƣ�</label></td>
                    <td><%= Html.TextBox("NickName", Model.NickName) %></td>
                    <td><%= Html.ValidationMessage("NickName", "*") %></td>
                </tr>
                <tr>
                    <td style="width: 220px"><label for="password">���룺</label></td>
                    <td><%= Html.TextBox("password", Model.password) %></td>
                    <td><%= Html.ValidationMessage("password", "*") %></td>
                </tr>
                <tr>
                    <td style="width: 220px"><label for="Confirmpassword">ȷ�����룺</label></td>
                    <td><%= Html.TextBox("Confirmpassword", Model.Confirmpassword) %></td>
                    <td><%= Html.ValidationMessage("Confirmpassword", "*") %></td>
                </tr>
                <tr>
                    <td style="width: 220px"><label for="PasswordQuestion">������ʾ���⣺</label></td>
                    <td><%= Html.TextBox("PasswordQuestion", Model.PasswordQuestion) %></td>
                    <td><%= Html.ValidationMessage("PasswordQuestion", "*") %></td>
                </tr>            
                <tr>
                    <td style="width: 220px"><label for="PasswordAnswer">������ʾ�𰸣�</label></td>
                    <td><%= Html.TextBox("PasswordAnswer", Model.PasswordAnswer) %></td>
                    <td><%= Html.ValidationMessage("PasswordAnswer", "*") %></td>
                </tr>
                <tr>
                    <td style="width: 220px"><label for="EMail">���䣺</label></td>
                    <td><%= Html.TextBox("EMail", Model.EMail) %></td>
                    <td><%= Html.ValidationMessage("EMail", "*") %></td>
                </tr>
            </table>
        </fieldset>
        
        <fieldset>
            <legend>��ϸ��Ϣ</legend>
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr>
            	    <td style="width: 220px"><label for="Gender">�Ա�</label></td>             
                    <td><%= Html.DropDownList("Sex", ViewData["Gender"] as SelectList)%></td>
            	</tr>
            	<tr>
            	    <td style="width: 220px"><label for="Age">���䣺</label></td>
            	    <td><%= Html.TextBox("Age", Model.Age) %></td>
            	</tr>
            	<tr>
            		<td style="width: 220px"><label for="Occupation">ְҵ��</label></td>
            		<td><%= Html.DropDownList("Occupation", ViewData["Occupation"] as SelectList)%></td>
            	</tr>
            </table>
        </fieldset>
            <p>
                <input type="submit" value="�޸�" />
            </p>

    <% } %>

</asp:Content>

