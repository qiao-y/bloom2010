#pragma checksum "D:\trunk3\BLOOM\ColumnBarForUser.xaml" "{406ea660-64cf-4c82-b6f0-42d48172a799}" "2E854A379042B43B32F63EBDB62B6A59"
//------------------------------------------------------------------------------
// <auto-generated>
//     此代码由工具生成。
//     运行时版本:2.0.50727.4927
//
//     对此文件的更改可能会导致不正确的行为，并且如果
//     重新生成代码，这些更改将会丢失。
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Automation.Peers;
using System.Windows.Automation.Provider;
using System.Windows.Controls;
using System.Windows.Controls.DataVisualization.Charting;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Interop;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Imaging;
using System.Windows.Resources;
using System.Windows.Shapes;
using System.Windows.Threading;


namespace BLOOM {
    
    
    public partial class ColumnBarForUser : System.Windows.Controls.UserControl {
        
        internal System.Windows.Controls.Grid LayoutRoot;
        
        internal System.Windows.Controls.DataVisualization.Charting.Chart AgeChart;
        
        internal System.Windows.Controls.DataVisualization.Charting.Chart OccupationChart;
        
        internal System.Windows.Controls.DataVisualization.Charting.Chart GenderChart;
        
        internal System.Windows.Controls.DataVisualization.Charting.Chart CreateDateChart;
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Windows.Application.LoadComponent(this, new System.Uri("/BLOOM;component/ColumnBarForUser.xaml", System.UriKind.Relative));
            this.LayoutRoot = ((System.Windows.Controls.Grid)(this.FindName("LayoutRoot")));
            this.AgeChart = ((System.Windows.Controls.DataVisualization.Charting.Chart)(this.FindName("AgeChart")));
            this.OccupationChart = ((System.Windows.Controls.DataVisualization.Charting.Chart)(this.FindName("OccupationChart")));
            this.GenderChart = ((System.Windows.Controls.DataVisualization.Charting.Chart)(this.FindName("GenderChart")));
            this.CreateDateChart = ((System.Windows.Controls.DataVisualization.Charting.Chart)(this.FindName("CreateDateChart")));
        }
    }
}
