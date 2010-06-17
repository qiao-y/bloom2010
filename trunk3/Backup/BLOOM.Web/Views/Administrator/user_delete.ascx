<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<BLOOM.Models.User.PersonalInfo>" %>

    <%= Html.ValidationSummary("Delete was unsuccessful. There is no such user in the library.") %>

    <% using (Html.BeginForm()) {%>

        <fieldset>
            <p>
                <label for="UserName">”√ªß√˚£∫</label>
                <%= Html.TextBox("UserName") %>
                <%= Html.ValidationMessage("UserName", "*") %>
            </p>
            <p>
                <label for="NickName">Í«≥∆£∫</label>
                <%= Html.TextBox("NickName") %>
                <%= Html.ValidationMessage("NickName", "*") %>
            </p>

            <p>
                <label for="EMail">” œ‰£∫</label>
                <%= Html.TextBox("EMail") %>
                <%= Html.ValidationMessage("EMail", "*") %>
            </p>

            <p>
                <input type="submit" value="…æ≥˝" />
            </p>
        </fieldset>

    <% } %>




