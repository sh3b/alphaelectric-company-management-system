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


namespace AlphaElectric.Forms
{
    /// <summary>
    /// Interaction logic for Home.xaml
    /// </summary>
    public partial class TWOHome : MetroWindow
    {
        public TWOHome()
        {
            InitializeComponent();
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

        private void ButtonBase_OnClick(object sender, RoutedEventArgs e)
        {

        }

        private void ProductsButton_OnClick(object sender, RoutedEventArgs e)
        {

        }

        private void Employees_OnClick(object sender, RoutedEventArgs e)
        {

        }

        private void ChatButton_Click(object sender, RoutedEventArgs e)
        {

        }

        private void PurchaseSellingButton_OnClick(object sender, RoutedEventArgs e)
        {

        }

        private void ProjectsButton_OnClick(object sender, RoutedEventArgs e)
        {

        }

        #region diaglogandsocialbuttons

        // About message dialog
        private async void MenuPopupAboutButton_OnClick(object sender, RoutedEventArgs e)
        {
            var sMessageDialog = new MessageDialog
            {
                //Message = { Text = ((ButtonBase)sender).Content.ToString() }
                Message = { Text = 
                    "Developed by:\n" +
                    "\n1. Muhammad Shoaib" +
                    "\n  3022/FBAS/BSCS/F14B" +
                    "\n2. Muhammad Amir" +
                    "\n  ____/FBAS/BSCS/F14B" }
            };

            await DialogHost.Show(sMessageDialog, "RootDialog");
        }

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
        #endregion
    }
}
