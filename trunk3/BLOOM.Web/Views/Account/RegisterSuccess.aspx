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
                <h3>注册流程</h3>
                <ul>
        	        <li>1.填写注册信息</li>
        	        <li class="Current">2.完成注册</li>
                </ul>
            </div>
        </div>
        <div class="Main_Register">
            <div id="SuccessInfo">
                <p>恭喜您 注册成功</p>
                <p>三秒后跳转至主页</p>
            </div>
            <p id="Success">
                <input type="submit" value="立刻跳转" />
            </p>
        </div>
</body>
</html>
