<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Project.Master" Inherits="System.Web.Mvc.ViewPage<BLOOM.Models.User.PersonalInfo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	User1
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="PersonalAccount">
        <p>
              欢迎回来
              <%= Html.Encode(Model.NickName) %>
         </p>
         <table border="0" cellspacing="0" cellpadding="0" width="100%" 
            style="height: 134px">
         	<tr>
         		<td>性别：</td>
         		<td><%= Html.Encode(Model.Gender) %></td>
         	</tr>
         	<tr>
         	    <td>年龄：</td>
         	    <td><%= Html.Encode() %></td>
         	</tr>
         	<tr>
         	    <td>职业：</td>
         	    <td><%= Html.Encode(Model.Occupation) %></td>
         	</tr>
         	<tr>
         	    <td>邮箱：</td>
         	    <td><%= Html.Encode(Model.EMail) %></td>
         	</tr>
         	<tr>
         	    <td>账户余额：</td>
         	    <td><%=Html.Encode() %></td>
         	</tr>
         	<tr>
         	    <td>充值</td>
         	    <td>修改个人信息</td>
         	</tr>
         </table>
    </div>
    
    <div id="NowReading">
        <p>这里是我正在看的书</p>
    </div>
    <div id="MoreUserInfo">
        <p>这里是我写过的书评、为我推荐的书等等</p>
    </div>
    
</asp:Content>

