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
    public partial class CustomerOrderAdd : UserControl
    {
        CustomerOrderViewModel _vm;
        //Adding backgroud worker
        BackgroundWorker worker;
        CustomerOrder co = new CustomerOrder();
        List<ProductItem> productItemsList = new List<ProductItem>();

        public CustomerOrderAdd()
        {
            InitializeComponent();
            _vm = new CustomerOrderViewModel();
            this.DataContext = _vm;
            
            _vm.DeliveryDate = DateTime.Now.AddDays(1);
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
            List<Product> prodlist = new ProductFactory().SelectAll();

            this.Dispatcher.Invoke(() =>
            {
                CustomerComboBox.ItemsSource = contactlist;
                CustomerComboBox.DisplayMemberPath = "CompanyName";
                CustomerComboBox.SelectedValuePath = "ID";

                ProductComboBox.ItemsSource = prodlist;
                ProductComboBox.DisplayMemberPath = "SerialNo";
                ProductComboBox.SelectedValuePath = "ID";
            });
        }

        private void ForceValidation()
        {
            this.OrderDateDatePicker.GetBindingExpression(DatePicker.SelectedDateProperty).UpdateSource();
            this.DeliveryDateDatePicker.GetBindingExpression(DatePicker.SelectedDateProperty).UpdateSource();
        }

        private void CreateButton_Click(object sender, RoutedEventArgs e)
        {
            #region validation 
            ForceValidation();
            if (Validation.GetHasError(OrderDateDatePicker) || Validation.GetHasError(DeliveryDateDatePicker))
            {
                var sMessageDialog = new MessageDialog
                {
                    Message = { Text =
                    "ERROR: Fill required fields!" }
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

            if (productItemsList.Count() == 0)
            {
                var sMessageDialog = new MessageDialog
                {
                    Message = { Text =
                    "There are no items in the purchase order,\nadd items!" }
                };

                DialogHost.Show(sMessageDialog, "RootDialog");
                return;
            }
            #endregion

            bool flag = false;

            // Creating PO 
            co.OrderDate = OrderDateDatePicker.SelectedDate.Value;
            co.DeliveryDate = DeliveryDateDatePicker.SelectedDate.Value;
            co.ContactID = int.Parse(CustomerComboBox.SelectedValue.ToString());
            CustomerOrderFactory fac = new CustomerOrderFactory();
            fac.InsertCustomerOrder(co);

            // Adding Products to PO
            using (var db = new AlphaElectricEntitiesDB())
            {
                // Multiple Products
                foreach (var item in productItemsList)
                {
                    Product_CustomerOrderBT co_prod = new Product_CustomerOrderBT();
                    co_prod.ProductID = item.ProductID;
                    co_prod.CustomerOrderID = co.ID;

                    // LINQ query
                    var query = from prod in db.Product_CustomerOrderBT
                                where prod.CustomerOrderID == co.ID
                                && prod.ProductID == co_prod.ProductID
                                select prod;

                    if (query.ToList().Count == 0)
                    {
                        co_prod.Quantity = item.Quantity;
                        db.Product_CustomerOrderBT.Add(co_prod);
                        db.SaveChanges();
                        flag = true;
                    }
                    // Checks if existing ProductID and PurchaseOrderID exists
                    // Used if item is added again
                    else if (query.ToList().Count == 1)
                    {
                        foreach (var xx in query)
                        {
                            xx.Quantity += item.Quantity;
                        }
                        db.SaveChanges();
                        flag = true;
                    }
                }
                productItemsList.Clear();
                ClearItems();
                Clear();

                if (flag)
                {
                    var sMessageDialog = new MessageDialog
                    {
                        Message = { Text = "Customer Order added!" }
                    };
                    DialogHost.Show(sMessageDialog, "RootDialog");
                    return;
                }
            }
        }

        private void InsertItem_Click(object sender, RoutedEventArgs e)
        {
            int a;
            if (string.IsNullOrEmpty(QuantityTextBox.Text) || !(int.TryParse(QuantityTextBox.Text, out a)))
            {
                var sMessageDialog = new MessageDialog
                {
                    Message = { Text =
                    "ERROR: Enter valid Quantity!" }
                };

                DialogHost.Show(sMessageDialog, "RootDialog");
                return;
            }

            if (ProductComboBox.SelectedValue == null || int.Parse(QuantityTextBox.Text) <= 0)
            {
                var sMessageDialog = new MessageDialog
                {
                    Message = { Text =
                    "ERROR: Select Product and Add Quantity\n(positive number)!" }
                };

                DialogHost.Show(sMessageDialog, "RootDialog");
                return;
            }

            ProductItem item = new ProductItem();
            item.ProductID = int.Parse(ProductComboBox.SelectedValue.ToString());
            item.Quantity = int.Parse(QuantityTextBox.Text);
            productItemsList.Add(item);
            ClearItems();

            if (true)
            {
                var sMessageDialog = new MessageDialog
                {
                    Message = { Text =
                    "Item added!" }
                };
                DialogHost.Show(sMessageDialog, "RootDialog");
                return;
            }
        }

        private void ClearButton_Click(object sender, RoutedEventArgs e)
        {
            Clear();
            ClearItems();
            productItemsList.Clear();
        }

        private void Clear()
        {
            this.CustomerComboBox.SelectedItem = null;
            this.OrderDateDatePicker.SelectedDate = null;
            this.DeliveryDateDatePicker.SelectedDate = null;
        }

        private void ClearItems()
        {
            ProductComboBox.SelectedItem = null;
            this.QuantityTextBox.Clear();
        }
    }
}
