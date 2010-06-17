<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Project.Master" Inherits="System.Web.Mvc.ViewPage<BLOOM.Web.Models.Book.book_BookInfo>" %>
<%@ Import Namespace="BLOOM.Web.Helpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Read
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div id="SideBar_Read">
    <div id="BookInfo_Read">  
    
<% 
    string url;
    if (ViewData["page"].ToString() == "1")
        url = "../../GetPage/";
    else
        url = "../GetPage/"; 
   url += Model.BookId + "/";
   url += ViewData["page"];
 %>
    
   <% = Html.Image("page", url, "page",new {border="4px"})
 %>
         
 </div>
 


<div>
        <p>
       
        <% = Html.ActionLink("<<<", "Read", new { id = Model.BookId, page =int.Parse(ViewData["page"].ToString())-1})%>
        <% = Html.ActionLink(">>>", "Read", new { id = Model.BookId, page =int.Parse(ViewData["page"].ToString())+1})%>
        </p>
   </div>
   </div>     
    


</asp:Content>
