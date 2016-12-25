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

namespace AlphaElectric.Forms
{
    /// <summary>
    /// Interaction logic for Login.xaml
    /// </summary>
    public partial class Login : MetroWindow
    {
        public Login()
        {
            InitializeComponent();
            NameTextBox.Focus();
        }

        private void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("Hello"); 
            //F13BSSEBEntities db = new F13BSSEBEntities();
            //var obj = db.Logins.Where(x => x.Username == txtUsername.Text).FirstOrDefault();
            //if (obj == null)
            //    lblError.Content = "Incorrect Username!";
            //else if (obj.Password != txtPassword.Password)
            //    lblError.Content = "Incorrect Password!";
            //else
            //{
            //    this.Hide();
            //    LoggedInUser.Instance.Info = db.Students.Where(x => x.Id == obj.UserId).FirstOrDefault();
            //    Home home = new Home();
            //    home.Show();
            //    this.Close();
            //}
        }

        private void ExitButton_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void PasswordBox_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
                LoginButton_Click(null, null);
        }
    }
}
