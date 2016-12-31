using AlphaElectric_DataAccessLayer;
using MahApps.Metro.Controls;
using MaterialDesignThemes.Wpf;
using System;
using System.Collections.Generic;
using System.Diagnostics;
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

namespace AlphaElectric.Forms
{
    /// <summary>
    /// Interaction logic for CompanyList.xaml
    /// </summary>
    public partial class CompanyList : UserControl
    {
        public CompanyList()
        {
            InitializeComponent();
            LoadData();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {

        }

        void LoadData()
        {
            DataGrid.ItemsSource = new AlphaElectricEntitiesDB().Contacts.ToList();
        }

        private void PopUp_AddNewCompany(object sender, RoutedEventArgs e)
        {
            //Window win = new Window();
            //ProductAddNew eDoc = new ProductAddNew();
            //win.Content = eDoc;
            //win.Title = "Add Product";
            //win.Width = 350;
            //win.Height = 450;
            //win.WindowStartupLocation = WindowStartupLocation.CenterScreen;
            //win.Show();

            ProductAddNew userControl1 = new ProductAddNew();
            this.InitializeComponent();

            // UserControl win = new UserControl();
            ProductAddNew eDoc = new ProductAddNew();
            //win.Content = eDoc;
            //win.Title = "Add Product";
            //win.Width = 350;
            //win.Height = 450;
            //win.WindowStartupLocation = WindowStartupLocation.CenterScreen;
            //win.Show();

            //CompanyList complist = new CompanyList();
            //TextBlock_TitleName.Visibility = Visibility.Hidden;
            //DataGrid.Visibility = Visibility.Hidden;

            //UserPages.Children.Clear();
            //UserPages.Children.Add(eDoc);
        }
    }
}
    