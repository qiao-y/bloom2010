<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Project.Master" Inherits="System.Web.Mvc.ViewPage<BLOOM.Web.Models.Book.book_BookInfo>" %>
<%@ Import Namespace="BLOOM.Web.Helpers" %>
<%@ Register Assembly="System.Web.Silverlight" Namespace="System.Web.UI.SilverlightControls"
    TagPrefix="asp" %>


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
   
   
    <div>
<%--            <form id="form2" runat="server" style="height:100%;">
--%>        <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>
        <div  style="height:100%;">
            <asp:Silverlight InitParameters="PageName=TreeView"
    ID="Silverlight1" runat="server" Source="~/ClientBin/BLOOM.xap" MinimumVersion="2.0.31005.0" Width="100%" Height="100%" />
        </div>
    </form>
    
    </div>


</asp:Content>
