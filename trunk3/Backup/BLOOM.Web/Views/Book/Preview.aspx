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
            <strong>作者:</strong>
            <%= Model.Author %>
        </p>
        <p>
            <strong>出版社:</strong>
            <%=Model.Publisher %>
        </p>   
        <p>
            <strong>出版日期:</strong>
            <%=Model.PublicationDate %>
        </p>
        <p>
            <strong>价格:</strong>    
            <%=Model.Price %>
           </p>  
        <p>
        <strong>简介:</strong>
            <%=Model.Extract %>
        </p>
        <p>
         <a href = "/Book/Read/<%=Model.BookId %>/1" >
         <p>立即阅读</p>
        </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <p>
        <%= Html.ActionLink("点击购买","Buy",new {bookID = Model.BookId}) %>
        </p>
       </a>
        </p> 
      
    </fieldset>
    <fieldset>
        <asp:Image ID="remarkinfopic" runat="server" ImageUrl="~/Image/9.jpg" />

        <p>
            <strong>评分:</strong>
            <% if (Model.UserScored == 0) %>
            <%= Html.Encode("暂无人评分")%>
            <% if(Model.UserScored != 0) %>
            <%= Html.Encode("得分:" + (Model.TotalScore.GetValueOrDefault(0) / (float)Model.UserScored.GetValueOrDefault(1)).ToString()) %>
        </p>
        <p>
            <strong>有</strong>
            <%=Html.Encode(Model.ViewedTimes) %>
            <strong>人看过</strong>
        </p>
        <p>
            <strong>相关书评:</strong>
           
        </p>

    </fieldset>
    
</asp:Content>


