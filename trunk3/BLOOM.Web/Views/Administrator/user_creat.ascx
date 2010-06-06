<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<BLOOM.Models.User.PersonalInfo>" %>

    <%= Html.ValidationSummary("Create was unsuccessful. Please correct the errors and try again.") %>

    <% using (Html.BeginForm()) {%>

        <fieldset>
            <p>
                <label for="UserName">用户名:</label>
                <%= Html.TextBox("UserName") %>
                <%= Html.ValidationMessage("UserName", "*") %>
            </p>
            <p>
                <label for="NickName">昵称：</label>
                <%= Html.TextBox("NickName") %>
                <%= Html.ValidationMessage("NickName", "*") %>
            </p>
            <p>
                <label for="password">密码:</label>
                <%= Html.Password("password") %>
                <%= Html.ValidationMessage("password", "*") %>
            </p>
            <p>
                <label for="Confirmpassword">确认密码：</label>
                <%= Html.Password("Confirmpassword") %>
                <%= Html.ValidationMessage("Confirmpassword", "*") %>
            </p>
            <p>
                <label for="PasswordQuestion">密码提示问题：</label>
                <%= Html.TextBox("PasswordQuestion") %>
                <%= Html.ValidationMessage("PasswordQuestion", "*") %>
            </p>
            <p>
                <label for="PasswordAnswer">密码提示答案：</label>
                <%= Html.TextBox("PasswordAnswer") %>
                <%= Html.ValidationMessage("PasswordAnswer", "*") %>
            </p>
            <p>
                <label for="EMail">邮箱：</label>
                <%= Html.TextBox("EMail") %>
                <%= Html.ValidationMessage("EMail", "*") %>
            </p>

            <p>
                <input type="submit" value="添加" />
            </p>
        </fieldset>

    <% } %>

