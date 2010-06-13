<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace = "BLOOM.Web.Models.Analyse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>用户信息</h2>
    <ul>
       <h4>年龄分布</h4>
          <% var ageRange = ViewData["AgeRange"] as List<m_ageRange>; %>
          <% foreach (var age in ageRange) { %>
             <li> 年龄<%= Html.Encode(age.age)%> 有 <%= Html.Encode(age.count)%> 人 </li>
          <% } %>
          
        <h4>性别分布</h4>
          <% var genderRange = ViewData["GenderRange"] as List<m_genderRange>; %>
          <% foreach (var gender in genderRange) { %>
             <li> 性别<%= Html.Encode(gender.gender)%> 有 <%= Html.Encode(gender.count)%> 人 </li>
          <% } %>
          
         <h4>职业分布</h4>
          <% var occupationRange = ViewData["OccupationRange"] as List<m_occupationRange>; %>
          <% foreach (var occupation in occupationRange) { %>
             <li> 职业 <%= Html.Encode(occupation.occupation)%> 有 <%= Html.Encode(occupation.count)%> 人 </li>
          <% } %>   
          
        <h4>注册时间分布</h4>
          <% var createDateRange = ViewData["CreateDateRange"] as List<m_createDateRange>; %>
          <% foreach (var createDate in createDateRange) { %>
             <li> 注册日期 <%= Html.Encode(createDate.createDate)%> 有 <%= Html.Encode(createDate.count)%> 人 </li>
          <% } %>              
    </ul>

    <h2>图书分类信息</h2>
    <ul>
       <% var categoryStatistics = ViewData["CategoryStatistics"] as List<m_categoryStatistice>; %>
       <% foreach (var category in categoryStatistics) { %>
          <li> 分类 <%= Html.Encode(category.categoryId)%> 有 <%= Html.Encode(category.count)%> 本书</li>
          <% } %>
    </ul>
    
    <h2>收费信息</h2>
    <ul>
       <h4>总收入</h4>
       <% string moneyEarned = ViewData["MoneyEarned"].ToString(); %>
          <li> 自网站运行以来到目前为止总收入： <%= Html.Encode(moneyEarned)%>  </li>
       <% string moneyForOneMonth = ViewData["MoneyForOneMonth"].ToString(); %>
          <li> 本月总收入： <%= Html.Encode(moneyForOneMonth)%>  </li>
          
       <h4>年龄--花钱数</h4>
       <% var moneyByAge = ViewData["MoneyByAge"] as List<m_moneyByAge>; %>
       <% foreach (var item in moneyByAge) { %>
          <li> 年龄为 <%= Html.Encode(item.age)%> 共花钱 <%= Html.Encode(item.money.ToString())%> </li>
          <% } %>

       <% var moneyByAgeForOneMonth = ViewData["MoneyByAgeForOneMonth"] as List<m_moneyByAge>; %>
       <% foreach (var item in moneyByAgeForOneMonth) { %>
          <li> 年龄为 <%= Html.Encode(item.age)%> 本月共花钱 <%= Html.Encode(item.money.ToString())%> </li>
          <% } %>
          
       <h4>职业--花钱数</h4>
       <% var moneyByOccupation = ViewData["MoneyByOccupation"] as List<m_moneyByOccupation>; %>
       <% foreach (var item in moneyByOccupation) { %>
          <li> 职业为 <%= Html.Encode(item.occupation)%> 共花钱 <%= Html.Encode(item.money.ToString())%> </li>
          <% } %>

       <% var moneyByOccupationForOneMonth = ViewData["MoneyByOccupationForOneMonth"] as List<m_moneyByOccupation>; %>
       <% foreach (var item in moneyByOccupationForOneMonth) { %>
          <li> 职业为 <%= Html.Encode(item.occupation)%> 本月共花钱 <%= Html.Encode(item.money.ToString())%> </li>
          <% } %>
          
       <h4>性别--花钱数</h4>
       <% var moneyByGender = ViewData["MoneyByGender"] as List<m_moneyByGender>; %>
       <% foreach (var item in moneyByGender) { %>
          <li> 性别为 <%= Html.Encode(item.gender)%> 共花钱 <%= Html.Encode(item.money.ToString())%> </li>
          <% } %>

       <% var moneyByGenderForOneMonth = ViewData["MoneyByGenderForOneMonth"] as List<m_moneyByGender>; %>
       <% foreach (var item in moneyByGenderForOneMonth) { %>
          <li> 性别为 <%= Html.Encode(item.gender)%> 本月共花钱 <%= Html.Encode(item.money.ToString())%> </li>
          <% } %>
           
       <h4>分类--赚钱数</h4>
       <% var moneyByCategory = ViewData["MoneyByCategory"] as List<m_moneyByCategory>; %>
       <% foreach (var item in moneyByCategory) { %>
          <li> 分类为 <%= Html.Encode(item.categoryId)%> 共赚钱 <%= Html.Encode(item.money.ToString())%> </li>
          <% } %>

       <% var moneyByCategoryForOneMonth = ViewData["MoneyByCategoryForOneMonth"] as List<m_moneyByCategory>; %>
       <% foreach (var item in moneyByCategoryForOneMonth) { %>
          <li> 分类为 <%= Html.Encode(item.categoryId)%> 本月共赚钱 <%= Html.Encode(item.money.ToString())%> </li>
          <% } %>
    </ul>
    
    <h2>查阅量</h2>
    <ul>
       <h4>购买次数排名</h4>
           <% var boughtTimesRank = ViewData["BoughtTimesRank"] as List<m_boughtTimes>; %>
           <% foreach (var item in boughtTimesRank) { %>
           <li> Id <%= Html.Encode(item.bookId)%> 书名 <%= Html.Encode(item.title) %> 
              共被购买 <%= Html.Encode(item.boughtTimes)%> 次</li>
          <% } %>
          
       <h4>本月购买次数排名</h4>
           <% var boughtTimesRankForOneMonth = ViewData["BoughtTimesRankForOneMonth"] as List<m_boughtTimes>; %>
           <% foreach (var item in boughtTimesRankForOneMonth) { %>
           <li> Id <%= Html.Encode(item.bookId)%> 书名 <%= Html.Encode(item.title) %> 
              本月共被购买 <%= Html.Encode(item.boughtTimes)%> 次</li>
          <% } %>
          
       <h4>分类图书 购买次数排名</h4>
           <% var categoryBoughtTimesRank = ViewData["CategoryBoughtTimesRank"] as List<m_categoryBoughtTimes>; %>
           <% foreach (var item in categoryBoughtTimesRank) { %>
           <li> 分类 <%= Html.Encode(item.categoryId)%> 共被购买 <%= Html.Encode(item.boughtTimes)%> 次</li>
          <% } %>    
          
       <h4>本月分类图书 购买次数排名</h4>
           <% var categoryBoughtTimesRankForOneMonth = ViewData["CategoryBoughtTimesRankForOneMonth"] as List<m_categoryBoughtTimes>; %>
           <% foreach (var item in categoryBoughtTimesRankForOneMonth) { %>
           <li> 分类 <%= Html.Encode(item.categoryId)%> 本月共被购买 <%= Html.Encode(item.boughtTimes)%> 次</li>
          <% } %>   
          
       <h4>点击次数排名</h4>
           <% var viewedTimesRank = ViewData["ViewedTimesRank"] as List<m_viewedTimes>; %>
           <% foreach (var item in viewedTimesRank) { %>
           <li> Id <%= Html.Encode(item.bookId)%> 书名 <%= Html.Encode(item.title) %> 
              共被点击 <%= Html.Encode(item.viewedTimes)%> 次</li>
          <% } %>
          
       <h4>分类图书 点击次数排名</h4>
           <% var categoryViewedTimesRank = ViewData["CategoryViewedTimesRank"] as List<m_categoryViewedTimes>; %>
           <% foreach (var item in categoryViewedTimesRank) { %>
           <li> 分类 <%= Html.Encode(item.categoryId)%> 共被点击 <%= Html.Encode(item.viewedTimes)%> 次</li>
          <% } %>    
    </ul>
</asp:Content>
