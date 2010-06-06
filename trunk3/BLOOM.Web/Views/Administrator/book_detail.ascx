<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<BLOOM.Models.User.PersonalInfo>" %>

    <fieldset>
        <legend>Fields</legend>
        <p>
            UserName:
            <%= Html.Encode(Model.UserName) %>
        </p>
        <p>
            password:
            <%= Html.Encode(Model.password) %>
        </p>
        <p>
            Confirmpassword:
            <%= Html.Encode(Model.Confirmpassword) %>
        </p>
        <p>
            PasswordQuestion:
            <%= Html.Encode(Model.PasswordQuestion) %>
        </p>
        <p>
            PasswordAnswer:
            <%= Html.Encode(Model.PasswordAnswer) %>
        </p>
        <p>
            NickName:
            <%= Html.Encode(Model.NickName) %>
        </p>
        <p>
            Occupation:
            <%= Html.Encode(Model.Occupation) %>
        </p>
        <p>
            EMail:
            <%= Html.Encode(Model.EMail) %>
        </p>
        <p>
            Age:
            <%= Html.Encode(Model.Age) %>
        </p>
        <p>
            Gender:
            <%= Html.Encode(Model.Gender) %>
        </p>
    </fieldset>
    <p>
        <%=Html.ActionLink("Edit", "Edit", new { /* id=Model.PrimaryKey */ }) %> |
        <%=Html.ActionLink("Back to List", "Index") %>
    </p>


