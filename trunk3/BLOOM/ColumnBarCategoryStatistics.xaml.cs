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
    public partial class ColumnBarCategoryStatistics : UserControl
    {
              
        List<Category> m_categoryStatisticsList = new List<Category>();

        ColumnSeries categoryBar = new ColumnSeries();

        public class Category
        {
            public string categoryName { get; set; }
            public int count { get; set; }   // the number of people of the same age
        };

        private void mvc_OpenReadCompleted(object sender, OpenReadCompletedEventArgs e)
        {
            DataContractJsonSerializer json = new DataContractJsonSerializer(typeof(List<Category>));
            m_categoryStatisticsList = (List<Category>)json.ReadObject(e.Result);
            categoryBar = CategoryChart.Series[0] as ColumnSeries;
            categoryBar.ItemsSource = m_categoryStatisticsList;
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

        public ColumnBarCategoryStatistics()
        {
            InitializeComponent();
            this.Loaded += new RoutedEventHandler(MainPage_Loaded);
        }

        private void Init()
        {
            WebClient mvc = new WebClient();
            mvc.OpenReadCompleted += new OpenReadCompletedEventHandler(mvc_OpenReadCompleted);
            mvc.OpenReadAsync(new Uri("http://localhost:49392/Analyse/CategoryStatistics"));
        }

        private void MainPage_Loaded(object sender, RoutedEventArgs e)
        {
            Init();
            categoryBar = CategoryChart.Series[0] as ColumnSeries;
            categoryBar.ItemsSource = m_categoryStatisticsList;
        }

    }
}
