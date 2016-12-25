using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
// To access MetroWindow
using MahApps.Metro.Controls;
using System.ComponentModel;

namespace AlphaElectric.Forms
{
    /// <summary>
    /// Interaction logic for AddProduct.xaml
    /// </summary>
    public partial class AddProduct : MetroWindow
    {
        public AddProduct()
        {
            InitializeComponent();
        }

        private void P_Panel_Checked(object sender, RoutedEventArgs e)
        {

            TxtBxStackPanel.Visibility = Visibility.Visible;
            TxtBxStackPanel2.Visibility = Visibility.Visible;
            TxtBxStackPanel3.Visibility = Visibility.Visible;
        }
        private void P_Product_Checked(object sender, RoutedEventArgs e)
        {
            TxtBxStackPanel.Visibility = Visibility.Collapsed;
            TxtBxStackPanel2.Visibility = Visibility.Collapsed;
            TxtBxStackPanel3.Visibility = Visibility.Collapsed;

        }
    }



    //public class MyBooleanToVisibilityConverter : IValueConverter
    //{
    //    private BooleanToVisibilityConverter _converter = new BooleanToVisibilityConverter();
    //    private DependencyObject _dummy = new DependencyObject();

    //    private bool DesignMode
    //    {
    //        get
    //        {
    //            return DesignerProperties.GetIsInDesignMode(_dummy);
    //        }
    //    }

    //    #region IValueConverter Members

    //    public object Convert(object value, Type targetType, object parameter, System.Globalization.CultureInfo culture)
    //    {
    //        if (DesignMode)
    //            return Visibility.Visible;
    //        else
    //            return _converter.Convert(value, targetType, parameter, culture);
    //    }

    //    public object ConvertBack(object value, Type targetType, object parameter, System.Globalization.CultureInfo culture)
    //    {
    //        return _converter.ConvertBack(value, targetType, parameter, culture);
    //    }

    //    #endregion
    //}
}
