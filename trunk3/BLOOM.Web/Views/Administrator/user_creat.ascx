<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<BLOOM.Models.User.PersonalInfo>" %>

    <%= Html.ValidationSummary("Create was unsuccessful. Please correct the errors and try again.") %>

    <% using (Html.BeginForm()) {%>

        <fieldset>
            <p>
                <label for="UserName">�û���:</label>
                <%= Html.TextBox("UserName") %>
                <%= Html.ValidationMessage("UserName", "*") %>
            </p>
            <p>
                <label for="NickName">�ǳƣ�</label>
                <%= Html.TextBox("NickName") %>
                <%= Html.ValidationMessage("NickName", "*") %>
            </p>
            <p>
                <label for="password">����:</label>
                <%= Html.Password("password") %>
                <%= Html.ValidationMessage("password", "*") %>
            </p>
            <p>
                <label for="Confirmpassword">ȷ�����룺</label>
                <%= Html.Password("Confirmpassword") %>
                <%= Html.ValidationMessage("Confirmpassword", "*") %>
            </p>
            <p>
                <label for="PasswordQuestion">������ʾ���⣺</label>
                <%= Html.TextBox("PasswordQuestion") %>
                <%= Html.ValidationMessage("PasswordQuestion", "*") %>
            </p>
            <p>
                <label for="PasswordAnswer">������ʾ�𰸣�</label>
                <%= Html.TextBox("PasswordAnswer") %>
                <%= Html.ValidationMessage("PasswordAnswer", "*") %>
            </p>
            <p>
                <label for="EMail">���䣺</label>
                <%= Html.TextBox("EMail") %>
                <%= Html.ValidationMessage("EMail", "*") %>
            </p>

            <p>
                <input type="submit" value="���" />
            </p>
        </fieldset>

    <% } %>

