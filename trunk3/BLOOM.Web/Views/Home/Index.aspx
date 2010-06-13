<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Project.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace = "BLOOM.Web.Models.Analyse" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {

    }
</script>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Home page
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="SideBar1">
        <div id="LoginBar">
            <div id="LR">
            <% if (Session["UserName"] == null)
               {%>
                <p><a href = "../Account/Login">登陆</a></p>
                <p><a href = "../Account/Register">注册</a></p>
                <%}
               else
               { %>
            <%= Html.Encode(Session["UserName"])%>
                <p><a href = "../Account/Logout">登出</a>   </p>
            <%} %>
            </div>
 

        </div>

        <div id = "BookClassify">
        <div>
            <asp:Image ID="Image3" runat="server" 
                ImageUrl="~/Image/groundcolor/sidebartop.jpg" />
        </div>
            <ul id = "Classify">
            	<li>[小说]</li>
            	    <ul class="InlineUl">
            	    	<li>悬疑</li>
            	    	<li>言情</li>
            	    	<li>职场</li>
            	    	<li>财经</li>
            	    </ul>
            	<li>[青春]</li>
            	    <ul class="InlineUl">
            	    	<li>青春文学</li>
            	    	<li>动漫</li>
            	    	<li>幽默</li>
            	    </ul>
            	<li>[励志]</li>
            	    <ul class="InlineUl">
            	    	<li>修养</li>
            	    	<li>成功</li>
            	    	<li>职场</li>
            	    	<li>沟通</li>
            	    </ul>
            	 <li>[少儿]</li>
            	    <ul class="InlineUl">
            	    	<li>文学</li>
            	    	<li>科普</li>
            	    	<li>图画</li>
            	    	<li>益智</li>
            	    </ul>
            	<li>[人文社科]</li>
            	    <ul class="InlineUl">
            	    	<li>文化</li>
            	    	<li>历史</li>
            	    	<li>哲学/宗教</li>
            	    	<li>政治/军事</li>
            	    	<li>法律</li>
            	    	<li>经济</li>
            	    	<li>社会科学</li>
            	    	<li>心理学</li>
            	    </ul>
            	<li>[管理]</li>
            	    <ul class ="InlineUl">
            	    	<li>管理</li>
            	    	<li>金融</li>
            	    	<li>营销</li>
            	    	<li>会计</li>
            	    </ul>
            	<li>[科技]</li>
            	    <ul class="InlineUl">
            	    	<li>科普</li>
            	    	<li>建筑</li>
            	    	<li>医学</li>
            	    	<li>计算机</li>
            	    	<li>工业</li>
            	    	<li>农林</li>
            	    	<li>通信</li>
            	    </ul>
            	<li>[教育]</li>
            	    <ul class="InlineUl">
            	    	<li>教材</li>
            	    	<li>外语</li>
            	    	<li>考试</li>
            	    	<li>教辅</li>
            	    </ul>
            	<li>[国外原版书]</li>
            	<li>[期刊]</li>        
            </ul>
            <div>
             <asp:Image ID="Image2" runat="server" 
                 ImageUrl="~/Image/groundcolor/sidebarbottom.jpg" />
         </div>
         </div>

    </div>
    <div id="MainBar">
        <div id="flashbox" class="smallslider">
            <ul>
            	<li><a href="#"><img src="../../Image/ad/ad1.jpg" alt="Welcome"/></a></li>
            	<li><a href="#"><img src="../../Image/ad/ad2.jpg" alt="Welcome"/></a></li>
            	<li><a href="#"><img src="../../Image/ad/ad3.jpg" /></a></li>
            </ul>
        </div>
        
        
        <div id="Recommend">
            <div id="RecTitle"></div>
            
                <div id="slideshow">
                    <div class="control" id="leftControl">
                    </div>
                  <div id="slidesContainer">
                    <div class="slide">
                        <p>slide1</p>
                    </div>
                    <div class="slide">
                        <p>slide2</p>
                    </div>
                    <div class="slide">
                        <p>slide3</p>
                    </div>
                    <div class="slide">
                        <p>slide4</p>
                    </div>
                  </div>
                    <div class="control" id="rightControl">
                    </div>                  
                </div>

        </div>
        
        <div id="Comment">
            <div id="ComTitle"></div>
            <div>
            </div>
        </div>
    </div>
    
    <div id="SideBar2">
        <div id="HotBook">
           <div id="WeekHot">
           </div>
           
           <p id="Atitle">A_title</p>
           <div id="WEEK_1"></div>
           <p id="Btitle">B_title</p>
           <div id="WEEK_2"></div>
           <p id="Ctitle">C_title</p>
           <div id="WEEK_3"></div>
           <p id="Dtitle">D_title</p>
           <div id="WEEK_4"></div>
           <p id="Etitle">E_title</p>
           <div id="WEEK_5"></div>

        </div>
        <div id="Rank">
            <div id="PopularBook">
            </div>
            <%--       <% var books = ViewData["TopFive"] as IQueryable<book_BookInfo>; %>
        <% foreach (book_BookInfo book in books){ %>
             <li> <%= Html.ActionLink(book.Title, "../Book/Preview", new { id = book.BookId }) %> 
        <% } %>--%>
        
<%--              <% var ageRanges = ViewData["Test"] as List<m_ageRangeStatistics>; %>
            <% foreach (m_ageRangeStatistics age in ageRanges){ %>
                 <li> <%= Html.Encode(age.age) %>
                 on  <%= Html.Encode(age.count) %>  </li>
            <% } %>--%>
            
           <p id="Atitle2">A_title</p>
           <div id="POP_1"></div>
           <p id="Btitle2">B_title</p>
           <div id="POP_2"></div>
           <p id="Ctitle2">C_title</p>
           <div id="POP_3"></div>
           <p id="Dtitle2">D_title</p>
           <div id="POP_4"></div>
           <p id="Etitle2">E_title</p>
           <div id="POP_5"></div>

        </div>
    </div>
    <div id="MainBar2">
    </div>
</asp:Content>
