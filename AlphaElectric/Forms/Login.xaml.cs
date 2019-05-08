using System;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
// To access MetroWindow
using MahApps.Metro.Controls;
using MaterialDesignThemes.Wpf;

// Add DA
using AlphaElectric_DataAccessLayer;
using AlphaElectric.Logic;

// Add BCrypt

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

            NameTextBox.Text = "shuayb";
            PasswordBox.Password = "12345";

            NameTextBox.Focus();

            //using (var db = new AlphaElectricEntitiesDB())
            //{
            //    //Adding New User
            //    AlphaElectric_DataAccessLayer.Login newUser = new AlphaElectric_DataAccessLayer.Login()
            //    {
            //        Username = "shuayb",
            //        Name = "Shuayb Ashraf",
            //        Password = Hashing.HashPassword("12345")
            //    };
            //    db.Logins.Add(newUser);
            //    db.SaveChanges();
            //}
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
                    "ERROR: Fill required fields!" }
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
