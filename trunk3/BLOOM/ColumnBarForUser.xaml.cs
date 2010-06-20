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
    public partial class ColumnBarForUser : UserControl
    {
        List<AgeRange> m_ageRangeList = new List<AgeRange>();
        List<OccupationRange> m_occupationList = new List<OccupationRange>();
        List<GenderRange> m_genderRange = new List<GenderRange>();
        List<CreateDateRange> m_createDateRange = new List<CreateDateRange>();

        ColumnSeries ageBar = new ColumnSeries();
        ColumnSeries occupationBar = new ColumnSeries();
        ColumnSeries genderBar = new ColumnSeries();
        ColumnSeries createDateBar = new ColumnSeries();

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

        public class GenderRange
        {
            public string gender { get; set; }
            public int count { get; set; }
        }

        public class CreateDateRange
        {
            public string createDate { get; set; }
            public int count { get; set; }
        }

        private void mvc_OpenReadCompletedForAge(object sender, OpenReadCompletedEventArgs e)
        {
            DataContractJsonSerializer json = new DataContractJsonSerializer(typeof(List<AgeRange>));
            m_ageRangeList = (List<AgeRange>)json.ReadObject(e.Result);
            ageBar = AgeChart.Series[0] as ColumnSeries;
            ageBar.ItemsSource = m_ageRangeList;
        }

        private void mvc_OpenReadCompletedForOccupation(object sender, OpenReadCompletedEventArgs e)
        {
            DataContractJsonSerializer json = new DataContractJsonSerializer(typeof(List<OccupationRange>));
            m_occupationList = (List<OccupationRange>)json.ReadObject(e.Result);
            occupationBar = OccupationChart.Series[0] as ColumnSeries;
            occupationBar.ItemsSource = m_occupationList;
        }

        private void mvc_OpenReadCompletedForGender(object sender, OpenReadCompletedEventArgs e)
        {
            DataContractJsonSerializer json = new DataContractJsonSerializer(typeof(List<GenderRange>));
            m_genderRange = (List<GenderRange>)json.ReadObject(e.Result);
            genderBar = GenderChart.Series[0] as ColumnSeries;
            genderBar.ItemsSource = m_genderRange;
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

        public ColumnBarForUser()
        {
            InitializeComponent();
            this.Loaded += new RoutedEventHandler(MainPage_LoadedForAge);
            this.Loaded += new RoutedEventHandler(MainPage_LoadedForOccupation);
            this.Loaded += new RoutedEventHandler(MainPage_LoadedForGender);
            this.Loaded += new RoutedEventHandler(MainPage_LoadedForCreateDate);
        }

        private void InitForAge()
        {
            WebClient mvc = new WebClient();
            mvc.OpenReadCompleted += new OpenReadCompletedEventHandler(mvc_OpenReadCompletedForAge);
            mvc.OpenReadAsync(new Uri("http://localhost:49392/Analyse/AgeRange"));
        }

        private void InitForOccupation()
        {
            WebClient mvc = new WebClient();
            mvc.OpenReadCompleted += new OpenReadCompletedEventHandler(mvc_OpenReadCompletedForOccupation);
            mvc.OpenReadAsync(new Uri("http://localhost:49392/Analyse/OccupationRange"));
        }

        private void InitForGender()
        {
            WebClient mvc = new WebClient();
            mvc.OpenReadCompleted += new OpenReadCompletedEventHandler(mvc_OpenReadCompletedForGender);
            mvc.OpenReadAsync(new Uri("http://localhost:49392/Analyse/GenderRange"));
        }
         
        private void InitForCreateDate()
        {
            WebClient mvc = new WebClient();
            mvc.OpenReadCompleted += new OpenReadCompletedEventHandler(mvc_OpenReadCompletedForCreateDate);
            mvc.OpenReadAsync(new Uri("http://localhost:49392/Analyse/CreateDateRange"));
        }

        private void MainPage_LoadedForAge(object sender, RoutedEventArgs e)
        {
            InitForAge();
            ageBar = AgeChart.Series[0] as ColumnSeries;
            ageBar.ItemsSource = m_ageRangeList;
        }

        private void MainPage_LoadedForOccupation(object sender, RoutedEventArgs e)
        {
            InitForOccupation();
            occupationBar = OccupationChart.Series[0] as ColumnSeries;
            occupationBar.ItemsSource = m_occupationList;
        }

        private void MainPage_LoadedForGender(object sender, RoutedEventArgs e)
        {
            InitForGender();
            genderBar = GenderChart.Series[0] as ColumnSeries;
            genderBar.ItemsSource = m_genderRange;
        }

        private void MainPage_LoadedForCreateDate(object sender, RoutedEventArgs e)
        {
            InitForCreateDate();
            createDateBar = CreateDateChart.Series[0] as ColumnSeries;
            createDateBar.ItemsSource = m_createDateRange;
        }
    }
}
