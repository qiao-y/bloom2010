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
        
       <h2>�û���Ϣ</h2>
       <p id="Submit_KindOfUserInfo">
       <%= Html.DropDownList("UserInfoCommand", ViewData["KindOfUserInfo"] as SelectList)%>
             <input type="submit" value="��ѯ" />
       </p>
        <%  var userInfoSelectResult = ViewData["UserInfoSelectResult"] as string;%>
        <% switch (userInfoSelectResult)
           {
               case "AgeRange":
                   {  %> 
                  <h4>����ֲ�</h4>
                  <% var ageRange = ViewData["AgeRange"] as List<m_ageRange>; %>
                  <% foreach (var age in ageRange)
                     { %>
                       <li> ����<%= Html.Encode(age.age)%> �� <%= Html.Encode(age.count)%> �� </li>
                  <% } %>
                  <div style="height:400px;">
                  <asp:Silverlight InitParameters="PageName=ColumnBarAgeRange"
                     ID="Silverlight3" runat="server" Source="~/ClientBin/BLOOM.xap" MinimumVersion="2.0.31005.0" Width="100%" Height="100%" />
                  </div>
                  <% break;
                   }
               case "GenderRange":  %>
                  <h4>�Ա�ֲ�</h4>
                  <% var genderRange = ViewData["GenderRange"] as List<m_genderRange>; %>
                  <% foreach (var gender in genderRange) { %>
                       <li> �Ա�<%= Html.Encode(gender.gender)%> �� <%= Html.Encode(gender.count)%> �� </li>
                  <% } %>
                  <div style="height:400px;">
                  <asp:Silverlight InitParameters="PageName=ColumnBarGenderRange"
                     ID="Silverlight2" runat="server" Source="~/ClientBin/BLOOM.xap" MinimumVersion="2.0.31005.0" Width="100%" Height="100%" />
                  </div>
                  <% break;
               case "OccupationRange": %>
                  <h4>ְҵ�ֲ�</h4>
                  <% var occupationRange = ViewData["OccupationRange"] as List<m_occupationRange>; %>
                  <% foreach (var occupation in occupationRange) { %>
                       <li> ְҵ <%= Html.Encode(occupation.occupation)%> �� <%= Html.Encode(occupation.count)%> �� </li>
                  <% }  %>
                  <div style="height:400px;">
                  <asp:Silverlight InitParameters="PageName=ColumnBarOccupationRange"
                     ID="Silverlight1" runat="server" Source="~/ClientBin/BLOOM.xap" MinimumVersion="2.0.31005.0" Width="100%" Height="100%" />
                  </div>
                  <% break;
               case "CreateDateRange": %>
                  <h4>ע��ʱ��ֲ�</h4>
                  <% var createDateRange = ViewData["CreateDateRange"] as List<m_createDateRange>; %>
                  <% foreach (var createDate in createDateRange) { %>
                       <li> ע������ <%= Html.Encode(createDate.createDate)%> �� <%= Html.Encode(createDate.count)%> �� </li>
                  <% } %>
                  <div style="height:400px;">
                  <asp:Silverlight InitParameters="PageName=ColumnBarCreateDateRange"
                     ID="Silverlight4" runat="server" Source="~/ClientBin/BLOOM.xap" MinimumVersion="2.0.31005.0" Width="100%" Height="100%" />
                  </div>
                  <% break;
               default:  break;
           } %>  
       
            
       <h2>ͼ�������Ϣ</h2>
       <p id="Submit_CategoryStatistics">
       <%= Html.DropDownList("CategoryCommand", ViewData["WhetherDisplayCategoryStatistics"] as SelectList)%>
             <input type="submit" value="��ѯ" />
       </p>
        <% var categorySelectResult = ViewData["CategorySelectResult"] as string;%>
        <% if(categorySelectResult == "Yes") { %>
             <ul>
             <% var categoryStatistics = ViewData["CategoryStatistics"] as List<m_categoryStatistice>; %>
             <% foreach (var category in categoryStatistics) { %>
                  <li> ���� <%= Html.Encode(category.categoryName)%> �� <%= Html.Encode(category.count)%> ����</li>
             <% } %>
             </ul>
             <div style="height:400px;">
             <asp:Silverlight InitParameters="PageName=ColumnBarCategoryStatistics"
             ID="Silverlight5" runat="server" Source="~/ClientBin/BLOOM.xap" MinimumVersion="2.0.31005.0" Width="100%" Height="100%" />
             </div>
        <% } %>  
          
       <h2>�շ���Ϣ</h2>
       <p id="Submit_MoneyEarned">
       <%= Html.DropDownList("KindOfGroupCommand", ViewData["KindOfGroup"] as SelectList)%>
       ��ѡ��ʱ���<%= Html.DropDownList("TimeSpanCommandForMoney", ViewData["TimeSpanForMoney"] as SelectList)%>
             <input type="submit" value="��ѯ" />
       </p>
       <% var kindOfGroupResult = ViewData["KindOfGroupResult"] as string;
          var timeSpanResult = ViewData["TimeSpanResultForMoney"] as string;%>
       <% switch(kindOfGroupResult) { 
               case "Whole": %>
               <h4>������</h4>
               <%  switch(timeSpanResult) {
                           case "Whole":  %>
                                <% string moneyEarned = ViewData["MoneyEarned"].ToString(); %>
                                <li> ����վ����������ĿǰΪֹ�����룺 <%= Html.Encode(moneyEarned)%> Ԫ </li>   
                                <% break; 
                           case "OneWeek": %>
                                <% string moneyForOneWeek = ViewData["MoneyForOneWeek"].ToString(); %>
                                <li> ���������룺 <%= Html.Encode(moneyForOneWeek)%> Ԫ </li>
                                <% break;
                           case "OneMonth": %>
                                <% string moneyForOneMonth = ViewData["MoneyForOneMonth"].ToString(); %>
                                <li> ���������룺 <%= Html.Encode(moneyForOneMonth)%> Ԫ </li>
                                <% break;
                        } break; 
               case "Age": %>
               <h4>����--������</h4>
               <% switch(timeSpanResult) { 
                           case "Whole" :%>
                                <% var moneyByAge = ViewData["MoneyByAge"] as List<m_moneyByAge>; %>
                                <% foreach (var item in moneyByAge) { %>
                                <li> ����Ϊ <%= Html.Encode(item.age)%> ������ <%= Html.Encode(item.money.ToString())%> </li>
                                <% } %> 
                                <div style="height:400px;">
                                <asp:Silverlight InitParameters="PageName=ColumnBarMoneyByAge,Day=0"
                                 ID="Silverlight6" runat="server" Source="~/ClientBin/BLOOM.xap" MinimumVersion="2.0.31005.0" Width="100%" Height="100%" />
                                </div>
                                <%  break;
                           case "OneWeek": %>
                                <% var moneyByAgeForOneWeek = ViewData["MoneyByAgeForOneWeek"] as List<m_moneyByAge>; %>
                                <% foreach (var item in moneyByAgeForOneWeek) { %>
                                <li> ����Ϊ <%= Html.Encode(item.age)%> ���ܹ����� <%= Html.Encode(item.money.ToString())%> </li>
                                <% } %>
                                <div style="height:400px;">
                                <asp:Silverlight InitParameters="PageName=ColumnBarMoneyByAge,Day=7"
                                 ID="Silverlight7" runat="server" Source="~/ClientBin/BLOOM.xap" MinimumVersion="2.0.31005.0" Width="100%" Height="100%" />
                                </div>                                
                                <% break;
                           case "OneMonth": %>
                                <% var moneyByAgeForOneMonth = ViewData["MoneyByAgeForOneMonth"] as List<m_moneyByAge>; %>
                                <% foreach (var item in moneyByAgeForOneMonth) { %>
                                <li> ����Ϊ <%= Html.Encode(item.age)%> ���¹����� <%= Html.Encode(item.money.ToString())%> </li>
                                <% } %>
                                <div style="height:400px;">
                                <asp:Silverlight InitParameters="PageName=ColumnBarMoneyByAge,Day=30"
                                 ID="Silverlight8" runat="server" Source="~/ClientBin/BLOOM.xap" MinimumVersion="2.0.31005.0" Width="100%" Height="100%" />
                                </div>
                                <% break;
                     } break;
               case "Occupation": %>
               <h4>ְҵ--������</h4>
               <% switch(timeSpanResult) { 
                           case "Whole" :%>
                                <% var moneyByOccupation = ViewData["MoneyByOccupation"] as List<m_moneyByOccupation>; %>
                                <% foreach (var item in moneyByOccupation) { %>
                                <li> ְҵΪ <%= Html.Encode(item.occupation)%> ������ <%= Html.Encode(item.money.ToString())%> </li>
                                <% }  %>
                                <div style="height:400px;">
                                <asp:Silverlight InitParameters="PageName=ColumnBarMoneyByOccupation,Day=0"
                                 ID="Silverlight11" runat="server" Source="~/ClientBin/BLOOM.xap" MinimumVersion="2.0.31005.0" Width="100%" Height="100%" />
                                </div>
                                <%  break; 
                           case "OneWeek": %>
                                <% var moneyByOccupationForOneWeek = ViewData["MoneyByOccupationForOneWeek"] as List<m_moneyByOccupation>; %>
                                <% foreach (var item in moneyByOccupationForOneWeek) { %>
                                <li> ְҵΪ <%= Html.Encode(item.occupation)%> ���ܹ����� <%= Html.Encode(item.money.ToString())%> </li>
                                <% }  %>
                                <div style="height:400px;">
                                <asp:Silverlight InitParameters="PageName=ColumnBarMoneyByOccupation,Day=7"
                                 ID="Silverlight9" runat="server" Source="~/ClientBin/BLOOM.xap" MinimumVersion="2.0.31005.0" Width="100%" Height="100%" />
                                </div>
                                <%  break; 
                           case "OneMonth": %>
                                <% var moneyByOccupationForOneMonth = ViewData["MoneyByOccupationForOneMonth"] as List<m_moneyByOccupation>; %>
                                <% foreach (var item in moneyByOccupationForOneMonth) { %>
                                <li> ְҵΪ <%= Html.Encode(item.occupation)%> ���¹����� <%= Html.Encode(item.money.ToString())%> </li>
                                <% }  %>
                                <div style="height:400px;">
                                <asp:Silverlight InitParameters="PageName=ColumnBarMoneyByOccupation,Day=30"
                                 ID="Silverlight10" runat="server" Source="~/ClientBin/BLOOM.xap" MinimumVersion="2.0.31005.0" Width="100%" Height="100%" />
                                </div>
                                <%  break; 
                     } break;
               case "Gender": %>
               <h4>�Ա�--������</h4>
               <% switch(timeSpanResult) { 
                           case "Whole" :%>
                                <% var moneyByGender = ViewData["MoneyByGender"] as List<m_moneyByGender>; %>
                                <% foreach (var item in moneyByGender) { %>
                                <li> �Ա�Ϊ <%= Html.Encode(item.gender)%> ������ <%= Html.Encode(item.money.ToString())%> </li>
                                <% }  %>
                                <div style="height:400px;">
                                <asp:Silverlight InitParameters="PageName=ColumnBarMoneyByGender,Day=0"
                                 ID="Silverlight12" runat="server" Source="~/ClientBin/BLOOM.xap" MinimumVersion="2.0.31005.0" Width="100%" Height="100%" />
                                </div>
                                <%  break; 
                           case "OneWeek": %>
                                <% var moneyByGenderForOneWeek = ViewData["MoneyByGenderForOneWeek"] as List<m_moneyByGender>; %>
                                <% foreach (var item in moneyByGenderForOneWeek) { %>
                                <li> �Ա�Ϊ <%= Html.Encode(item.gender)%> ���ܹ����� <%= Html.Encode(item.money.ToString())%> </li>
                                <% }  %>
                                <div style="height:400px;">
                                <asp:Silverlight InitParameters="PageName=ColumnBarMoneyByGender,Day=7"
                                 ID="Silverlight13" runat="server" Source="~/ClientBin/BLOOM.xap" MinimumVersion="2.0.31005.0" Width="100%" Height="100%" />
                                </div>
                                <%  break; 
                           case "OneMonth": %>
                                <% var moneyByGenderForOneMonth = ViewData["MoneyByGenderForOneMonth"] as List<m_moneyByGender>; %>
                                <% foreach (var item in moneyByGenderForOneMonth) { %>
                                <li> �Ա�Ϊ <%= Html.Encode(item.gender)%> ���ܹ����� <%= Html.Encode(item.money.ToString())%> </li>
                                <% }  %>
                                <div style="height:400px;">
                                <asp:Silverlight InitParameters="PageName=ColumnBarMoneyByGender,Day=30"
                                 ID="Silverlight14" runat="server" Source="~/ClientBin/BLOOM.xap" MinimumVersion="2.0.31005.0" Width="100%" Height="100%" />
                                </div>
                                <%  break; 
                     } break;
               case "Category": %>
               <h4>ͼ�����--������</h4>
               <% switch(timeSpanResult) { 
                           case "Whole" :%>
                                <% var moneyByCategory = ViewData["MoneyByCategory"] as List<m_moneyByCategory>; %>
                                <% foreach (var item in moneyByCategory) { %>
                                <li> ����Ϊ <%= Html.Encode(item.categoryName)%> ��׬Ǯ <%= Html.Encode(item.money.ToString())%> </li>
                                 <% }  %>
                                <div style="height:400px;">
                                <asp:Silverlight InitParameters="PageName=ColumnBarMoneyByCategory,Day=0"
                                 ID="Silverlight15" runat="server" Source="~/ClientBin/BLOOM.xap" MinimumVersion="2.0.31005.0" Width="100%" Height="100%" />
                                </div>
                                <%  break; 
                           case "OneWeek": %>
                                <% var moneyByCategoryForOneWeek = ViewData["MoneyByCategoryForOneWeek"] as List<m_moneyByCategory>; %>
                                <% foreach (var item in moneyByCategoryForOneWeek) { %>
                                <li> ����Ϊ <%= Html.Encode(item.categoryName)%> ���ܹ�׬Ǯ <%= Html.Encode(item.money.ToString())%> </li>
                                 <% }  %>
                                <div style="height:400px;">
                                <asp:Silverlight InitParameters="PageName=ColumnBarMoneyByCategory,Day=7"
                                 ID="Silverlight16" runat="server" Source="~/ClientBin/BLOOM.xap" MinimumVersion="2.0.31005.0" Width="100%" Height="100%" />
                                </div>
                                <%  break; 
                           case "OneMonth": %>
                                <% var moneyByCategoryForOneMonth = ViewData["MoneyByCategoryForOneMonth"] as List<m_moneyByCategory>; %>
                                <% foreach (var item in moneyByCategoryForOneMonth) { %>
                                <li> ����Ϊ <%= Html.Encode(item.categoryName)%> ���¹�׬Ǯ <%= Html.Encode(item.money.ToString())%> </li>
                                 <% }  %>
                                <div style="height:400px;">
                                <asp:Silverlight InitParameters="PageName=ColumnBarMoneyByCategory,Day=30"
                                 ID="Silverlight17" runat="server" Source="~/ClientBin/BLOOM.xap" MinimumVersion="2.0.31005.0" Width="100%" Height="100%" />
                                </div>
                                <%  break; 
                     } break; 
        } %>
        
        <h2>������</h2>
       <p id="Submit_BoughtTimes">
       <%= Html.DropDownList("CategoryForBoughtCommand", ViewData["CategoryForBought"] as SelectList)%>
       ��ѡ��ʱ���<%= Html.DropDownList("TimeSpanForBoughtCommand", ViewData["TimeSpanForBought"] as SelectList)%>
             <input type="submit" value="��ѯ" />
       </p>
       <% var categoryForBoughtResult = ViewData["CategoryForBoughtResult"] as string;
          var timeSpanForBoughtResult = ViewData["TimeSpanForBoughtResult"] as string;%>
       <% switch (categoryForBoughtResult)  { 
               case "Whole": %>
               <%  switch (timeSpanForBoughtResult) { 
                           case "Whole" :%>
                                  <h4>�����������</h4> 
                                  <% var boughtTimesRank = ViewData["BoughtTimesRank"] as List<m_boughtTimes>; %>
                                  <% foreach (var item in boughtTimesRank) { %>
                                       <li> ���� <%= Html.Encode(item.title) %> 
                                   �������� <%= Html.Encode(item.boughtTimes)%> ��</li>
                                <% } %>  
                                <div style="height:400px;">
                                <asp:Silverlight InitParameters="PageName=ColumnBarBookBoughtRank,Day=0"
                                 ID="Silverlight18" runat="server" Source="~/ClientBin/BLOOM.xap" MinimumVersion="2.0.31005.0" Width="100%" Height="100%" />
                                </div>
                                <%  break; 
                           case "OneWeek": %>
                                  <h4>���ܹ����������</h4>
                                  <% var boughtTimesRankForOneWeek = ViewData["BoughtTimesRankForOneWeek"] as List<m_boughtTimes>; %>
                                  <% foreach (var item in boughtTimesRankForOneWeek) { %>
                                       <li> ���� <%= Html.Encode(item.title) %> 
                                     ���ܹ������� <%= Html.Encode(item.boughtTimes)%> ��</li>
                                <% } %>  
                                <div style="height:400px;">
                                <asp:Silverlight InitParameters="PageName=ColumnBarBookBoughtRank,Day=7"
                                 ID="Silverlight19" runat="server" Source="~/ClientBin/BLOOM.xap" MinimumVersion="2.0.31005.0" Width="100%" Height="100%" />
                                </div>
                                <%  break; 
                           case "OneMonth": %>
                                  <h4>���¹����������</h4>
                                  <% var boughtTimesRankForOneMonth = ViewData["BoughtTimesRankForOneMonth"] as List<m_boughtTimes>; %>
                                  <% foreach (var item in boughtTimesRankForOneMonth) { %>
                                       <li> ���� <%= Html.Encode(item.title) %> 
                                     ���¹������� <%= Html.Encode(item.boughtTimes)%> ��</li>
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
                                <h4>����ͼ�� �����������</h4>
                                <% var categoryBoughtTimesRank = ViewData["CategoryBoughtTimesRank"] as List<m_categoryBoughtTimes>; %>
                                <% foreach (var item in categoryBoughtTimesRank) { %>
                                  <li> ���� <%= Html.Encode(item.categoryName)%> �������� <%= Html.Encode(item.boughtTimes)%> ��</li>
                                <% } %>  
                                <div style="height:400px;">
                                <asp:Silverlight InitParameters="PageName=ColumnBarCategoryBoughtRank,Day=0"
                                 ID="Silverlight21" runat="server" Source="~/ClientBin/BLOOM.xap" MinimumVersion="2.0.31005.0" Width="100%" Height="100%" />
                                </div>
                                <%  break; 
                           case "OneWeek": %>
                                <h4>���ܷ���ͼ�� �����������</h4>
                                 <% var categoryBoughtTimesRankForOneWeek = ViewData["CategoryBoughtTimesRankForOneWeek"] as List<m_categoryBoughtTimes>; %>
                                 <% foreach (var item in categoryBoughtTimesRankForOneWeek) { %>
                                  <li> ���� <%= Html.Encode(item.categoryName)%> ���ܹ������� <%= Html.Encode(item.boughtTimes)%> ��</li>
                                 <% } %>   
                                <div style="height:400px;">
                                <asp:Silverlight InitParameters="PageName=ColumnBarCategoryBoughtRank,Day=7"
                                 ID="Silverlight22" runat="server" Source="~/ClientBin/BLOOM.xap" MinimumVersion="2.0.31005.0" Width="100%" Height="100%" />
                                </div>
                                <%  break; 
                           case "OneMonth": %>
                                <h4>���·���ͼ�� �����������</h4>
                                 <% var categoryBoughtTimesRankForOneMonth = ViewData["CategoryBoughtTimesRankForOneMonth"] as List<m_categoryBoughtTimes>; %>
                                 <% foreach (var item in categoryBoughtTimesRankForOneMonth) { %>
                                  <li> ���� <%= Html.Encode(item.categoryName)%> ���¹������� <%= Html.Encode(item.boughtTimes)%> ��</li>
                                 <% } %>   
                                <div style="height:400px;">
                                <asp:Silverlight InitParameters="PageName=ColumnBarCategoryBoughtRank,Day=30"
                                 ID="Silverlight23" runat="server" Source="~/ClientBin/BLOOM.xap" MinimumVersion="2.0.31005.0" Width="100%" Height="100%" />
                                </div>
                                <%  break; 
                     } break; 
        } %>
        
        <h2>�����</h2>
       <p id="Submit_ViewedTime">
       <%= Html.DropDownList("CategoryForViewedCommand", ViewData["CategoryForViewed"] as SelectList)%>
             <input type="submit" value="��ѯ" />
       </p>
       <% var categoryForViewedResult = ViewData["CategoryForViewedResult"] as string;%>
       <% switch (categoryForViewedResult) { 
               case "Whole": %>
                     <h4>�����������</h4>
                     <% var viewedTimesRank = ViewData["ViewedTimesRank"] as List<m_viewedTimes>; %>
                     <% foreach (var item in viewedTimesRank) { %>
                     <li> ���� <%= Html.Encode(item.title) %> 
                        ������� <%= Html.Encode(item.viewedTimes)%> ��</li> 
                      <% } %>
                    <div style="height:400px;">
                    <asp:Silverlight InitParameters="PageName=ColumnBarBookViewedRank,Day=0"
                     ID="Silverlight24" runat="server" Source="~/ClientBin/BLOOM.xap" MinimumVersion="2.0.31005.0" Width="100%" Height="100%" />
                    </div>
                     <%  break; 
               case "Category": %>
                     <h4>����ͼ�� �����������</h4>
                     <% var categoryViewedTimesRank = ViewData["CategoryViewedTimesRank"] as List<m_categoryViewedTimes>; %>
                     <% foreach (var item in categoryViewedTimesRank) { %>
                     <li> ���� <%= Html.Encode(item.categoryName)%> ������� <%= Html.Encode(item.viewedTimes)%> ��</li>
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

