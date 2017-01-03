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
using MaterialDesignThemes.Wpf;

// Add DA
using AlphaElectric_DataAccessLayer;
using AlphaElectric.Logic;

// Add BCrypt
using BCrypt.Net;

namespace AlphaElectric.Forms
{
    /// <summary>
    /// Interaction logic for Login.xaml
    /// </summary>
    public partial class Login : MetroWindow
    {
        ViewModels.LoginViewModel _vm;

        public Login()
        {
            InitializeComponent();

            _vm = new ViewModels.LoginViewModel();
            this.DataContext = _vm;

            NameTextBox.Focus();
        }

        //private void ForceValidation()
        //{
        //    this.NameTextBox.GetBindingExpression(TextBox.TextProperty).UpdateSource();
        //    this.PasswordBox.GetBindingExpression(TextBlock.TextProperty).UpdateSource();
        //}

        private void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            #region validation 
            if ((String.IsNullOrEmpty(NameTextBox.Text)) || (String.IsNullOrEmpty(PasswordBox.Password)))
            {
                var sMessageDialog = new MessageDialog
                {
                    Message = { Text =
                    "ERROR: Fill missing fields!" }
                };

                DialogHost.Show(sMessageDialog, "RootDialog");
                return;
            }
            #endregion

            using (var db = new AlphaElectricEntitiesDB())
            {
                var obj = db.Logins.Where(m => m.Username == NameTextBox.Text).FirstOrDefault();
                if (obj == null)
                {
                    var sMessageDialog = new MessageDialog
                    {
                        Message = { Text = "Incorrect Username!" }
                    };

                    DialogHost.Show(sMessageDialog, "RootDialog");
                    Clear();
                    NameTextBox.Focus();
                    return;
                }
                else if (!Hashing.ValidatePassword(PasswordBox.Password, obj.Password))
                {
                    var sMessageDialog = new MessageDialog
                    {
                        Message = { Text = "Incorrect Password!" }
                    };

                    DialogHost.Show(sMessageDialog, "RootDialog");
                    Clear();
                    NameTextBox.Focus();
                    return;
                }

                // Adding New User
                //AlphaElectric_DataAccessLayer.Login newUser = new AlphaElectric_DataAccessLayer.Login();
                //newUser.Username = "shoaib";
                //newUser.name = "Shoaib Ashraf";
                //newUser.Password = Hashing.HashPassword("12345");
                //db.Logins.Add(newUser);
                //db.SaveChanges();

                this.Hide();
                LoggedInUser.Instance.Info = db.Logins.Where(u => u.ID == obj.ID).FirstOrDefault();
                MainwWindow x = new MainwWindow();
                x.Show();
                this.Close();
            }
        }

        private void PasswordBox_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
                LoginButton_Click(null, null);
        }

        private void Clear()
        {
            this.NameTextBox.Clear();
            this.PasswordBox.Clear();
        }

        private void ExitButton_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

    }
}
