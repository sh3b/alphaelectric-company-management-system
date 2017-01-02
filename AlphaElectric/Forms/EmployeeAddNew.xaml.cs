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
using System.Windows.Threading;
using ViewModels;

namespace AlphaElectric.Forms
{
    /// <summary>
    /// Interaction logic for AddProduct.xaml
    /// </summary>
    public partial class EmployeeAddNew : UserControl
    {
        EmployeeViewModel _vm;
        //Adding backgroud worker
        BackgroundWorker worker;

        public EmployeeAddNew()
        {
            InitializeComponent();

            _vm = new EmployeeViewModel();
            this.DataContext = _vm;
            _vm.JoinDate = DateTime.Now;
            //this.JoinDateDatePicker.SelectedDate = null;
            //JoinDateDatePicker.BlackoutDates.AddDatesInPast();
            //JoinDateDatePicker. = int.Parse(DateTime.Now.Date.Year.ToString());
        }

        //Executing after loading window, refer to XAML
        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            worker = new BackgroundWorker();
            worker.DoWork += Worker_DoWork;
            worker.RunWorkerAsync();
        }

        void Worker_DoWork(object sender, DoWorkEventArgs e)
        {
            List<Designation> emplist = new DesignationFactory().SelectAll();
            this.Dispatcher.Invoke(() =>
            {
                DesignationComboBox.ItemsSource = emplist;
                DesignationComboBox.DisplayMemberPath = "Name";
                DesignationComboBox.SelectedValuePath = "ID";
            });
        }

        private void ForceValidation()
        {
            this.FirstNameTextBox.GetBindingExpression(TextBox.TextProperty).UpdateSource();
            this.LastNameTextBox.GetBindingExpression(TextBox.TextProperty).UpdateSource();
            this.PhoneTextBox.GetBindingExpression(TextBox.TextProperty).UpdateSource();
            this.PassportTextBox.GetBindingExpression(TextBox.TextProperty).UpdateSource();
            this.JoinDateDatePicker.GetBindingExpression(DatePicker.SelectedDateProperty).UpdateSource();
            this.AddressTextBox.GetBindingExpression(TextBox.TextProperty).UpdateSource();
            //this.DesignationComboBox.GetBindingExpression(ComboBox.SelectedValueProperty).UpdateSource();
        }

        private void InsertButton_Click(object sender, RoutedEventArgs e)
        {
            #region validation 
            ForceValidation();
            if (Validation.GetHasError(FirstNameTextBox) ||
                Validation.GetHasError(LastNameTextBox) || 
                Validation.GetHasError(PhoneTextBox) || 
                Validation.GetHasError(PassportTextBox) ||
                Validation.GetHasError(JoinDateDatePicker) ||
                 Validation.GetHasError(AddressTextBox)) 
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

            Employee emp = new Employee();
            emp.FirstName = FirstNameTextBox.Text;
            emp.LastName = LastNameTextBox.Text;
            emp.Phone = PhoneTextBox.Text;
            emp.Passport = PassportTextBox.Text;
            emp.JoinDate = JoinDateDatePicker.SelectedDate.Value;
            emp.Address = AddressTextBox.Text;
            emp.DesignationID = int.Parse(DesignationComboBox.SelectedValue.ToString());

            EmployeeFactory fac = new EmployeeFactory();
            if (fac.InsertEmployee(emp))
            {
                MessageBox.Show("inserted");
                Clear();
            }

            else
                MessageBox.Show("not inserted");
        }

        private void ClearButton_Click(object sender, RoutedEventArgs e)
        {
            Clear();
        }

        private void Clear()
        {
            this.FirstNameTextBox.Clear();
            this.LastNameTextBox.Clear();
            this.PhoneTextBox.Clear();
            this.PassportTextBox.Clear();
            this.JoinDateDatePicker.SelectedDate = null;
            this.AddressTextBox.Clear();
            this.DesignationComboBox.SelectedItem = null;
        }
    }
}
