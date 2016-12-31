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
using System.Diagnostics;
using MaterialDesignThemes.Wpf;
using MahApps.Metro.Controls;

// Added DA & Factories
using AlphaElectric_DataAccessLayer;
using AlphaElectric_DataAccessLayer.Factories;


namespace AlphaElectric.Forms
{
    /// <summary>
    /// Interaction logic for CompanyAddNew.xaml
    /// </summary>
    public partial class CompanyAddNew : MetroWindow
    {
        public CompanyAddNew()
        {
            InitializeComponent();
        }

        private void InsertButton_Click(object sender, RoutedEventArgs e)
        {
            Contact comp = new Contact();

            comp.CompanyName = NameTextBox.Text;
            comp.Phone = PhoneNoTextBox.Text;
            comp.Email = EmailTextBox.Text;
            comp.Address = AddressTextBox.Text;

            ContactFactory fac = new ContactFactory();
            if (fac.InsertContact(comp))
                MessageBox.Show("inserted");
            else
                MessageBox.Show("not inserted");
        }

        private void ExitButton_Click(object sender, RoutedEventArgs e)
        {

        }

        #region diaglog-socialbuttons-informationlinks

        // About message dialog
        private async void MenuPopupAboutButton_OnClick(object sender, RoutedEventArgs e)
        {
            var sMessageDialog = new MessageDialog
            {
                //Message = { Text = ((ButtonBase)sender).Content.ToString() }
                Message = { Text =
                    "Developed by\n" +
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

        // Information Links
        private void TextBlock_WebOrdersMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            Process.Start("http://alphaelectric.shuayb.me/");
        }

        private async void TextBlock_FaxOrdersMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            var sMessageDialog = new MessageDialog
            {
                Message = { Text = "Fax Orders Server is currently\n offline." }
            };

            await DialogHost.Show(sMessageDialog, "RootDialog");
        }

        private async void TextBlock_PhoneNumbersMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            var sMessageDialog = new MessageDialog
            {
                Message = { Text =
                    "Important Phone Numbers\n" +
                    "\n1. Police: 15" +
                    "\n2. IIUI:   +92 51 901 9100" }
            };

            await DialogHost.Show(sMessageDialog, "RootDialog");
        }
        #endregion
    }
}
