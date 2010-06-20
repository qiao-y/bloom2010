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
    public partial class ColumnBarAgeRange : UserControl
    {
        public ColumnBarAgeRange()
        {
            InitializeComponent();
            this.Loaded += new RoutedEventHandler(MainPage_LoadedForAge);
        }
        List<AgeRange> m_ageRangeList = new List<AgeRange>();

        ColumnSeries ageBar = new ColumnSeries();

        public class AgeRange
        {
            public int age { get; set; }
            public int count { get; set; }   // the number of people of the same age
        };
        
        private void mvc_OpenReadCompletedForAge(object sender, OpenReadCompletedEventArgs e)
        {
            DataContractJsonSerializer json = new DataContractJsonSerializer(typeof(List<AgeRange>));
            m_ageRangeList = (List<AgeRange>)json.ReadObject(e.Result);
            ageBar = AgeChart.Series[0] as ColumnSeries;
            ageBar.ItemsSource = m_ageRangeList;
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

        private void InitForAge()
        {
            WebClient mvc = new WebClient();
            mvc.OpenReadCompleted += new OpenReadCompletedEventHandler(mvc_OpenReadCompletedForAge);
            mvc.OpenReadAsync(new Uri("http://localhost:49392/Analyse/AgeRange"));
        }

        private void MainPage_LoadedForAge(object sender, RoutedEventArgs e)
        {
            InitForAge();
            ageBar = AgeChart.Series[0] as ColumnSeries;
            ageBar.ItemsSource = m_ageRangeList;
        }

    }
}
