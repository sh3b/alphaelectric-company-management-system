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
    public partial class EmployeeEdit : UserControl
    {
        EmployeeViewModel _vm;
        //Adding backgroud worker
        BackgroundWorker worker;
        List<Employee> emplist;

        public EmployeeEdit()
        {
            InitializeComponent();

            _vm = new EmployeeViewModel();
            this.DataContext = _vm;
        }

        void UpdateFields()
        {
            if (SelectEmployeeComboBox.SelectedValue != null)
            {
                var db = new AlphaElectricEntitiesDB();
                var id = int.Parse(SelectEmployeeComboBox.SelectedValue.ToString());
                var emp = db.Employees.Where(x => x.ID == id).FirstOrDefault();
                if (emp != null)
                {
                    FirstNameTextBox.Text = emp.FirstName;
                    LastNameTextBox.Text = emp.LastName;
                    PhoneTextBox.Text = emp.Phone;
                    PassportTextBox.Text = emp.Passport;
                    JoinDateDatePicker.SelectedDate = emp.JoinDate;
                    AddressTextBox.Text = emp.Address;
                    DesignationComboBox.SelectedValue = emp.DesignationID;
                }
            }
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
            List<Designation> desiglist = new DesignationFactory().SelectAll();
            emplist = new EmployeeFactory().SelectAll();
            this.Dispatcher.Invoke(() =>
            {
                DesignationComboBox.ItemsSource = desiglist;
                DesignationComboBox.DisplayMemberPath = "Name";
                DesignationComboBox.SelectedValuePath = "ID";

                SelectEmployeeComboBox.ItemsSource = emplist;
                SelectEmployeeComboBox.DisplayMemberPath = "FirstName";
                SelectEmployeeComboBox.SelectedValuePath = "ID";
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
            this.DesignationComboBox.GetBindingExpression(ComboBox.SelectedValueProperty).UpdateSource();
            this.SelectEmployeeComboBox.GetBindingExpression(ComboBox.SelectedValueProperty).UpdateSource();
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
                Validation.GetHasError(AddressTextBox) ||
                Validation.GetHasError(DesignationComboBox) ||
                Validation.GetHasError(SelectEmployeeComboBox)
                )
            {
                var sMessageDialog = new MessageDialog
                {
                    Message = { Text =
                    "ERROR: Fill missing fields!" }
                };

                DialogHost.Show(sMessageDialog, "RootDialog");
                return;
            }

            if (SelectEmployeeComboBox.SelectedItem == null)
            {
                var sMessageDialog = new MessageDialog
                {
                    Message = { Text =
                    "ERROR: Select a Employee!" }
                };

                DialogHost.Show(sMessageDialog, "RootDialog");
                return;
            }

            if (DesignationComboBox.SelectedItem == null)
            {
                var sMessageDialog = new MessageDialog
                {
                    Message = { Text =
                    "ERROR: Select a Designation!" }
                };

                DialogHost.Show(sMessageDialog, "RootDialog");
                return;
            }

            #endregion

            EmployeeFactory fac = new EmployeeFactory();
            if (fac.Update(int.Parse(SelectEmployeeComboBox.SelectedValue.ToString()),
                FirstNameTextBox.Text,
                LastNameTextBox.Text,
                PhoneTextBox.Text,
                PassportTextBox.Text,
                JoinDateDatePicker.SelectedDate.Value,
                AddressTextBox.Text,
                int.Parse(DesignationComboBox.SelectedValue.ToString())))
            {
                MessageBox.Show("Updated");
                Clear();
            }
            else
                MessageBox.Show("Not Updated");
        }

        private void ClearButton_Click(object sender, RoutedEventArgs e)
        {
            Clear();
        }

        private void Clear()
        {
            this.SelectEmployeeComboBox.SelectedItem = null;
            this.FirstNameTextBox.Clear();
            this.LastNameTextBox.Clear();
            this.PhoneTextBox.Clear();
            this.PassportTextBox.Clear();
            this.JoinDateDatePicker.SelectedDate = null;
            this.AddressTextBox.Clear();
            this.DesignationComboBox.SelectedItem = null;
        }

        private void SelectEmployeeComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateFields();
        }
    }
}