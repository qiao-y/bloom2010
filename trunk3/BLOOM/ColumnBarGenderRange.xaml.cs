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
    public partial class ColumnBarGenderRange : UserControl
    {
        public ColumnBarGenderRange()
        {
            InitializeComponent();
            this.Loaded += new RoutedEventHandler(MainPage_LoadedForGender);
        }

        List<GenderRange> m_genderRange = new List<GenderRange>();

        ColumnSeries genderBar = new ColumnSeries();

        public class GenderRange
        {
            public string gender { get; set; }
            public int count { get; set; }
        }

        private void mvc_OpenReadCompletedForGender(object sender, OpenReadCompletedEventArgs e)
        {
            DataContractJsonSerializer json = new DataContractJsonSerializer(typeof(List<GenderRange>));
            m_genderRange = (List<GenderRange>)json.ReadObject(e.Result);
            genderBar = GenderChart.Series[0] as ColumnSeries;
            genderBar.ItemsSource = m_genderRange;
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

        private void InitForGender()
        {
            WebClient mvc = new WebClient();
            mvc.OpenReadCompleted += new OpenReadCompletedEventHandler(mvc_OpenReadCompletedForGender);
            mvc.OpenReadAsync(new Uri("http://localhost:49392/Analyse/GenderRange"));
        }

        private void MainPage_LoadedForGender(object sender, RoutedEventArgs e)
        {
            InitForGender();
            genderBar = GenderChart.Series[0] as ColumnSeries;
            genderBar.ItemsSource = m_genderRange;
        }
    }
}
