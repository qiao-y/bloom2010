<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <meta   http-equiv="refresh"   content="3;url=../Home"></>

    <title>RegisterSuccess</title>
    <link href="../../Content/Project.css" rel="stylesheet" type="text/css" />
</head>
<body>
        <div class="Sidebar_Register">
            <div>
                <asp:Image ID="Image2" runat="server" 
                    ImageUrl="~/Image/pic/bloom.jpg" Height="100%" Width="100%" />  
            </div>
            <div class="Step">
                <h3>ע������</h3>
                <ul>
        	        <li>1.��дע����Ϣ</li>
        	        <li class="Current">2.���ע��</li>
                </ul>
            </div>
        </div>
        <div class="Main_Register">
            <div id="SuccessInfo">
                <p>��ϲ�� ע��ɹ�</p>
                <p>�������ת����ҳ</p>
            </div>
            <p id="Success">
                <input type="submit" value="������ת" />
            </p>
        </div>
</body>
</html>
