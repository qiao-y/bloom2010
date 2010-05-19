<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Project.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Read
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>∂¡ È</h2>
    
     <textarea cols="120" rows="60" id="contactus" name="contactus">

    <%= Model.ToString()%>

</textarea> 
   <div>
     <p>
        <% = Html.ActionLink("<<<", "Read", new { id = ViewData["id"], page =int.Parse(ViewData["page"].ToString())-1})
         %>
   <% = Html.ActionLink(">>>", "Read", new { id = ViewData["id"], page =int.Parse(ViewData["page"].ToString())+1})
         %>
         </p>
   </div> 
</asp:Content>
