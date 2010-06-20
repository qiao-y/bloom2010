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
    public partial class ColumnBarMoneyByGender : UserControl
    {
        public ColumnBarMoneyByGender(string day)
        {
            m_day = day;
            InitializeComponent();
            this.Loaded += new RoutedEventHandler(MainPage_Loaded);
        }

        private string m_day;

        List<moneyByGender> m_List = new List<moneyByGender>();

        ColumnSeries moneyByGenderBar = new ColumnSeries();

        public class moneyByGender
        {
            public string gender { get; set; }
            public Decimal money { get; set; }   // the number of people of the same age
        };

        private void mvc_OpenReadCompleted(object sender, OpenReadCompletedEventArgs e)
        {
            DataContractJsonSerializer json = new DataContractJsonSerializer(typeof(List<moneyByGender>));
            m_List = (List<moneyByGender>)json.ReadObject(e.Result);
            moneyByGenderBar = MoneyByGenderChart.Series[0] as ColumnSeries;
            moneyByGenderBar.ItemsSource = m_List;
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
            string url = "http://localhost:49392/Analyse/MoneyByGender/" + m_day;
            WebClient mvc = new WebClient();
            mvc.OpenReadCompleted += new OpenReadCompletedEventHandler(mvc_OpenReadCompleted);
            mvc.OpenReadAsync(new Uri(url));
        }

        private void MainPage_Loaded(object sender, RoutedEventArgs e)
        {
            Init();
            moneyByGenderBar = MoneyByGenderChart.Series[0] as ColumnSeries;
            moneyByGenderBar.ItemsSource = m_List;
        }
    }
}
