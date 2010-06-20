//Date: 2010.6.18
//Author: QIAO Yu
//Reference: http://timheuer.com/blog/archive/2009/02/09/silverlight-as-a-view-in-aspnet-mvc.aspx
//              http://www.silverlight.net/content/samples/sl3/toolkitcontrolsamples/run/default.html
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;
using System.Windows.Controls.DataVisualization.Charting;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Json;

namespace BLOOM
{
    public partial class ColumnBar : UserControl
    {
        List<AgeRange> m_ageRangeList = new List<AgeRange>();
        List<OccupationRange> m_occupationList = new List<OccupationRange>();
        ColumnSeries bar1 = new ColumnSeries();
        ColumnSeries bar2 = new ColumnSeries();

        public class AgeRange
        {
            public int age { get; set; }
            public int count { get; set; }   // the number of people of the same age
        };
        
        public class OccupationRange
        {
            public string occupation { get; set; }
            public int count { get; set; }
        };

        private void mvc_OpenReadCompleted1(object sender, OpenReadCompletedEventArgs e)
        {
            DataContractJsonSerializer json = new DataContractJsonSerializer(typeof(List<AgeRange>));
            m_ageRangeList = (List<AgeRange>)json.ReadObject(e.Result);
            bar1 = AgeChart.Series[0] as ColumnSeries;
            bar1.ItemsSource = m_ageRangeList;
        }

        private void mvc_OpenReadCompleted2(object sender, OpenReadCompletedEventArgs e)
        {
            DataContractJsonSerializer json = new DataContractJsonSerializer(typeof(List<OccupationRange>));
            m_occupationList = (List<OccupationRange>)json.ReadObject(e.Result);
            bar2 = OccupationChart.Series[0] as ColumnSeries;
            bar2.ItemsSource = m_occupationList;
        }

        private void OnMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            Chart chart = sender as Chart;

            if (null != chart)
            {
                // Toggle each Series ItemsSource so the reveal/hide animations can be seen
                foreach (DataPointSeries series in chart.Series)
                {
                    if (null == series.Tag)
                    {
                        series.Tag = series.ItemsSource;
                        series.ItemsSource = null;
                    }
                    else
                    {
                        series.ItemsSource = series.Tag as System.Collections.IEnumerable;
                        series.Tag = null;
                    }
                }
            }
        }

        public ColumnBar()
        {
            InitializeComponent();
            this.Loaded += new RoutedEventHandler(MainPage_Loaded1);
            this.Loaded += new RoutedEventHandler(MainPage_Loaded2);
        }

        private void Init1()
        {
            WebClient mvc = new WebClient();
            mvc.OpenReadCompleted += new OpenReadCompletedEventHandler(mvc_OpenReadCompleted1);
            mvc.OpenReadAsync(new Uri("http://localhost:49392/Analyse/AgeRange"));
        }

        private void Init2()
        {
            WebClient mvc = new WebClient();
            mvc.OpenReadCompleted += new OpenReadCompletedEventHandler(mvc_OpenReadCompleted2);
            mvc.OpenReadAsync(new Uri("http://localhost:49392/Analyse/OccupationRange"));
        }

        private void MainPage_Loaded1(object sender, RoutedEventArgs e)
        {
            Init1();
            bar1 = AgeChart.Series[0] as ColumnSeries;
            bar1.ItemsSource = m_ageRangeList;
        }

        private void MainPage_Loaded2(object sender, RoutedEventArgs e)
        {
            Init2();
            bar2 = OccupationChart.Series[0] as ColumnSeries;
            bar2.ItemsSource = m_occupationList;
        }
    }
}