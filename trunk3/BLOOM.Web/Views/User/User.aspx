<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Project.Master" Inherits="System.Web.Mvc.ViewPage<BLOOM.Web.Models.User.GeneralInfo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	User1
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="PersonalAccount">
        <p>
              ��ӭ����
              <%= Html.Encode(Model.m_personalInfo.aspnet_Users.UserName) %>
         </p>
         <table border="0" cellspacing="0" cellpadding="0" width="100%" 
            style="height: 134px">
         	<tr>
         		<td>�Ա�</td>
         		<td><%= Html.Encode(Model.m_personalInfo.Gender)%></td>
         	</tr>
         	<tr>
         	    <td>���䣺</td>
         	    <td><%= Html.Encode(Model.m_personalInfo.Age)%></td>
         	</tr>
         	<tr>
         	    <td>ְҵ��</td>
         	    <td><%= Html.Encode(Model.m_personalInfo.Occupation)%></td>
         	</tr>
         	<tr>
         	    <td>���䣺</td>
         	    <td><%= Html.Encode(Model.m_personalInfo.Email)%></td>
         	</tr>
         	<tr>
         	    <td>�˻���</td>
         	    <td><%=Html.Encode(Model.m_accountInfo.Balance) %></td>
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

