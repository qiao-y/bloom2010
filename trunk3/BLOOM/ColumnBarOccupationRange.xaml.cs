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
    public partial class ColumnBarOccupationRange : UserControl
    {
        public ColumnBarOccupationRange()
        {
            InitializeComponent();
            this.Loaded += new RoutedEventHandler(MainPage_LoadedForOccupation);
        }

        List<OccupationRange> m_occupationList = new List<OccupationRange>();

        ColumnSeries occupationBar = new ColumnSeries();
        
        public class OccupationRange
        {
            public string occupation { get; set; }
            public int count { get; set; }
        };

        private void mvc_OpenReadCompletedForOccupation(object sender, OpenReadCompletedEventArgs e)
        {
            DataContractJsonSerializer json = new DataContractJsonSerializer(typeof(List<OccupationRange>));
            m_occupationList = (List<OccupationRange>)json.ReadObject(e.Result);
            occupationBar = OccupationChart.Series[0] as ColumnSeries;
            occupationBar.ItemsSource = m_occupationList;
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

        private void InitForOccupation()
        {
            WebClient mvc = new WebClient();
            mvc.OpenReadCompleted += new OpenReadCompletedEventHandler(mvc_OpenReadCompletedForOccupation);
            mvc.OpenReadAsync(new Uri("http://localhost:49392/Analyse/OccupationRange"));
        }

        private void MainPage_LoadedForOccupation(object sender, RoutedEventArgs e)
        {
            InitForOccupation();
            occupationBar = OccupationChart.Series[0] as ColumnSeries;
            occupationBar.ItemsSource = m_occupationList;
        }

    }
}
