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
    public partial class ColumnBarBookBoughtRank : UserControl
    {
        public ColumnBarBookBoughtRank(string day)
        {
            m_day = day;
            InitializeComponent();
            this.Loaded += new RoutedEventHandler(MainPage_Loaded);
        }

        private string m_day;

        List<bookBoughtRank> m_List = new List<bookBoughtRank>();

        ColumnSeries bookBoughtRankBar = new ColumnSeries();

        public class bookBoughtRank
        {
            public int bookId { get; set;  }
            public string title { get; set; }
            public int boughtTimes { get; set; }  
        };

        private void mvc_OpenReadCompleted(object sender, OpenReadCompletedEventArgs e)
        {
            DataContractJsonSerializer json = new DataContractJsonSerializer(typeof(List<bookBoughtRank>));
            m_List = (List<bookBoughtRank>)json.ReadObject(e.Result);
            bookBoughtRankBar = BookBoughtRankChart.Series[0] as ColumnSeries;
            bookBoughtRankBar.ItemsSource = m_List;
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
            string url = "http://localhost:49392/Analyse/BookBoughtRank/" + m_day;
            WebClient mvc = new WebClient();
            mvc.OpenReadCompleted += new OpenReadCompletedEventHandler(mvc_OpenReadCompleted);
            mvc.OpenReadAsync(new Uri(url));
        }

        private void MainPage_Loaded(object sender, RoutedEventArgs e)
        {
            Init();
            bookBoughtRankBar = BookBoughtRankChart.Series[0] as ColumnSeries;
            bookBoughtRankBar.ItemsSource = m_List;
        }
    }
}
