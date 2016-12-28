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


// Added DA & Factories
using AlphaElectric_DataAccessLayer;
using AlphaElectric_DataAccessLayer.Factories;
using System.Diagnostics;

namespace AlphaElectric.Forms
{
    /// <summary>
    /// Interaction logic for Home.xaml
    /// </summary>
    public partial class Home : MetroWindow
    {
        public Home()
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

        private void GitHubButton_OnClick(object sender, RoutedEventArgs e)
        {
            Process.Start("https://github.com/ButchersBoy/MaterialDesignInXamlToolkit");
        }

        private void TwitterButton_OnClick(object sender, RoutedEventArgs e)
        {
            Process.Start("https://twitter.com/James_Willock");
        }

        private void ChatButton_OnClick(object sender, RoutedEventArgs e)
        {
            Process.Start("https://gitter.im/ButchersBoy/MaterialDesignInXamlToolkit");
        }

        private void EmailButton_OnClick(object sender, RoutedEventArgs e)
        {
            Process.Start("mailto://james@dragablz.net");
        }

        private void DonateButton_OnClick(object sender, RoutedEventArgs e)
        {
            Process.Start("https://pledgie.com/campaigns/31029");
        }


        private void TextBox_MouseDown(object sender, MouseButtonEventArgs e)
        {
            this.Hide();
            var obj = new AddProduct();
            obj.Show();
            this.Close();
        }
    }
}
