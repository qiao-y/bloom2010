<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<ArrayList>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	BookSearchResult
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>BookSearchResult</h2>
    
    
    <h3>
    <% foreach (BLOOM.Web.Models.Book.book_BookInfo item in Model) {%>
    <%=  Html.Encode(item.Title)%>
    <%=  Html.Encode(item.ISBN)%>
    <%=  Html.Encode(item.Price)%>
    <%} %>
    </h3>

</asp:Content>
