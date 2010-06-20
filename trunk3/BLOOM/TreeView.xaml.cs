//Date: 2010.6.18
//Author: QIAO Yu
//Reference: http://timheuer.com/blog/archive/2009/02/09/silverlight-as-a-view-in-aspnet-mvc.aspx
//              http://www.silverlight.net/content/samples/sl3/toolkitcontrolsamples/run/default.html

// (c) Copyright Microsoft Corporation.
// This source is subject to the Microsoft Public License (Ms-PL).
// Please see http://go.microsoft.com/fwlink/?LinkID=131993 for details.
// All other rights reserved.

using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Windows;
using System.Windows.Controls;
using System.ComponentModel;

namespace BLOOM
{
    public partial class TreeView : UserControl
    {
        public class ForumInfo
        {
            public int ForumID { get; set; }
            public int ParendID { get; set; }
            public string ForumName { get; set; }
        }


        public TreeView()
        {
            InitializeComponent();


            List<ForumInfo> result = new List<ForumInfo>();
            result.Add(new ForumInfo { ForumID = 1, ForumName = "Cyber", ParendID = 0 });
            result.Add(new ForumInfo { ForumID = 2, ForumName = "Zeus", ParendID = 0 });


            if (result.Count > 0)
            {
                foreach (ForumInfo foruminfo in result)
                {
                    TreeViewItem objTreeNode = new TreeViewItem();
                    objTreeNode.Header = foruminfo.ForumName;
                    objTreeNode.DataContext = foruminfo;

                    //此样式将会添加的所有叶子结点上
                    //objTreeNode.ItemContainerStyle = this.Resources["RedItemStyle"] as Style;

                    //添加根节点
                    //if (treeViewItem == null)
                    //{
                    //    TreeOfLife.Items.Add(objTreeNode);
                    //}
                    //else
                    //{
                    //    treeViewItem.Items.Add(objTreeNode);
                    //}
                    //AddTreeNode(foruminfo.ForumID, objTreeNode);
                }
            }

        }
    }
}
