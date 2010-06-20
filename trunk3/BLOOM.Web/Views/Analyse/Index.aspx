<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Analyse.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace = "BLOOM.Web.Models.Analyse" %>
<%@ Register Assembly="System.Web.Silverlight" Namespace="System.Web.UI.SilverlightControls"
    TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AnalyseTitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="AnalyseMainContent" runat="server">
<%using (Html.BeginForm()) { %>
<%--    <form id="form1" runat="server" style="height:100%;">--%>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        
       <h2>用户信息</h2>
       <p id="Submit_KindOfUserInfo">
       <%= Html.DropDownList("UserInfoCommand", ViewData["KindOfUserInfo"] as SelectList)%>
             <input type="submit" value="查询" />
       </p>
        <%  var userInfoSelectResult = ViewData["UserInfoSelectResult"] as string;%>
        <% switch (userInfoSelectResult)
           {
               case "AgeRange":
                   {  %> 
                  <h4>年龄分布</h4>
                  <% var ageRange = ViewData["AgeRange"] as List<m_ageRange>; %>
                  <% foreach (var age in ageRange)
                     { %>
                       <li> 年龄<%= Html.Encode(age.age)%> 有 <%= Html.Encode(age.count)%> 人 </li>
                  <% } %>
                  <div style="height:400px;">
                  <asp:Silverlight InitParameters="PageName=ColumnBarAgeRange"
                     ID="Silverlight3" runat="server" Source="~/ClientBin/BLOOM.xap" MinimumVersion="2.0.31005.0" Width="100%" Height="100%" />
                  </div>
                  <% break;
                   }
               case "GenderRange":  %>
                  <h4>性别分布</h4>
                  <% var genderRange = ViewData["GenderRange"] as List<m_genderRange>; %>
                  <% foreach (var gender in genderRange) { %>
                       <li> 性别<%= Html.Encode(gender.gender)%> 有 <%= Html.Encode(gender.count)%> 人 </li>
                  <% } %>
                  <div style="height:400px;">
                  <asp:Silverlight InitParameters="PageName=ColumnBarGenderRange"
                     ID="Silverlight2" runat="server" Source="~/ClientBin/BLOOM.xap" MinimumVersion="2.0.31005.0" Width="100%" Height="100%" />
                  </div>
                  <% break;
               case "OccupationRange": %>
                  <h4>职业分布</h4>
                  <% var occupationRange = ViewData["OccupationRange"] as List<m_occupationRange>; %>
                  <% foreach (var occupation in occupationRange) { %>
                       <li> 职业 <%= Html.Encode(occupation.occupation)%> 有 <%= Html.Encode(occupation.count)%> 人 </li>
                  <% }  %>
                  <div style="height:400px;">
                  <asp:Silverlight InitParameters="PageName=ColumnBarOccupationRange"
                     ID="Silverlight1" runat="server" Source="~/ClientBin/BLOOM.xap" MinimumVersion="2.0.31005.0" Width="100%" Height="100%" />
                  </div>
                  <% break;
               case "CreateDateRange": %>
                  <h4>注册时间分布</h4>
                  <% var createDateRange = ViewData["CreateDateRange"] as List<m_createDateRange>; %>
                  <% foreach (var createDate in createDateRange) { %>
                       <li> 注册日期 <%= Html.Encode(createDate.createDate)%> 有 <%= Html.Encode(createDate.count)%> 人 </li>
                  <% } %>
                  <div style="height:400px;">
                  <asp:Silverlight InitParameters="PageName=ColumnBarCreateDateRange"
                     ID="Silverlight4" runat="server" Source="~/ClientBin/BLOOM.xap" MinimumVersion="2.0.31005.0" Width="100%" Height="100%" />
                  </div>
                  <% break;
               default:  break;
           } %>  
       
            
       <h2>图书分类信息</h2>
       <p id="Submit_CategoryStatistics">
       <%= Html.DropDownList("CategoryCommand", ViewData["WhetherDisplayCategoryStatistics"] as SelectList)%>
             <input type="submit" value="查询" />
       </p>
        <% var categorySelectResult = ViewData["CategorySelectResult"] as string;%>
        <% if(categorySelectResult == "Yes") { %>
             <ul>
             <% var categoryStatistics = ViewData["CategoryStatistics"] as List<m_categoryStatistice>; %>
             <% foreach (var category in categoryStatistics) { %>
                  <li> 分类 <%= Html.Encode(category.categoryName)%> 有 <%= Html.Encode(category.count)%> 本书</li>
             <% } %>
             </ul>
             <div style="height:400px;">
             <asp:Silverlight InitParameters="PageName=ColumnBarCategoryStatistics"
             ID="Silverlight5" runat="server" Source="~/ClientBin/BLOOM.xap" MinimumVersion="2.0.31005.0" Width="100%" Height="100%" />
             </div>
        <% } %>  
          
       <h2>收费信息</h2>
       <p id="Submit_MoneyEarned">
       <%= Html.DropDownList("KindOfGroupCommand", ViewData["KindOfGroup"] as SelectList)%>
       请选择时间段<%= Html.DropDownList("TimeSpanCommandForMoney", ViewData["TimeSpanForMoney"] as SelectList)%>
             <input type="submit" value="查询" />
       </p>
       <% var kindOfGroupResult = ViewData["KindOfGroupResult"] as string;
          var timeSpanResult = ViewData["TimeSpanResultForMoney"] as string;%>
       <% switch(kindOfGroupResult) { 
               case "Whole": %>
               <h4>总收入</h4>
               <%  switch(timeSpanResult) {
                           case "Whole":  %>
                                <% string moneyEarned = ViewData["MoneyEarned"].ToString(); %>
                                <li> 自网站运行以来到目前为止总收入： <%= Html.Encode(moneyEarned)%> 元 </li>   
                                <% break; 
                           case "OneWeek": %>
                                <% string moneyForOneWeek = ViewData["MoneyForOneWeek"].ToString(); %>
                                <li> 本周总收入： <%= Html.Encode(moneyForOneWeek)%> 元 </li>
                                <% break;
                           case "OneMonth": %>
                                <% string moneyForOneMonth = ViewData["MoneyForOneMonth"].ToString(); %>
                                <li> 本月总收入： <%= Html.Encode(moneyForOneMonth)%> 元 </li>
                                <% break;
                        } break; 
               case "Age": %>
               <h4>年龄--消费数</h4>
               <% switch(timeSpanResult) { 
                           case "Whole" :%>
                                <% var moneyByAge = ViewData["MoneyByAge"] as List<m_moneyByAge>; %>
                                <% foreach (var item in moneyByAge) { %>
                                <li> 年龄为 <%= Html.Encode(item.age)%> 共消费 <%= Html.Encode(item.money.ToString())%> </li>
                                <% } %> 
                                <div style="height:400px;">
                                <asp:Silverlight InitParameters="PageName=ColumnBarMoneyByAge,Day=0"
                                 ID="Silverlight6" runat="server" Source="~/ClientBin/BLOOM.xap" MinimumVersion="2.0.31005.0" Width="100%" Height="100%" />
                                </div>
                                <%  break;
                           case "OneWeek": %>
                                <% var moneyByAgeForOneWeek = ViewData["MoneyByAgeForOneWeek"] as List<m_moneyByAge>; %>
                                <% foreach (var item in moneyByAgeForOneWeek) { %>
                                <li> 年龄为 <%= Html.Encode(item.age)%> 本周共消费 <%= Html.Encode(item.money.ToString())%> </li>
                                <% } %>
                                <div style="height:400px;">
                                <asp:Silverlight InitParameters="PageName=ColumnBarMoneyByAge,Day=7"
                                 ID="Silverlight7" runat="server" Source="~/ClientBin/BLOOM.xap" MinimumVersion="2.0.31005.0" Width="100%" Height="100%" />
                                </div>                                
                                <% break;
                           case "OneMonth": %>
                                <% var moneyByAgeForOneMonth = ViewData["MoneyByAgeForOneMonth"] as List<m_moneyByAge>; %>
                                <% foreach (var item in moneyByAgeForOneMonth) { %>
                                <li> 年龄为 <%= Html.Encode(item.age)%> 本月共消费 <%= Html.Encode(item.money.ToString())%> </li>
                                <% } %>
                                <div style="height:400px;">
                                <asp:Silverlight InitParameters="PageName=ColumnBarMoneyByAge,Day=30"
                                 ID="Silverlight8" runat="server" Source="~/ClientBin/BLOOM.xap" MinimumVersion="2.0.31005.0" Width="100%" Height="100%" />
                                </div>
                                <% break;
                     } break;
               case "Occupation": %>
               <h4>职业--消费数</h4>
               <% switch(timeSpanResult) { 
                           case "Whole" :%>
                                <% var moneyByOccupation = ViewData["MoneyByOccupation"] as List<m_moneyByOccupation>; %>
                                <% foreach (var item in moneyByOccupation) { %>
                                <li> 职业为 <%= Html.Encode(item.occupation)%> 共消费 <%= Html.Encode(item.money.ToString())%> </li>
                                <% }  %>
                                <div style="height:400px;">
                                <asp:Silverlight InitParameters="PageName=ColumnBarMoneyByOccupation,Day=0"
                                 ID="Silverlight11" runat="server" Source="~/ClientBin/BLOOM.xap" MinimumVersion="2.0.31005.0" Width="100%" Height="100%" />
                                </div>
                                <%  break; 
                           case "OneWeek": %>
                                <% var moneyByOccupationForOneWeek = ViewData["MoneyByOccupationForOneWeek"] as List<m_moneyByOccupation>; %>
                                <% foreach (var item in moneyByOccupationForOneWeek) { %>
                                <li> 职业为 <%= Html.Encode(item.occupation)%> 本周共消费 <%= Html.Encode(item.money.ToString())%> </li>
                                <% }  %>
                                <div style="height:400px;">
                                <asp:Silverlight InitParameters="PageName=ColumnBarMoneyByOccupation,Day=7"
                                 ID="Silverlight9" runat="server" Source="~/ClientBin/BLOOM.xap" MinimumVersion="2.0.31005.0" Width="100%" Height="100%" />
                                </div>
                                <%  break; 
                           case "OneMonth": %>
                                <% var moneyByOccupationForOneMonth = ViewData["MoneyByOccupationForOneMonth"] as List<m_moneyByOccupation>; %>
                                <% foreach (var item in moneyByOccupationForOneMonth) { %>
                                <li> 职业为 <%= Html.Encode(item.occupation)%> 本月共消费 <%= Html.Encode(item.money.ToString())%> </li>
                                <% }  %>
                                <div style="height:400px;">
                                <asp:Silverlight InitParameters="PageName=ColumnBarMoneyByOccupation,Day=30"
                                 ID="Silverlight10" runat="server" Source="~/ClientBin/BLOOM.xap" MinimumVersion="2.0.31005.0" Width="100%" Height="100%" />
                                </div>
                                <%  break; 
                     } break;
               case "Gender": %>
               <h4>性别--消费数</h4>
               <% switch(timeSpanResult) { 
                           case "Whole" :%>
                                <% var moneyByGender = ViewData["MoneyByGender"] as List<m_moneyByGender>; %>
                                <% foreach (var item in moneyByGender) { %>
                                <li> 性别为 <%= Html.Encode(item.gender)%> 共消费 <%= Html.Encode(item.money.ToString())%> </li>
                                <% }  %>
                                <div style="height:400px;">
                                <asp:Silverlight InitParameters="PageName=ColumnBarMoneyByGender,Day=0"
                                 ID="Silverlight12" runat="server" Source="~/ClientBin/BLOOM.xap" MinimumVersion="2.0.31005.0" Width="100%" Height="100%" />
                                </div>
                                <%  break; 
                           case "OneWeek": %>
                                <% var moneyByGenderForOneWeek = ViewData["MoneyByGenderForOneWeek"] as List<m_moneyByGender>; %>
                                <% foreach (var item in moneyByGenderForOneWeek) { %>
                                <li> 性别为 <%= Html.Encode(item.gender)%> 本周共消费 <%= Html.Encode(item.money.ToString())%> </li>
                                <% }  %>
                                <div style="height:400px;">
                                <asp:Silverlight InitParameters="PageName=ColumnBarMoneyByGender,Day=7"
                                 ID="Silverlight13" runat="server" Source="~/ClientBin/BLOOM.xap" MinimumVersion="2.0.31005.0" Width="100%" Height="100%" />
                                </div>
                                <%  break; 
                           case "OneMonth": %>
                                <% var moneyByGenderForOneMonth = ViewData["MoneyByGenderForOneMonth"] as List<m_moneyByGender>; %>
                                <% foreach (var item in moneyByGenderForOneMonth) { %>
                                <li> 性别为 <%= Html.Encode(item.gender)%> 本周共消费 <%= Html.Encode(item.money.ToString())%> </li>
                                <% }  %>
                                <div style="height:400px;">
                                <asp:Silverlight InitParameters="PageName=ColumnBarMoneyByGender,Day=30"
                                 ID="Silverlight14" runat="server" Source="~/ClientBin/BLOOM.xap" MinimumVersion="2.0.31005.0" Width="100%" Height="100%" />
                                </div>
                                <%  break; 
                     } break;
               case "Category": %>
               <h4>图书分类--消费数</h4>
               <% switch(timeSpanResult) { 
                           case "Whole" :%>
                                <% var moneyByCategory = ViewData["MoneyByCategory"] as List<m_moneyByCategory>; %>
                                <% foreach (var item in moneyByCategory) { %>
                                <li> 分类为 <%= Html.Encode(item.categoryName)%> 共赚钱 <%= Html.Encode(item.money.ToString())%> </li>
                                 <% }  %>
                                <div style="height:400px;">
                                <asp:Silverlight InitParameters="PageName=ColumnBarMoneyByCategory,Day=0"
                                 ID="Silverlight15" runat="server" Source="~/ClientBin/BLOOM.xap" MinimumVersion="2.0.31005.0" Width="100%" Height="100%" />
                                </div>
                                <%  break; 
                           case "OneWeek": %>
                                <% var moneyByCategoryForOneWeek = ViewData["MoneyByCategoryForOneWeek"] as List<m_moneyByCategory>; %>
                                <% foreach (var item in moneyByCategoryForOneWeek) { %>
                                <li> 分类为 <%= Html.Encode(item.categoryName)%> 本周共赚钱 <%= Html.Encode(item.money.ToString())%> </li>
                                 <% }  %>
                                <div style="height:400px;">
                                <asp:Silverlight InitParameters="PageName=ColumnBarMoneyByCategory,Day=7"
                                 ID="Silverlight16" runat="server" Source="~/ClientBin/BLOOM.xap" MinimumVersion="2.0.31005.0" Width="100%" Height="100%" />
                                </div>
                                <%  break; 
                           case "OneMonth": %>
                                <% var moneyByCategoryForOneMonth = ViewData["MoneyByCategoryForOneMonth"] as List<m_moneyByCategory>; %>
                                <% foreach (var item in moneyByCategoryForOneMonth) { %>
                                <li> 分类为 <%= Html.Encode(item.categoryName)%> 本月共赚钱 <%= Html.Encode(item.money.ToString())%> </li>
                                 <% }  %>
                                <div style="height:400px;">
                                <asp:Silverlight InitParameters="PageName=ColumnBarMoneyByCategory,Day=30"
                                 ID="Silverlight17" runat="server" Source="~/ClientBin/BLOOM.xap" MinimumVersion="2.0.31005.0" Width="100%" Height="100%" />
                                </div>
                                <%  break; 
                     } break; 
        } %>
        
        <h2>购买量</h2>
       <p id="Submit_BoughtTimes">
       <%= Html.DropDownList("CategoryForBoughtCommand", ViewData["CategoryForBought"] as SelectList)%>
       请选择时间段<%= Html.DropDownList("TimeSpanForBoughtCommand", ViewData["TimeSpanForBought"] as SelectList)%>
             <input type="submit" value="查询" />
       </p>
       <% var categoryForBoughtResult = ViewData["CategoryForBoughtResult"] as string;
          var timeSpanForBoughtResult = ViewData["TimeSpanForBoughtResult"] as string;%>
       <% switch (categoryForBoughtResult)  { 
               case "Whole": %>
               <%  switch (timeSpanForBoughtResult) { 
                           case "Whole" :%>
                                  <h4>购买次数排名</h4> 
                                  <% var boughtTimesRank = ViewData["BoughtTimesRank"] as List<m_boughtTimes>; %>
                                  <% foreach (var item in boughtTimesRank) { %>
                                       <li> 书名 <%= Html.Encode(item.title) %> 
                                   共被购买 <%= Html.Encode(item.boughtTimes)%> 次</li>
                                <% } %>  
                                <div style="height:400px;">
                                <asp:Silverlight InitParameters="PageName=ColumnBarBookBoughtRank,Day=0"
                                 ID="Silverlight18" runat="server" Source="~/ClientBin/BLOOM.xap" MinimumVersion="2.0.31005.0" Width="100%" Height="100%" />
                                </div>
                                <%  break; 
                           case "OneWeek": %>
                                  <h4>本周购买次数排名</h4>
                                  <% var boughtTimesRankForOneWeek = ViewData["BoughtTimesRankForOneWeek"] as List<m_boughtTimes>; %>
                                  <% foreach (var item in boughtTimesRankForOneWeek) { %>
                                       <li> 书名 <%= Html.Encode(item.title) %> 
                                     本周共被购买 <%= Html.Encode(item.boughtTimes)%> 次</li>
                                <% } %>  
                                <div style="height:400px;">
                                <asp:Silverlight InitParameters="PageName=ColumnBarBookBoughtRank,Day=7"
                                 ID="Silverlight19" runat="server" Source="~/ClientBin/BLOOM.xap" MinimumVersion="2.0.31005.0" Width="100%" Height="100%" />
                                </div>
                                <%  break; 
                           case "OneMonth": %>
                                  <h4>本月购买次数排名</h4>
                                  <% var boughtTimesRankForOneMonth = ViewData["BoughtTimesRankForOneMonth"] as List<m_boughtTimes>; %>
                                  <% foreach (var item in boughtTimesRankForOneMonth) { %>
                                       <li> 书名 <%= Html.Encode(item.title) %> 
                                     本月共被购买 <%= Html.Encode(item.boughtTimes)%> 次</li>
                                <% } %>  
                                <div style="height:400px;">
                                <asp:Silverlight InitParameters="PageName=ColumnBarBookBoughtRank,Day=30"
                                 ID="Silverlight20" runat="server" Source="~/ClientBin/BLOOM.xap" MinimumVersion="2.0.31005.0" Width="100%" Height="100%" />
                                </div>
                                <%  break; 
                     } break; 
               case "Category": %>
               <% switch (timeSpanForBoughtResult) { 
                           case "Whole" :%>
                                <h4>分类图书 购买次数排名</h4>
                                <% var categoryBoughtTimesRank = ViewData["CategoryBoughtTimesRank"] as List<m_categoryBoughtTimes>; %>
                                <% foreach (var item in categoryBoughtTimesRank) { %>
                                  <li> 分类 <%= Html.Encode(item.categoryName)%> 共被购买 <%= Html.Encode(item.boughtTimes)%> 次</li>
                                <% } %>  
                                <div style="height:400px;">
                                <asp:Silverlight InitParameters="PageName=ColumnBarCategoryBoughtRank,Day=0"
                                 ID="Silverlight21" runat="server" Source="~/ClientBin/BLOOM.xap" MinimumVersion="2.0.31005.0" Width="100%" Height="100%" />
                                </div>
                                <%  break; 
                           case "OneWeek": %>
                                <h4>本周分类图书 购买次数排名</h4>
                                 <% var categoryBoughtTimesRankForOneWeek = ViewData["CategoryBoughtTimesRankForOneWeek"] as List<m_categoryBoughtTimes>; %>
                                 <% foreach (var item in categoryBoughtTimesRankForOneWeek) { %>
                                  <li> 分类 <%= Html.Encode(item.categoryName)%> 本周共被购买 <%= Html.Encode(item.boughtTimes)%> 次</li>
                                 <% } %>   
                                <div style="height:400px;">
                                <asp:Silverlight InitParameters="PageName=ColumnBarCategoryBoughtRank,Day=7"
                                 ID="Silverlight22" runat="server" Source="~/ClientBin/BLOOM.xap" MinimumVersion="2.0.31005.0" Width="100%" Height="100%" />
                                </div>
                                <%  break; 
                           case "OneMonth": %>
                                <h4>本月分类图书 购买次数排名</h4>
                                 <% var categoryBoughtTimesRankForOneMonth = ViewData["CategoryBoughtTimesRankForOneMonth"] as List<m_categoryBoughtTimes>; %>
                                 <% foreach (var item in categoryBoughtTimesRankForOneMonth) { %>
                                  <li> 分类 <%= Html.Encode(item.categoryName)%> 本月共被购买 <%= Html.Encode(item.boughtTimes)%> 次</li>
                                 <% } %>   
                                <div style="height:400px;">
                                <asp:Silverlight InitParameters="PageName=ColumnBarCategoryBoughtRank,Day=30"
                                 ID="Silverlight23" runat="server" Source="~/ClientBin/BLOOM.xap" MinimumVersion="2.0.31005.0" Width="100%" Height="100%" />
                                </div>
                                <%  break; 
                     } break; 
        } %>
        
        <h2>点击量</h2>
       <p id="Submit_ViewedTime">
       <%= Html.DropDownList("CategoryForViewedCommand", ViewData["CategoryForViewed"] as SelectList)%>
             <input type="submit" value="查询" />
       </p>
       <% var categoryForViewedResult = ViewData["CategoryForViewedResult"] as string;%>
       <% switch (categoryForViewedResult) { 
               case "Whole": %>
                     <h4>点击次数排名</h4>
                     <% var viewedTimesRank = ViewData["ViewedTimesRank"] as List<m_viewedTimes>; %>
                     <% foreach (var item in viewedTimesRank) { %>
                     <li> 书名 <%= Html.Encode(item.title) %> 
                        共被点击 <%= Html.Encode(item.viewedTimes)%> 次</li> 
                      <% } %>
                    <div style="height:400px;">
                    <asp:Silverlight InitParameters="PageName=ColumnBarBookViewedRank,Day=0"
                     ID="Silverlight24" runat="server" Source="~/ClientBin/BLOOM.xap" MinimumVersion="2.0.31005.0" Width="100%" Height="100%" />
                    </div>
                     <%  break; 
               case "Category": %>
                     <h4>分类图书 点击次数排名</h4>
                     <% var categoryViewedTimesRank = ViewData["CategoryViewedTimesRank"] as List<m_categoryViewedTimes>; %>
                     <% foreach (var item in categoryViewedTimesRank) { %>
                     <li> 分类 <%= Html.Encode(item.categoryName)%> 共被点击 <%= Html.Encode(item.viewedTimes)%> 次</li>
                     <% }  %>
                      <div style="height:400px;">
                      <asp:Silverlight InitParameters="PageName=ColumnBarCategoryViewedRank,Day=0"
                      ID="Silverlight25" runat="server" Source="~/ClientBin/BLOOM.xap" MinimumVersion="2.0.31005.0" Width="100%" Height="100%" />
                      </div>
                      <% break; 
        } %>       
        
<%--    </form>--%>
<%} %>   


       


  
</asp:Content>

