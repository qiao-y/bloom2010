<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Project.Master" Inherits="System.Web.Mvc.ViewPage<BLOOM.Web.Models.Book.book_BookInfo>" %>
<%@ Import Namespace="BLOOM.Web.Helpers" %>


<asp:Content ID="Title" ContentPlaceHolderID="TitleContent" runat="server">
  Buy:<%=Html.Encode(Model.Title)%>
</asp:Content>


<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="server">


    <fieldset>
        <asp:Image ID="bookinfopic" runat="server" ImageUrl="~/Image/8.jpg" />
        <p>
            <label for="Snapshot">Snapshot:</label>
            <%=Html.Image("snapshot","../Snapshot/"+ Model.BookId,"snapshot") %>
        </p>
        <p>
            <%=Model.Title%>
        </p>
        <p>
            <strong>����:</strong>
            <%= Model.Author %>
        </p>
        <p>
            <strong>������:</strong>
            <%=Model.Publisher %>
        </p>   
        <p>
            <strong>��������:</strong>
            <%=Model.PublicationDate %>
        </p>
        <p>
            <strong>�۸�:</strong>    
            <%=Model.Price %>
           </p>  
        <p>
        <strong>���:</strong>
            <%=Model.Extract %>
        </p>
        <p>
         <a href = "/Book/Read/<%=Model.BookId %>/1" >
         <p>�����Ķ�</p>
        </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <p>
        <%= Html.ActionLink("�������","Buy",new {bookID = Model.BookId}) %>
        </p>
       </a>
        </p> 
      
    </fieldset>
    <fieldset>
        <asp:Image ID="remarkinfopic" runat="server" ImageUrl="~/Image/9.jpg" />

        <p>
            <strong>����:</strong>
              <strong>��</strong>
            <%=Html.Encode(Model.book_BooksViewed) %>
            <strong>�˿���</strong>
        </p>
        <p>
            <strong>�������:</strong>
            <%=Html.Encode(Model.TotalScore) %>
        </p>

    </fieldset>
    
</asp:Content>


