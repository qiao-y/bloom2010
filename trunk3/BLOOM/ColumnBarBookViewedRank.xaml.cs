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
    public partial class ColumnBarBookViewedRank : UserControl
    {
        public ColumnBarBookViewedRank(string day)
        {
            m_day = day;
            InitializeComponent();
            this.Loaded += new RoutedEventHandler(MainPage_Loaded);
        }

        private string m_day;

        List<bookViewedRank> m_List = new List<bookViewedRank>();

        ColumnSeries bookViewedRankBar = new ColumnSeries();

        public class bookViewedRank
        {
            public int bookId { get; set; }
            public string title { get; set; }
            public int viewedTimes { get; set; }  
        };

        private void mvc_OpenReadCompleted(object sender, OpenReadCompletedEventArgs e)
        {
            DataContractJsonSerializer json = new DataContractJsonSerializer(typeof(List<bookViewedRank>));
            m_List = (List<bookViewedRank>)json.ReadObject(e.Result);
            bookViewedRankBar = BookViewedRankChart.Series[0] as ColumnSeries;
            bookViewedRankBar.ItemsSource = m_List;
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

        private void Init()
        {
            string url = "http://localhost:49392/Analyse/BookViewedRank/" + m_day;
            WebClient mvc = new WebClient();
            mvc.OpenReadCompleted += new OpenReadCompletedEventHandler(mvc_OpenReadCompleted);
            mvc.OpenReadAsync(new Uri(url));
        }

        private void MainPage_Loaded(object sender, RoutedEventArgs e)
        {
            Init();
            bookViewedRankBar = BookViewedRankChart.Series[0] as ColumnSeries;
            bookViewedRankBar.ItemsSource = m_List;
        }
    }
}
