<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace = "BLOOM.Web.Models.Analyse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>�û���Ϣ</h2>
    <ul>
       <h4>����ֲ�</h4>
          <% var ageRange = ViewData["AgeRange"] as List<m_ageRange>; %>
          <% foreach (var age in ageRange) { %>
             <li> ����<%= Html.Encode(age.age)%> �� <%= Html.Encode(age.count)%> �� </li>
          <% } %>
          
        <h4>�Ա�ֲ�</h4>
          <% var genderRange = ViewData["GenderRange"] as List<m_genderRange>; %>
          <% foreach (var gender in genderRange) { %>
             <li> �Ա�<%= Html.Encode(gender.gender)%> �� <%= Html.Encode(gender.count)%> �� </li>
          <% } %>
          
         <h4>ְҵ�ֲ�</h4>
          <% var occupationRange = ViewData["OccupationRange"] as List<m_occupationRange>; %>
          <% foreach (var occupation in occupationRange) { %>
             <li> ְҵ <%= Html.Encode(occupation.occupation)%> �� <%= Html.Encode(occupation.count)%> �� </li>
          <% } %>   
          
        <h4>ע��ʱ��ֲ�</h4>
          <% var createDateRange = ViewData["CreateDateRange"] as List<m_createDateRange>; %>
          <% foreach (var createDate in createDateRange) { %>
             <li> ע������ <%= Html.Encode(createDate.createDate)%> �� <%= Html.Encode(createDate.count)%> �� </li>
          <% } %>              
    </ul>

    <h2>ͼ�������Ϣ</h2>
    <ul>
       <% var categoryStatistics = ViewData["CategoryStatistics"] as List<m_categoryStatistice>; %>
       <% foreach (var category in categoryStatistics) { %>
          <li> ���� <%= Html.Encode(category.categoryId)%> �� <%= Html.Encode(category.count)%> ����</li>
          <% } %>
    </ul>
    
    <h2>�շ���Ϣ</h2>
    <ul>
       <h4>������</h4>
       <% string moneyEarned = ViewData["MoneyEarned"].ToString(); %>
          <li> ����վ����������ĿǰΪֹ�����룺 <%= Html.Encode(moneyEarned)%>  </li>
       <% string moneyForOneMonth = ViewData["MoneyForOneMonth"].ToString(); %>
          <li> ���������룺 <%= Html.Encode(moneyForOneMonth)%>  </li>
          
       <h4>����--��Ǯ��</h4>
       <% var moneyByAge = ViewData["MoneyByAge"] as List<m_moneyByAge>; %>
       <% foreach (var item in moneyByAge) { %>
          <li> ����Ϊ <%= Html.Encode(item.age)%> ����Ǯ <%= Html.Encode(item.money.ToString())%> </li>
          <% } %>

       <% var moneyByAgeForOneMonth = ViewData["MoneyByAgeForOneMonth"] as List<m_moneyByAge>; %>
       <% foreach (var item in moneyByAgeForOneMonth) { %>
          <li> ����Ϊ <%= Html.Encode(item.age)%> ���¹���Ǯ <%= Html.Encode(item.money.ToString())%> </li>
          <% } %>
          
       <h4>ְҵ--��Ǯ��</h4>
       <% var moneyByOccupation = ViewData["MoneyByOccupation"] as List<m_moneyByOccupation>; %>
       <% foreach (var item in moneyByOccupation) { %>
          <li> ְҵΪ <%= Html.Encode(item.occupation)%> ����Ǯ <%= Html.Encode(item.money.ToString())%> </li>
          <% } %>

       <% var moneyByOccupationForOneMonth = ViewData["MoneyByOccupationForOneMonth"] as List<m_moneyByOccupation>; %>
       <% foreach (var item in moneyByOccupationForOneMonth) { %>
          <li> ְҵΪ <%= Html.Encode(item.occupation)%> ���¹���Ǯ <%= Html.Encode(item.money.ToString())%> </li>
          <% } %>
          
       <h4>�Ա�--��Ǯ��</h4>
       <% var moneyByGender = ViewData["MoneyByGender"] as List<m_moneyByGender>; %>
       <% foreach (var item in moneyByGender) { %>
          <li> �Ա�Ϊ <%= Html.Encode(item.gender)%> ����Ǯ <%= Html.Encode(item.money.ToString())%> </li>
          <% } %>

       <% var moneyByGenderForOneMonth = ViewData["MoneyByGenderForOneMonth"] as List<m_moneyByGender>; %>
       <% foreach (var item in moneyByGenderForOneMonth) { %>
          <li> �Ա�Ϊ <%= Html.Encode(item.gender)%> ���¹���Ǯ <%= Html.Encode(item.money.ToString())%> </li>
          <% } %>
           
       <h4>����--׬Ǯ��</h4>
       <% var moneyByCategory = ViewData["MoneyByCategory"] as List<m_moneyByCategory>; %>
       <% foreach (var item in moneyByCategory) { %>
          <li> ����Ϊ <%= Html.Encode(item.categoryId)%> ��׬Ǯ <%= Html.Encode(item.money.ToString())%> </li>
          <% } %>

       <% var moneyByCategoryForOneMonth = ViewData["MoneyByCategoryForOneMonth"] as List<m_moneyByCategory>; %>
       <% foreach (var item in moneyByCategoryForOneMonth) { %>
          <li> ����Ϊ <%= Html.Encode(item.categoryId)%> ���¹�׬Ǯ <%= Html.Encode(item.money.ToString())%> </li>
          <% } %>
    </ul>
    
    <h2>������</h2>
    <ul>
       <h4>�����������</h4>
           <% var boughtTimesRank = ViewData["BoughtTimesRank"] as List<m_boughtTimes>; %>
           <% foreach (var item in boughtTimesRank) { %>
           <li> Id <%= Html.Encode(item.bookId)%> ���� <%= Html.Encode(item.title) %> 
              �������� <%= Html.Encode(item.boughtTimes)%> ��</li>
          <% } %>
          
       <h4>���¹����������</h4>
           <% var boughtTimesRankForOneMonth = ViewData["BoughtTimesRankForOneMonth"] as List<m_boughtTimes>; %>
           <% foreach (var item in boughtTimesRankForOneMonth) { %>
           <li> Id <%= Html.Encode(item.bookId)%> ���� <%= Html.Encode(item.title) %> 
              ���¹������� <%= Html.Encode(item.boughtTimes)%> ��</li>
          <% } %>
          
       <h4>����ͼ�� �����������</h4>
           <% var categoryBoughtTimesRank = ViewData["CategoryBoughtTimesRank"] as List<m_categoryBoughtTimes>; %>
           <% foreach (var item in categoryBoughtTimesRank) { %>
           <li> ���� <%= Html.Encode(item.categoryId)%> �������� <%= Html.Encode(item.boughtTimes)%> ��</li>
          <% } %>    
          
       <h4>���·���ͼ�� �����������</h4>
           <% var categoryBoughtTimesRankForOneMonth = ViewData["CategoryBoughtTimesRankForOneMonth"] as List<m_categoryBoughtTimes>; %>
           <% foreach (var item in categoryBoughtTimesRankForOneMonth) { %>
           <li> ���� <%= Html.Encode(item.categoryId)%> ���¹������� <%= Html.Encode(item.boughtTimes)%> ��</li>
          <% } %>   
          
       <h4>�����������</h4>
           <% var viewedTimesRank = ViewData["ViewedTimesRank"] as List<m_viewedTimes>; %>
           <% foreach (var item in viewedTimesRank) { %>
           <li> Id <%= Html.Encode(item.bookId)%> ���� <%= Html.Encode(item.title) %> 
              ������� <%= Html.Encode(item.viewedTimes)%> ��</li>
          <% } %>
          
       <h4>����ͼ�� �����������</h4>
           <% var categoryViewedTimesRank = ViewData["CategoryViewedTimesRank"] as List<m_categoryViewedTimes>; %>
           <% foreach (var item in categoryViewedTimesRank) { %>
           <li> ���� <%= Html.Encode(item.categoryId)%> ������� <%= Html.Encode(item.viewedTimes)%> ��</li>
          <% } %>    
    </ul>
</asp:Content>
