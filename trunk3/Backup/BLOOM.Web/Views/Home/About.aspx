<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Project.Master" Inherits="System.Web.Mvc.ViewPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Help & Contact us
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="About_sidebar">
        <ul>
        	<li><a href="#">新手指南</a>
        	    <ul>
        	    	<li><a href="#">新用户注册</a></li>
        	    	<li><a href="#">用户登陆</a></li>
        	    	<li><a href="#">买书流程</a></li>
        	    </ul>
        	</li>
        	<li><a href="#">我的BLOOM</a>
        	    <ul>
        	        <li><a href="#">个人信息管理</a></li>
        	        <li><a href="#">我购买的书</a></li>
        	        <li><a href="#">我的评论</a></li>
        	    </ul>
        	</li>
        	<li><a href="#">联系我们</a>
        	</li>
        </ul>
    </div>
    <div id="About_mainbar">
    
    </div>
</asp:Content>
