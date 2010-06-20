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
    public partial class ColumnBarCreateDateRange : UserControl
    {
        public ColumnBarCreateDateRange()
        {
            InitializeComponent();
            this.Loaded += new RoutedEventHandler(MainPage_LoadedForCreateDate);
        }

        List<CreateDateRange> m_createDateRange = new List<CreateDateRange>();

        ColumnSeries createDateBar = new ColumnSeries();

        public class CreateDateRange
        {
            public string createDate { get; set; }
            public int count { get; set; }
        }
        
        private void mvc_OpenReadCompletedForCreateDate(object sender, OpenReadCompletedEventArgs e)
        {
            DataContractJsonSerializer json = new DataContractJsonSerializer(typeof(List<CreateDateRange>));
            m_createDateRange = (List<CreateDateRange>)json.ReadObject(e.Result);
            createDateBar = CreateDateChart.Series[0] as ColumnSeries;
            createDateBar.ItemsSource = m_createDateRange;
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

        private void InitForCreateDate()
        {
            WebClient mvc = new WebClient();
            mvc.OpenReadCompleted += new OpenReadCompletedEventHandler(mvc_OpenReadCompletedForCreateDate);
            mvc.OpenReadAsync(new Uri("http://localhost:49392/Analyse/CreateDateRange"));
        }

        private void MainPage_LoadedForCreateDate(object sender, RoutedEventArgs e)
        {
            InitForCreateDate();
            createDateBar = CreateDateChart.Series[0] as ColumnSeries;
            createDateBar.ItemsSource = m_createDateRange;
        }
    }
}
