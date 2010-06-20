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
    public partial class ColumnBarMoneyByAge : UserControl
    {
        private string m_day;

        public ColumnBarMoneyByAge(string day)
        {
            m_day = day;
            InitializeComponent();
            this.Loaded += new RoutedEventHandler(MainPage_Loaded);
        }
        List<moneyByAge> m_List = new List<moneyByAge>();

        ColumnSeries moneyByAgeBar = new ColumnSeries();

        public class moneyByAge
        {
            public int age { get; set; }
            public Decimal money { get; set; }   // the number of people of the same age
        };

        private void mvc_OpenReadCompleted(object sender, OpenReadCompletedEventArgs e)
        {
            DataContractJsonSerializer json = new DataContractJsonSerializer(typeof(List<moneyByAge>));
            m_List = (List<moneyByAge>)json.ReadObject(e.Result);
            moneyByAgeBar = MoneyByAgeChart.Series[0] as ColumnSeries;
            moneyByAgeBar.ItemsSource = m_List;
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
            string url = "http://localhost:49392/Analyse/MoneyByAge/" + m_day;
            WebClient mvc = new WebClient();
            mvc.OpenReadCompleted += new OpenReadCompletedEventHandler(mvc_OpenReadCompleted);
            mvc.OpenReadAsync(new Uri(url));
        }

        private void MainPage_Loaded(object sender, RoutedEventArgs e)
        {
            Init();
            moneyByAgeBar = MoneyByAgeChart.Series[0] as ColumnSeries;
            moneyByAgeBar.ItemsSource = m_List;
        }

    }
}
