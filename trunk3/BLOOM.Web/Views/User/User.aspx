<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Project.Master" Inherits="System.Web.Mvc.ViewPage<BLOOM.Models.User.PersonalInfo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	User1
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="PersonalAccount">
        <p>
              ��ӭ����
              <%= Html.Encode(Model.NickName) %>
         </p>
         <table border="0" cellspacing="0" cellpadding="0" width="100%" 
            style="height: 134px">
         	<tr>
         		<td>�Ա�</td>
         		<td><%= Html.Encode(Model.Gender) %></td>
         	</tr>
         	<tr>
         	    <td>���䣺</td>
         	    <td><%= Html.Encode() %></td>
         	</tr>
         	<tr>
         	    <td>ְҵ��</td>
         	    <td><%= Html.Encode(Model.Occupation) %></td>
         	</tr>
         	<tr>
         	    <td>���䣺</td>
         	    <td><%= Html.Encode(Model.EMail) %></td>
         	</tr>
         	<tr>
         	    <td>�˻���</td>
         	    <td><%=Html.Encode() %></td>
         	</tr>
         	<tr>
         	    <td>��ֵ</td>
         	    <td>�޸ĸ�����Ϣ</td>
         	</tr>
         </table>
    </div>
    
    <div id="NowReading">
        <p>�����������ڿ�����</p>
    </div>
    <div id="MoreUserInfo">
        <p>��������д����������Ϊ���Ƽ�����ȵ�</p>
    </div>
    
</asp:Content>

