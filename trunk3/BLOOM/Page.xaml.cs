using System;
using System.Collections.Generic;
using System.Windows.Ink;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;

namespace BLOOM
{
    public partial class Page : UserControl
    {
        private  Stroke _drawStroke;
        private List<FillColor> _FillColor;
        List<SizeData> _SizeData;
        private bool _isCaptureMouseCursor = false;
        private bool _isEraser = false;

        public Page()
        {
            InitializeComponent();
            SetBoundary();  //设定边界

            //初始化数据
            _FillColor = new List<FillColor>() { 
                new FillColor(){ Color = new SolidColorBrush(Colors.Black), Name="黑色"},
                new FillColor(){ Color = new SolidColorBrush(Colors.Red), Name="红色"},
                new FillColor(){ Color = new SolidColorBrush(Colors.Blue), Name="蓝色"},
                new FillColor(){ Color = new SolidColorBrush(Colors.Green),Name="绿色"},              
                new FillColor(){ Color = new SolidColorBrush(Colors.Orange), Name="橙色"},
            };

            _SizeData = new List<SizeData>()
            {
                new SizeData(){ Size=1.0},
                new SizeData(){ Size=3.0},
                new SizeData(){ Size=5.0},
                new SizeData(){ Size=7.0},
                new SizeData(){ Size=9.0},
                new SizeData(){ Size=11.0},
                new SizeData(){ Size=13.0},
                new SizeData(){ Size=15.0}
            };

            this.Loaded += new RoutedEventHandler(Page_Loaded);
        }
        void Page_Loaded(object sender, RoutedEventArgs e)
        {
            this.cboColor.ItemsSource = _FillColor;
            this.cboColor.SelectedIndex = 0;

            this.cboWidth.ItemsSource = _SizeData;
            this.cboWidth.SelectedIndex = 0;

        }

        private void inkPresenter_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            //抓取滑鼠指标
            inkPresenter.CaptureMouse();
            _isCaptureMouseCursor = true;
            if (_isEraser)
            {
                RemoveStroke(e);
            }
            else
            {
                //设定画笔内容 
                _drawStroke = new Stroke();
                _drawStroke.DrawingAttributes.Color = (cboColor.SelectedItem as FillColor).Color.Color;
                _drawStroke.DrawingAttributes.Width = (this.cboWidth.SelectedItem as SizeData).Size;
                _drawStroke.DrawingAttributes.Height = (this.cboWidth.SelectedItem as SizeData).Size;

                //表示当使用者以手写笔或滑鼠输入笔墨笔画時，所收集的单一点。 
                //这里收集使用者输入的触点 
                _drawStroke.StylusPoints.Add(e.StylusDevice.GetStylusPoints(inkPresenter));

                //将收集好的单点集合新增到InkPresenter物件中 
                inkPresenter.Strokes.Add(_drawStroke);
            }
        }

        private void inkPresenter_MouseLeftButtonUp(object sender, MouseButtonEventArgs e)
        {
            //释放滑鼠指标的抓取 
            inkPresenter.ReleaseMouseCapture();
            _drawStroke = null;
            _isCaptureMouseCursor = false;
        }

        private void inkPresenter_MouseMove(object sender, MouseEventArgs e)
        {
            if (_isCaptureMouseCursor)
            {
                if (_isEraser)
                {
                    RemoveStroke(e);
                }
                else if (_drawStroke != null)
                {
                    // 增加 StylusPoint 
                    _drawStroke.StylusPoints.Add(e.StylusDevice.GetStylusPoints(inkPresenter));
                }
            }
        }

        private void RemoveStroke(MouseEventArgs e)
        {
            // Stroke.HitTest(StylusPointCollection) -　Stroke 是否与指定的 StylusPoint 集合相连
            // Strokes.HitTest(StylusPointCollection) - 与指定的 StylusPoint 集合相连的 Stroke 集合

            // 获取当前鼠标所在位置处的 StylusPoint 集合
            StylusPointCollection erasePoints = new StylusPointCollection();
            erasePoints.Add(e.StylusDevice.GetStylusPoints(inkPresenter));

            // 与当前鼠标所在位置处的 StylusPoint 集合相连的 Stroke 集合
            StrokeCollection hitStrokes = inkPresenter.Strokes.HitTest(erasePoints);

            for (int i = 0; i < hitStrokes.Count; i++)
            {
                // 在 InkPresenter 上清除指定的 Stroke
                inkPresenter.Strokes.Remove(hitStrokes[i]);
            }
        }
        private void SetBoundary()
        {
            RectangleGeometry MyRectangleGeometry = new RectangleGeometry();
            MyRectangleGeometry.Rect = new Rect(0, 0, inkPresenter.ActualWidth, inkPresenter.ActualHeight);
            inkPresenter.Clip = MyRectangleGeometry;
        }

        private void Clear_Click(object sender, RoutedEventArgs e)
        {
            inkPresenter.Cursor = Cursors.Eraser;
            _isEraser = true;
        }

        private void Write_Click(object sender, RoutedEventArgs e)
        {
            // inkPresenter.Strokes.Clear();
            inkPresenter.Cursor = Cursors.Stylus;
            _isEraser = false;
        }
    }

    public class FillColor
    {
        public SolidColorBrush Color { set; get; }
        public string Name { set; get; }
    }

    public class SizeData
    {
        public double Size { set; get; }
    }
}
