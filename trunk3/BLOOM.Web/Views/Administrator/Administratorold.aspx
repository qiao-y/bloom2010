<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Administrator</title>
    <link href="../../Content/Project.css" rel="stylesheet" type="text/css" />
</head>

<body>

    
    <div id="Adm_sidebar">
        <<table border="0" cellspacing="0" cellpadding="0" width="100%" 
            style="height: 16px">
        	<tr>
        	    <td id="DataAnalysis">����ͳ�Ʒ���</td>
        		<td id="BookManage">ͼ����Ϣ����</td>
        		<td id="UserManage">�û���Ϣ����</td>
        	</tr>
        </table>
    </div>

    <div id="adm_main">
        <% Html.RenderPartial("book_list"); %>
    </div>
    
</body>
</html>
