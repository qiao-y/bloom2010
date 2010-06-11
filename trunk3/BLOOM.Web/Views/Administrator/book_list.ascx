<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<BLOOM.Models.Book.book_BookInfo>>" %>

    <table>
        <tr>
            <th></th>
            <th>
                ���
            </th>
            <th>
                ����
            </th>
            <th>
                ����
            </th>
            <th>
                ������
            </th>
            <th>
                ��������
            </th>
            <th>
                ����
            </th>
            <th>
                �ܷ�
            </th>
            <th>
                ����
            </th>

        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%= Html.ActionLink("�鿴", "book_detail", new { id=item.BookId })%> |
                <%= Html.ActionLink("�޸�", "book_edit", new { id=item.BookId }) %> |
                <%= Html.ActionLink("ɾ��", "book_delete",new { id=item.BookId }) %>
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


