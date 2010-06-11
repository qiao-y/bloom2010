<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<BLOOM.Models.Book.book_BookInfo>" %>

    <%= Html.ValidationSummary("Edit was unsuccessful. Please correct the errors and try again.") %>

    <% using (Html.BeginForm()) {%>

        <fieldset>
            <p>
                <label for="BookId">��ţ�</label>
                <%= Html.TextBox("BookId", Model.BookId) %>
                <%= Html.ValidationMessage("BookId", "*") %>
            </p>
            <p>
                <label for="Title">������</label>
                <%= Html.TextBox("Title", Model.Title) %>
                <%= Html.ValidationMessage("Title", "*") %>
            </p>
            <p>
                <label for="Author">���ߣ�</label>
                <%= Html.TextBox("Author", Model.Author) %>
                <%= Html.ValidationMessage("Author", "*") %>
            </p>

            <p>
                <label for="Publisher">�����磺</label>
                <%= Html.TextBox("Publisher", Model.Publisher) %>
                <%= Html.ValidationMessage("Publisher", "*") %>
            </p>
            <p>
                <label for="PublicationDate">�������ڣ�</label>
                <%= Html.TextBox("PublicationDate", String.Format("{0:g}", Model.PublicationDate)) %>
                <%= Html.ValidationMessage("PublicationDate", "*") %>
            </p>

            <p>
                <label for="Price">���ۣ�</label>
                <%= Html.TextBox("Price", Model.Price) %>
                <%= Html.ValidationMessage("Price", "*") %>
            </p>
            <p>
                <label for="Pages">ҳ����</label>
                <%= Html.TextBox("Pages", Model.Pages) %>
                <%= Html.ValidationMessage("Pages", "*") %>
            </p>
            <p>
                <label for="Extract">��飺</label>
                <%= Html.TextArea("Extract", Model.Extract) %>
                <%= Html.ValidationMessage("Extract", "*") %>
            </p>
            <p>
                <label for="Snapshot">���棺</label>
                <%= Html.TextBox("Snapshot", Model.Snapshot) %>
                <%= Html.ValidationMessage("Snapshot", "*") %>
            </p>
            <p>
                <label for="Path">�ϴ�·����</label>
                <%= Html.TextBox("Path", Model.Path) %>
                <%= Html.ValidationMessage("Path", "*") %>
            </p>
            <p>
                <input type="submit" value="�޸�" />
            </p>
        </fieldset>

    <% } %>



