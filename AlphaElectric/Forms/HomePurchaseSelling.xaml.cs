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
    public partial class HomePurchaseSelling : UserControl
    {
        public HomePurchaseSelling()
        {
            InitializeComponent();
            //WelcomeMessage.Text = "Welcome " + LoggedInUser.Instance.Info.Name + "!";
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

        private void ButtonAddCustomer_Click(object sender, RoutedEventArgs e)
        {
            this.topgrid.Visibility = Visibility.Collapsed;
            this.mainscrollviewer.Visibility = Visibility.Collapsed;

            CustomerAddNew x = new CustomerAddNew();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
        }

        private void ButtonAddSupplier_Click(object sender, RoutedEventArgs e)
        {
            this.topgrid.Visibility = Visibility.Collapsed;
            this.mainscrollviewer.Visibility = Visibility.Collapsed;

            SupplierAddNew x = new SupplierAddNew();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
        }

        private void ButtonUpdateCustomer_Click(object sender, RoutedEventArgs e)
        {
            this.topgrid.Visibility = Visibility.Collapsed;
            this.mainscrollviewer.Visibility = Visibility.Collapsed;

            CustomerEdit x = new CustomerEdit();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
        }

        private void ButtonUpdateSupplier_Click(object sender, RoutedEventArgs e)
        {
            this.topgrid.Visibility = Visibility.Collapsed;
            this.mainscrollviewer.Visibility = Visibility.Collapsed;

            SupplierEdit x = new SupplierEdit();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
        }

        private void ButtonAllCustomers_Click(object sender, RoutedEventArgs e)
        {
            this.topgrid.Visibility = Visibility.Collapsed;
            this.mainscrollviewer.Visibility = Visibility.Collapsed;

            CustomerList x = new CustomerList();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
        }

        private void ButtonAllSuppliers_Click(object sender, RoutedEventArgs e)
        {
            this.topgrid.Visibility = Visibility.Collapsed;
            this.mainscrollviewer.Visibility = Visibility.Collapsed;

            SupplierList x = new SupplierList();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
        }

        private void ButtonAllCOList_Click(object sender, RoutedEventArgs e)
        {
            this.topgrid.Visibility = Visibility.Collapsed;
            this.mainscrollviewer.Visibility = Visibility.Collapsed;

            CustomerOrderList x = new CustomerOrderList();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
        }

        private void ButtonAllPOList_Click(object sender, RoutedEventArgs e)
        {
            this.topgrid.Visibility = Visibility.Collapsed;
            this.mainscrollviewer.Visibility = Visibility.Collapsed;

            PurchaseOrderList x = new PurchaseOrderList();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
        }

        private void ButtonAddCO_Click(object sender, RoutedEventArgs e)
        {
            this.topgrid.Visibility = Visibility.Collapsed;
            this.mainscrollviewer.Visibility = Visibility.Collapsed;

            CustomerOrderAdd x = new CustomerOrderAdd();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
        }

        private void ButtonAddPO_Click(object sender, RoutedEventArgs e)
        {
            this.topgrid.Visibility = Visibility.Collapsed;
            this.mainscrollviewer.Visibility = Visibility.Collapsed;

            PurchaseOrderAdd x = new PurchaseOrderAdd();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
        }
    }
}
