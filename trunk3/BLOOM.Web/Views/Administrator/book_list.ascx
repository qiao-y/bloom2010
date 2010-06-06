<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<BLOOM.Models.Book.book_BookInfo>>" %>

    <table>
        <tr>
            <th></th>
            <th>
                编号
            </th>
            <th>
                书名
            </th>
            <th>
                作者
            </th>
            <th>
                出版社
            </th>
            <th>
                出版日期
            </th>
            <th>
                评分
            </th>
            <th>
                总分
            </th>
            <th>
                定价
            </th>

        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%= Html.ActionLink("查看", "book_detail", new { id=item.BookId })%> |
                <%= Html.ActionLink("修改", "book_edit", new { id=item.BookId }) %> |
                <%= Html.ActionLink("删除", "book_delete",new { id=item.BookId }) %>
            </td>
            <td>
                <%= Html.Encode(item.BookId) %>
            </td>
            <td>
                <%= Html.Encode(item.Title) %>
            </td>
            <td>
                <%= Html.Encode(item.Author) %>
            </td>
            <td>
                <%= Html.Encode(item.Publisher) %>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0:g}", item.PublicationDate)) %>
            </td>

            <td>
                <%= Html.Encode(item.UserScored) %>
            </td>
            <td>
                <%= Html.Encode(item.TotalScore) %>
            </td>
            <td>
                <%= Html.Encode(item.Price) %>
            </td>



        </tr>
    
    <% } %>

    </table>

    <p>
        <%= Html.ActionLink("Create New", "Create") %>
    </p>


