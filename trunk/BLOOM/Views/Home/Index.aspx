<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Project.Master" Inherits="System.Web.Mvc.ViewPage" %>

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
                <p><a href = "../Account/Login">登陆</a>   </p>
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
        <div id="Advertise">
               <img src="/Image/book/eclipse.jpg" alt="eclipse" width="105" height="105" hspace="20" vspace="20" align="left" />
               <img src="/Image/book/new_moon.jpg" alt="eclipse" width="105" height="105" hspace="20" vspace="20" align="left" />
               <img src="/Image/book/breaking_dawn.jpg" alt="eclipse" width="105" height="105" hspace="20" vspace="20" align="left" />
               <div><br /> <br /><br /><br /><br /><br /><br /><br /><br />&nbsp;&nbsp;&nbsp;&nbsp; 暮光之城-月食&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 暮光之城-新月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 暮光之城-破晓</div>
           </div>
        <div id="Recommend">
            <div id="RecTitle">新书速递</div>
            <div>
                <ul class="MainUl">
            	    <li>
            	    <img src="/Image/book/eclipse.jpg" alt="eclipse" width="95" height="95" hspace="0" vspace="0" align="left" /><div id="Div1">
                            <font size="2px">暮光之城-月食</font></div>
           	            <div id="Div3"><font size="2px">&nbsp &nbsp &nbsp &nbsp 有若即若离的情感纠葛，有一波三折的冒险历程，有瑰丽奇异的超凡想象，有惟妙惟肖的场景描写，有惊心动魄的阅读快感，也有直击心灵的温情慰藉。  ——《纽约时报》 </font></div>
            	    </li>
                </ul>
            </div>
        </div>
        <div id="Comment">
            <div id="ComTitle">好书推荐</div>
            <div>
                <ul class="MainUl">
                	<li>
                	<img src="/Image/book/new_moon.jpg" alt="eclipse" width="95" height="95" hspace="0" vspace="0" align="left" />
            	        <div id="Div7"><font size="2px">暮光之城-新月</font></div>
            	        <div id="Div8"><font size="2px">方文山、饶雪漫、安意如、田原倾情推荐。</font></div>
            	        <div id="Div9"><font size="2px">&nbsp &nbsp &nbsp &nbsp 荣膺美国亚马逊网站近十年来最佳好书、美国图书馆协会十大青少年票选最喜爱读物之首、《纽约时报》年度最佳小说，《出版商周刊》年度最佳好书。</font> </div> 
                	</li>
                </ul>
            </div>
        </div>
    </div>
    <div id="SideBar2">
        <div id="HotBook">
        <h3>一周热门书籍</h3>
            <img src="/Image/book/twilight.jpg" alt="eclipse" width="105" height="105" hspace="0" vspace="20" align="left" />
         
            <div id="Div4"><font size="2px">
                
                <br />
                <br />
                        <a href  ="../Book/Preview/2">
                暮光之城-暮色<br />
                <br />
                作者：（美）梅尔<br />接力出版社</font></div>
                  </a> 
        </div>
        <div id="Rank">
        <h3>点击率排行榜</h3>
            <img src="/Image/book/breaking_dawn.jpg" width="105" height="105" hspace="0" vspace="20" align="left" />
                        <div id="Div5"><font size="2px">
                <br /><br /><br />暮光之城-破晓<br /><br />作者：（美）梅尔 
                <br />接力出版社<br /><br /><br /><br />

        </div>
    </div>
    <div id="MainBar2">
    </div>
        </font>
</asp:Content>
