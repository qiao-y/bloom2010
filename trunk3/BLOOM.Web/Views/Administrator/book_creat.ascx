<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<BLOOM.Models.Book.book_BookInfo>" %>

    <%= Html.ValidationSummary("Create was unsuccessful. Please correct the errors and try again.") %>

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
                <label for="Author">作者</label>
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
                <label for="Pages">页数：</label>
                <%= Html.TextBox("Pages") %>
                <%= Html.ValidationMessage("Pages", "*") %>
            </p>
            <p>
                <label for="Extract">简介：</label>
                <%= Html.TextArea("Extract") %>
                <%= Html.ValidationMessage("Extract", "*") %>
            </p>
            <p>
                <label for="Snapshot">封面：</label>
                <%= Html.TextBox("Snapshot") %>
                <%= Html.ValidationMessage("Snapshot", "*") %>
            </p>
            <p>
                <label for="Path">上传路径：</label>
                <%= Html.TextBox("Path") %>
                <%= Html.ValidationMessage("Path","*") %>                
            </p>
            
            <p>
                <input type="submit" value="添加" />
            </p>
        </fieldset>

    <% } %>



