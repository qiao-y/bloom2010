<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Project.Master" Inherits="System.Web.Mvc.ViewPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Search Result
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="MainSearch">
        <fieldset id="SearchField">
            <legend id="SearchLegend">高级搜索</legend>
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
            	<tr>
            		<td>
                        <asp:Label ID="LabelBName" runat="server" Text="书名："></asp:Label>
                    </td>
            		<td>
                        <asp:TextBox ID="TextBoxBName" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="LabelBAuthor" runat="server" Text="著译者："></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxBAuthor" runat="server"></asp:TextBox>
                    </td>
            	</tr>
            	<tr>
            	    <td>
                        <asp:Label ID="LabelBP" runat="server" Text="出版社："></asp:Label>
                    </td>
            	    <td>
                        <asp:TextBox ID="TextBoxBP" runat="server"></asp:TextBox>
                    </td>
            	    <td>
                        <asp:Label ID="LabelBPT" runat="server" Text="出版时间："></asp:Label>
                    </td>
            	    <td>
                        <asp:TextBox ID="TextBoxBPT" runat="server"></asp:TextBox>
                    </td>
            	</tr>
            	<tr>
            	    <td>
                        <asp:Label ID="LabelBNumber" runat="server" Text="书号："></asp:Label>
                    </td>
            	    <td>
                        <asp:TextBox ID="TextBoxBNumber" runat="server"></asp:TextBox>
                    </td>
            	    <td>
                        <asp:Label ID="LabelBPrice" runat="server" Text="定价："></asp:Label>
                    </td>
            	    <td>
                        <asp:TextBox ID="TextBoxBPrice" runat="server"></asp:TextBox>
                    </td>
            	</tr>
            	<tr>
            	    <td>
                        <asp:Label ID="LabelBKey" runat="server" Text="关键词："></asp:Label>
                    </td>
            	    <td>
                        <asp:TextBox ID="TextBoxBKey" runat="server"></asp:TextBox>
                    </td>
            	    <td>
                        <asp:Label ID="LabelBType" runat="server" Text="所属分类："></asp:Label>
                    </td>
            	    <td>
                        <asp:TextBox ID="TextBoxBType" runat="server"></asp:TextBox>
                    </td>
            	</tr>
            	<tr>
            	    <td>
                        <asp:Button ID="ButtonBSearch" runat="server" Text="搜索" /></td>
            	</tr>
            </table>
        </fieldset>
        <ul id="SearchUl">
        	<li class="SearchList">
        	    <div class="BookPic">
        	    </div>
        	    <div class="BookInfo">
        	    </div>
        	</li>
        	<li class="SearchList">
        	    <div class="BookPic">
        	    </div>
        	    <div class="BookInfo">
        	    </div>
        	</li>
        	<li class="SearchList">
        	    <div class="BookPic">
        	    </div>
        	    <div class="BookInfo">
        	    </div>
        	</li>
        	<li class="SearchList">
        	    <div class="BookPic">
        	    </div>
        	    <div class="BookInfo">
        	    </div>
        	</li>
            <li class="SearchList">
        	    <div class="BookPic">
        	    </div>
        	    <div class="BookInfo">
        	    </div>
        	</li>
        	<li class="SearchList">
        	    <div class="BookPic">
        	    </div>
        	    <div class="BookInfo">
        	    </div>
        	</li>
        	<li class="SearchList">
        	    <div class="BookPic">
        	    </div>
        	    <div class="BookInfo">
        	    </div>
        	</li>
        	<li class="SearchList">
        	    <div class="BookPic">
        	    </div>
        	    <div class="BookInfo">
        	    </div>
        	</li>
        	<li class="SearchList">
        	    <div class="BookPic">
        	    </div>
        	    <div class="BookInfo">
        	    </div>
        	</li>
        	<li class="SearchList">
        	    <div class="BookPic">
        	    </div>
        	    <div class="BookInfo">
        	    </div>
        	</li>
        </ul>
    </div>
    
    <div id="SearchSideBar">    
    </div>
    
    <div id="SearchBottom">
    </div>
</asp:Content>
