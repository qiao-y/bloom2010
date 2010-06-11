<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Project.Master" Inherits="System.Web.Mvc.ViewPage<BLOOM.Models.User.PersonalInfo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	ViewPage1
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>ViewPage1</h2>

    <%= Html.ValidationSummary("Edit was unsuccessful. Please correct the errors and try again.") %>

    <% using (Html.BeginForm()) {%>

        <fieldset>
            <legend>Fields</legend>
            <p>
                <label for="UserName">UserName:</label>
                <%= Html.TextBox("UserName", Model.UserName) %>
                <%= Html.ValidationMessage("UserName", "*") %>
            </p>
            <p>
                <label for="password">password:</label>
                <%= Html.TextBox("password", Model.password) %>
                <%= Html.ValidationMessage("password", "*") %>
            </p>
            <p>
                <label for="Confirmpassword">Confirmpassword:</label>
                <%= Html.TextBox("Confirmpassword", Model.Confirmpassword) %>
                <%= Html.ValidationMessage("Confirmpassword", "*") %>
            </p>
            <p>
                <label for="PasswordQuestion">PasswordQuestion:</label>
                <%= Html.TextBox("PasswordQuestion", Model.PasswordQuestion) %>
                <%= Html.ValidationMessage("PasswordQuestion", "*") %>
            </p>
            <p>
                <label for="PasswordAnswer">PasswordAnswer:</label>
                <%= Html.TextBox("PasswordAnswer", Model.PasswordAnswer) %>
                <%= Html.ValidationMessage("PasswordAnswer", "*") %>
            </p>
            <p>
                <label for="NickName">NickName:</label>
                <%= Html.TextBox("NickName", Model.NickName) %>
                <%= Html.ValidationMessage("NickName", "*") %>
            </p>
            <p>
                <label for="Occupation">Occupation:</label>
                <%= Html.TextBox("Occupation", Model.Occupation) %>
                <%= Html.ValidationMessage("Occupation", "*") %>
            </p>
            <p>
                <label for="EMail">EMail:</label>
                <%= Html.TextBox("EMail", Model.EMail) %>
                <%= Html.ValidationMessage("EMail", "*") %>
            </p>
            <p>
                <label for="Age">Age:</label>
                <%= Html.TextBox("Age", Model.Age) %>
                <%= Html.ValidationMessage("Age", "*") %>
            </p>
            <p>
                <label for="Gender">Gender:</label>
                <%= Html.TextBox("Gender", Model.Gender) %>
                <%= Html.ValidationMessage("Gender", "*") %>
            </p>
            <p>
                <input type="submit" value="Save" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%=Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

