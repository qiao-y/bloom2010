<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Project.Master" Inherits="System.Web.Mvc.ViewPage<BLOOM.Models.Book.book_BookInfo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Read
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div id="SideBar_Read">
    <div id="BookInfo_Read">
        <%=Model.Snapshot %>
        <p>
        <%=Model %>
        </p>
    </div>
    <div id="BookCatalog_Read">
    </div>
    <div id="Tools_Read">
    </div>
</div>
<div id="MainBar_Read">
    <textarea rows="60" id="contactus" name="contactus" readonly="readonly" 
        style="width: 655px">
        <%= Model.ToString()%>
    </textarea> 
    <div>
        <p>
        <% = Html.ActionLink("<<<", "Read", new { id = ViewData["id"], page =int.Parse(ViewData["page"].ToString())-1})%>
        <% = Html.ActionLink(">>>", "Read", new { id = ViewData["id"], page =int.Parse(ViewData["page"].ToString())+1})%>
        </p>
   </div>     
</div>
    


</asp:Content>
