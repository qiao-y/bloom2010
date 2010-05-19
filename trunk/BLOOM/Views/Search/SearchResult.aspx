<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Project.Master" Inherits="System.Web.Mvc.ViewPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Search Result
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="MainSearch">
        <fieldset id="SearchField">
            <legend id="SearchLegend">�߼�����</legend>
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
            	<tr>
            		<td>
                        <asp:Label ID="LabelBName" runat="server" Text="������"></asp:Label>
                    </td>
            		<td>
                        <asp:TextBox ID="TextBoxBName" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="LabelBAuthor" runat="server" Text="�����ߣ�"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxBAuthor" runat="server"></asp:TextBox>
                    </td>
            	</tr>
            	<tr>
            	    <td>
                        <asp:Label ID="LabelBP" runat="server" Text="�����磺"></asp:Label>
                    </td>
            	    <td>
                        <asp:TextBox ID="TextBoxBP" runat="server"></asp:TextBox>
                    </td>
            	    <td>
                        <asp:Label ID="LabelBPT" runat="server" Text="����ʱ�䣺"></asp:Label>
                    </td>
            	    <td>
                        <asp:TextBox ID="TextBoxBPT" runat="server"></asp:TextBox>
                    </td>
            	</tr>
            	<tr>
            	    <td>
                        <asp:Label ID="LabelBNumber" runat="server" Text="��ţ�"></asp:Label>
                    </td>
            	    <td>
                        <asp:TextBox ID="TextBoxBNumber" runat="server"></asp:TextBox>
                    </td>
            	    <td>
                        <asp:Label ID="LabelBPrice" runat="server" Text="���ۣ�"></asp:Label>
                    </td>
            	    <td>
                        <asp:TextBox ID="TextBoxBPrice" runat="server"></asp:TextBox>
                    </td>
            	</tr>
            	<tr>
            	    <td>
                        <asp:Label ID="LabelBKey" runat="server" Text="�ؼ��ʣ�"></asp:Label>
                    </td>
            	    <td>
                        <asp:TextBox ID="TextBoxBKey" runat="server"></asp:TextBox>
                    </td>
            	    <td>
                        <asp:Label ID="LabelBType" runat="server" Text="�������ࣺ"></asp:Label>
                    </td>
            	    <td>
                        <asp:TextBox ID="TextBoxBType" runat="server"></asp:TextBox>
                    </td>
            	</tr>
            	<tr>
            	    <td>
                        <asp:Button ID="ButtonBSearch" runat="server" Text="����" /></td>
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
