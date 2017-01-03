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
using System.ComponentModel;
using MahApps.Metro.Controls;
using System.Diagnostics;
using MaterialDesignThemes.Wpf;
using System.Windows.Controls.Primitives;
using AlphaElectric_DataAccessLayer;
using AlphaElectric_DataAccessLayer.Factories;
using AlphaElectric.Logic;

namespace AlphaElectric.Forms
{
    /// <summary>
    /// Interaction logic for Home.xaml
    /// </summary>
    public partial class HomeProducts : UserControl
    {
        public HomeProducts()
        {
            InitializeComponent();
            WelcomeMessage.Text = "Welcome " + LoggedInUser.Instance.Info.Name + "!";
        }

        //Executing after loading window
        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            //worker = new BackgroundWorker();
            //worker.DoWork += Worker_DoWork;
            //worker.RunWorkerAsync();
        }

        //private void TextBox_MouseDown(object sender, MouseButtonEventArgs e)
        //{
        //    this.Hide();
        //    var obj = new AddProduct();
        //    obj.Show();
        //    this.Close();
        //}

        #region main-buttons

        private void ButtonEmployees_Click(object sender, RoutedEventArgs e)
        {

        }

        private void ButtonProducts_Click(object sender, RoutedEventArgs e)
        {

        }

        private void ButtonCompanies_Click(object sender, RoutedEventArgs e)
        {

        }

        private void ButtonProjects_Click(object sender, RoutedEventArgs e)
        {

        }

        private void ButtonPurchaseSelling_Click(object sender, RoutedEventArgs e)
        {

        }
        #endregion

        #region socialbuttons

        // Social Buttons
        private void TwitterButton_OnClick(object sender, RoutedEventArgs e)
        {
            Process.Start("http://twitter.com/shuayb_ashraf");
        }

        private void ChatButton_OnClick(object sender, RoutedEventArgs e)
        {
            Process.Start("https://gitter.im/shuayb_ashraf");
        }

        private void EmailButton_OnClick(object sender, RoutedEventArgs e)
        {
            Process.Start("mailto://shuayb@gmx.com");
        }

        // Information Links
        private void TextBlock_WebOrdersMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            Process.Start("http://alphaelectric.shuayb.me/");
        }
        #endregion

        private void ButtonAddNewProduct_Click(object sender, RoutedEventArgs e)
        {
            this.topgrid.Visibility = Visibility.Collapsed;
            this.mainscrollviewer.Visibility = Visibility.Collapsed;

            ProductAddNew x = new ProductAddNew();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
        }

        private void ButtonUpdateProducts_Click(object sender, RoutedEventArgs e)
        {
            this.topgrid.Visibility = Visibility.Collapsed;
            this.mainscrollviewer.Visibility = Visibility.Collapsed;

            //ProductEdit x = new ProductEdit();
            //UserPages.Children.Clear();
            //UserPages.Children.Add(x);
        }

        private void ButtonPanelList_Click(object sender, RoutedEventArgs e)
        {
            this.topgrid.Visibility = Visibility.Collapsed;
            this.mainscrollviewer.Visibility = Visibility.Collapsed;

            PanelList x = new PanelList();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
        }

        private void ButtonPartList_Click(object sender, RoutedEventArgs e)
        {
            this.topgrid.Visibility = Visibility.Collapsed;
            this.mainscrollviewer.Visibility = Visibility.Collapsed;

            PartList x = new PartList();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
        }
    }
}
