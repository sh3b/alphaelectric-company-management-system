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
    class ProductItem
    {
        public int Quantity { get; set; }
        public int ProductID { get; set; }

        public ProductItem()
        {
            this.Quantity = 0;
            this.ProductID = 0;
        }
    }

    /// <summary>
    /// Interaction logic for AddProduct.xaml
    /// </summary>
    public partial class PurchaseOrderAdd : UserControl
    {
        PurchaseOrderViewModel _vm;
        //Adding backgroud worker
        BackgroundWorker worker;
        PurchaseOrder po = new PurchaseOrder();
        List<ProductItem> productItemsList = new List<ProductItem>();

        public PurchaseOrderAdd()
        {
            InitializeComponent();
            _vm = new PurchaseOrderViewModel();
            this.DataContext = _vm;
            _vm.PODate = DateTime.Now;
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
                SupplierComboBox.ItemsSource = contactlist;
                SupplierComboBox.DisplayMemberPath = "CompanyName";
                SupplierComboBox.SelectedValuePath = "ID";

                ProductComboBox.ItemsSource = prodlist;
                ProductComboBox.DisplayMemberPath = "SerialNo";
                ProductComboBox.SelectedValuePath = "ID";
            });
        }

        private void ForceValidation()
        {
            this.PODateDatePicker.GetBindingExpression(DatePicker.SelectedDateProperty).UpdateSource();
        }

        private void CreateButton_Click(object sender, RoutedEventArgs e)
        {
            #region validation 
            ForceValidation();
            if (Validation.GetHasError(PODateDatePicker))
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

            bool flag = false;

            // Creating PO 
            po.PODate = PODateDatePicker.SelectedDate.Value;
            po.ContactID = int.Parse(SupplierComboBox.SelectedValue.ToString());
            PurchaseOrderFactory fac = new PurchaseOrderFactory();
            flag = fac.InsertPurchaseOrder(po);

            // Adding Products to PO

            using (var db = new AlphaElectricEntitiesDB())
            {
                // Multiple Products
                foreach (var item in productItemsList)
                {
                    Product_PurchaseOrderBT po_prod = new Product_PurchaseOrderBT();
                    po_prod.ProductID = item.ProductID;
                    po_prod.PurchaseOrderID = po.ID;

                    // LINQ query
                    var query = from prod in db.Product_PurchaseOrderBT
                                where prod.PurchaseOrderID == po.ID
                                && prod.ProductID == po_prod.ProductID
                                select prod;

                    if (query.ToList().Count == 0)
                    {
                        po_prod.Quantity = item.Quantity;
                        db.Product_PurchaseOrderBT.Add(po_prod);
                        db.SaveChanges();
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
                    }
                }
                productItemsList.Clear();
                ClearItems();
                Clear();
            }
        }

        private void InsertItem_Click(object sender, RoutedEventArgs e)
        {
            ProductItem item = new ProductItem();
            item.ProductID = int.Parse(ProductComboBox.SelectedValue.ToString());
            item.Quantity = int.Parse(QuantityTextBox.Text);
            productItemsList.Add(item);
            ClearItems();
        }

        private void ClearButton_Click(object sender, RoutedEventArgs e)
        {
            Clear();
            ClearItems();
            productItemsList.Clear();
        }

        private void Clear()
        {
            SupplierComboBox.SelectedItem = null;
            this.PODateDatePicker.SelectedDate = null;
        }

        private void ClearItems()
        {
            ProductComboBox.SelectedItem = null;
            this.QuantityTextBox.Clear();
        }
    }
}
