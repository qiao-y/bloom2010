<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<BLOOM.Web.Models.Book.book_BookInfo>" %>

    <%= Html.ValidationSummary("Delete was unsuccessful. There is no such book in the library.") %>

    <% using (Html.BeginForm()) {%>

        <fieldset>
            <p>
                <label for="BookId">��ţ�</label>
                <%= Html.TextBox("BookId") %>
                <%= Html.ValidationMessage("BookId", "*") %>
            </p>
            <p>
                <label for="Title">������</label>
                <%= Html.TextBox("Title") %>
                <%= Html.ValidationMessage("Title", "*") %>
            </p>
            <p>
                <label for="Author">���ߣ�</label>
                <%= Html.TextBox("Author") %>
                <%= Html.ValidationMessage("Author", "*") %>
            </p>
            <p>
                <label for="Publisher">�����磺</label>
                <%= Html.TextBox("Publisher") %>
                <%= Html.ValidationMessage("Publisher", "*") %>
            </p>
            <p>
                <label for="PublicationDate">�������ڣ�</label>
                <%= Html.TextBox("PublicationDate") %>
                <%= Html.ValidationMessage("PublicationDate", "*") %>
            </p>
            <p>
                <label for="Price">���ۣ�</label>
                <%= Html.TextBox("Price") %>
                <%= Html.ValidationMessage("Price", "*") %>
            </p>


            <p>
                <input type="submit" value="ɾ��" />
            </p>
        </fieldset>

    <% } %>



