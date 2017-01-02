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
    public partial class PurchaseOrderAdd : UserControl
    {
        PurchaseOrderViewModel _vm;
        //Adding backgroud worker
        BackgroundWorker worker;

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

        private void InsertButton_Click(object sender, RoutedEventArgs e)
        {
            //#region validation 
            //ForceValidation();
            //if (Validation.GetHasError(NameTextBox) || Validation.GetHasError(AddressTextBox) || Validation.GetHasError(EmailTextBox) || Validation.GetHasError(PhoneNoTextBox))
            //{
            //    var sMessageDialog = new MessageDialog
            //    {
            //        Message = { Text =
            //        "ERROR: Fill missing fields!" }
            //    };
            //
            //    DialogHost.Show(sMessageDialog, "RootDialog");
            //    return;
            //}
            //#endregion

            bool flag = false;

            // Creating PO 
            PurchaseOrder po = new PurchaseOrder();
            //po.PODate = PODateDatePicker.SelectedDate.Value;
            //po.ContactID = int.Parse(SupplierComboBox.SelectedValue.ToString());

            //PurchaseOrderFactory fac = new PurchaseOrderFactory();
            //flag = fac.InsertPurchaseOrder(po);
            //List<PurchaseOrder> polist = new PurchaseOrderFactory().SelectAll();

            // Adding Products to PO
            Product_PurchaseOrderBT po_prod = new Product_PurchaseOrderBT();
            //po_prod.ProductID = int.Parse(ProductComboBox.SelectedValue.ToString());
            po_prod.ProductID = 1010;
            //po_prod.PurchaseOrderID = po.ID;
            po_prod.PurchaseOrderID = 6;
            po.ID = 6;
            po_prod.Quantity = int.Parse(QuantityTextBox.Text);

            AlphaElectricEntitiesDB db = new AlphaElectricEntitiesDB();


            // LINQ query
            var query = from prod in db.Product_PurchaseOrderBT     
                        where prod.PurchaseOrderID == po.ID
                        && prod.ProductID == po_prod.ProductID
                        select prod;

            if (query.ToList().Count == 0)
            {
                db.Product_PurchaseOrderBT.Add(po_prod);
                db.SaveChanges();
            }
            else if (query.ToList().Count == 1)
            {
                foreach (var xx in query)
                {
                    xx.Quantity += int.Parse(QuantityTextBox.Text);
                }
                db.SaveChanges();
            }
        }

        //ContactFactory fac = new ContactFactory();
        //if (fac.InsertContact(comp))
        //{
        //    MessageBox.Show("inserted");
        //    Clear();
        //}

        //else
        //    MessageBox.Show("not inserted");

        private void ClearButton_Click(object sender, RoutedEventArgs e)
        {
            Clear();
        }

        private void Clear()
        {
            //this.NameTextBox.Clear();
            //this.AddressTextBox.Clear();
            //this.EmailTextBox.Clear();
            //this.PhoneNoTextBox.Clear();
        }
    }
}
