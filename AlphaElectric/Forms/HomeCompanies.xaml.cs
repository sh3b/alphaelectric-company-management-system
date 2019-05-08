using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Diagnostics;
//using DevExpress.Xpf.Printing;

namespace AlphaElectric.Forms
{
    /// <summary>
    /// Interaction logic for Home.xaml
    /// </summary>
    public partial class HomeCompanies : UserControl
    {
        public HomeCompanies()
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

        private void ButtonViewCompanies_Click(object sender, RoutedEventArgs e)
        {
            this.topgrid.Visibility = Visibility.Collapsed;
            this.mainscrollviewer.Visibility = Visibility.Collapsed;

            CompanyList x = new CompanyList();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
        }

        private void ButtonUpdateCompanies_Click(object sender, RoutedEventArgs e)
        {
            this.topgrid.Visibility = Visibility.Collapsed;
            this.mainscrollviewer.Visibility = Visibility.Collapsed;

            CompanyEdit x = new CompanyEdit();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
        }

        private void ButtonAddNewCompany_Click(object sender, RoutedEventArgs e)
        {
            this.topgrid.Visibility = Visibility.Collapsed;
            this.mainscrollviewer.Visibility = Visibility.Collapsed;

            CompanyAddNew x = new CompanyAddNew();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
        }

        //private void ButtonPrintCompanies_Click(object sender, RoutedEventArgs e)
        //{
        //    var report = new AlphaElectric.Reports.CompaniesListReport();
        //    PrintHelper.ShowPrintPreview(this, report);
        //}
    }
}
