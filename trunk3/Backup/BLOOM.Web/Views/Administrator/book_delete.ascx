<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<BLOOM.Web.Models.Book.book_BookInfo>" %>

    <%= Html.ValidationSummary("Delete was unsuccessful. There is no such book in the library.") %>

    <% using (Html.BeginForm()) {%>

        <fieldset>
            <p>
                <label for="BookId">编号：</label>
                <%= Html.TextBox("BookId") %>
                <%= Html.ValidationMessage("BookId", "*") %>
            </p>
            <p>
                <label for="Title">书名：</label>
                <%= Html.TextBox("Title") %>
                <%= Html.ValidationMessage("Title", "*") %>
            </p>
            <p>
                <label for="Author">作者：</label>
                <%= Html.TextBox("Author") %>
                <%= Html.ValidationMessage("Author", "*") %>
            </p>
            <p>
                <label for="Publisher">出版社：</label>
                <%= Html.TextBox("Publisher") %>
                <%= Html.ValidationMessage("Publisher", "*") %>
            </p>
            <p>
                <label for="PublicationDate">出版日期：</label>
                <%= Html.TextBox("PublicationDate") %>
                <%= Html.ValidationMessage("PublicationDate", "*") %>
            </p>
            <p>
                <label for="Price">定价：</label>
                <%= Html.TextBox("Price") %>
                <%= Html.ValidationMessage("Price", "*") %>
            </p>


            <p>
                <input type="submit" value="删除" />
            </p>
        </fieldset>

    <% } %>



