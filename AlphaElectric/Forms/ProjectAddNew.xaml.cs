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
    public partial class ProjectAddNew : UserControl
    {
        ProjectViewModel _vm;
        //Adding backgroud worker
        BackgroundWorker worker;
        CustomerOrder co = new CustomerOrder();

        public ProjectAddNew()
        {
            InitializeComponent();

            _vm = new ProjectViewModel();
            this.DataContext = _vm;
            _vm.DeliveryDate = DateTime.Now.AddDays(2);
            _vm.OrderDate = DateTime.Now;
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
            List<Contact> contactlist = new ContactFactory().SelectAll();

            this.Dispatcher.Invoke(() =>
            {
                CustomerComboBox.ItemsSource = contactlist;
                CustomerComboBox.DisplayMemberPath = "CompanyName";
                CustomerComboBox.SelectedValuePath = "ID";
            });
        }

        private void ForceValidation()
        {
            this.NameTextBox.GetBindingExpression(TextBox.TextProperty).UpdateSource();
            this.DeliveryDateDatePicker.GetBindingExpression(DatePicker.SelectedDateProperty).UpdateSource();
            this.StatusTextBox.GetBindingExpression(TextBox.TextProperty).UpdateSource();
            this.OrderDateDatePicker.GetBindingExpression(DatePicker.SelectedDateProperty).UpdateSource();
        }

        private void InsertButton_Click(object sender, RoutedEventArgs e)
        {
            #region validation 
            ForceValidation();
            if (Validation.GetHasError(NameTextBox) ||
                Validation.GetHasError(StatusTextBox) ||
                Validation.GetHasError(DeliveryDateDatePicker) ||
                Validation.GetHasError(OrderDateDatePicker))
            {
                var sMessageDialog = new MessageDialog
                {
                    Message = { Text =
                    "ERROR: Fill missing fields!" }
                };

                DialogHost.Show(sMessageDialog, "RootDialog");
                return;
            }

            if (CustomerComboBox.SelectedValue == null)
            {
                var sMessageDialog = new MessageDialog
                {
                    Message = { Text =
                    "ERROR: Select all fields!" }
                };

                DialogHost.Show(sMessageDialog, "RootDialog");
                return;
            }
            #endregion

            Project proj = new Project();

            proj.Name = NameTextBox.Text;
            proj.DeliveyDate = DeliveryDateDatePicker.SelectedDate.Value;

            if (this.StatusTextBox.Text == "Ready")
                proj.Status = true;
            else
                proj.Status = false;

            // Adding a new Order   
            co.OrderDate = OrderDateDatePicker.SelectedDate.Value;
            co.DeliveryDate = DeliveryDateDatePicker.SelectedDate.Value;
            co.ContactID = int.Parse(CustomerComboBox.SelectedValue.ToString());
            CustomerOrderFactory fac = new CustomerOrderFactory();
            fac.InsertCustomerOrder(co);

            //setting Proj CustID.
            proj.CustomerOrderID = co.ID;

            ProjectFactory pfac = new ProjectFactory();
            if (pfac.InsertProject(proj))
            {
                var sMessageDialog = new MessageDialog
                {
                    Message = { Text = "Project Inserted! " }
                };

                DialogHost.Show(sMessageDialog, "RootDialog");
                Clear();
                return;
            }
            else
            {
                var sMessageDialog = new MessageDialog
                {
                    Message = { Text = "Welll, it didn't work out. " }
                };

                DialogHost.Show(sMessageDialog, "RootDialog");
                Clear();
                return;
            }
        }

        private void ClearButton_Click(object sender, RoutedEventArgs e)
        {
            Clear();
        }

        private void Clear()
        {
            this.NameTextBox.Clear();
            this.StatusTextBox.Clear();
            this.DeliveryDateDatePicker.SelectedDate = DateTime.Now;
            this.OrderDateDatePicker.SelectedDate = DateTime.Now;
            this.CustomerComboBox.SelectedItem = null;
        }
    }
}
