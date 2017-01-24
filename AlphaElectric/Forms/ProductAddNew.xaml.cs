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
    public partial class ProductAddNew : UserControl
    {
        ProductViewModel _vm;
        //Adding backgroud worker
        BackgroundWorker worker;

        public ProductAddNew()
        {
            InitializeComponent();

            _vm = new ProductViewModel();
            this.DataContext = _vm;
            ClearButton_Click(null, null);

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
            List<Make> mklist = new MakeFactory().SelectAll();
            List<AlphaElectric_DataAccessLayer.Type> paneltypelist = new TypeFactory().SelectAll();
            List<SizeType> szlist = new SizeTypeFactory().SelectAll();
            List<PanelShellGradeProtection> shellgradelist = new PanelShellGradeProtectionFactory().SelectAll();
            List<Certification> certlist = new CertificationFactory().SelectAll();
            List<PaType> parttypelist = new PaTypeFactory().SelectAll();

            this.Dispatcher.Invoke(() =>
            {
                // Generic
                MakeComboBox.ItemsSource = mklist;
                MakeComboBox.DisplayMemberPath = "Name";
                MakeComboBox.SelectedValuePath = "ID";

                //Panel Type
                PanelTypeComboBox.ItemsSource = paneltypelist;
                PanelTypeComboBox.DisplayMemberPath = "Description";
                PanelTypeComboBox.SelectedValuePath = "ID";

                SizeComboBox.ItemsSource = szlist;
                SizeComboBox.DisplayMemberPath = "Description";
                SizeComboBox.SelectedValuePath = "ID";

                PanelIPNumberComboBox.ItemsSource = shellgradelist;
                PanelIPNumberComboBox.DisplayMemberPath = "IPNum";
                PanelIPNumberComboBox.SelectedValuePath = "ID";

                CertComboBox.ItemsSource = certlist;
                CertComboBox.DisplayMemberPath = "Name";
                CertComboBox.SelectedValuePath = "ID";

                //Part Type
                PartTypeComboBox.ItemsSource = parttypelist;
                PartTypeComboBox.DisplayMemberPath = "Name";
                PartTypeComboBox.SelectedValuePath = "ID";
            });
        }

        private void P_Panel_Checked(object sender, RoutedEventArgs e)
        {
            //Panel
            TxtBxStackPanel4.Visibility = Visibility.Collapsed;

            //Part
            TxtBxStackPanel0.Visibility = Visibility.Visible;
            TxtBxStackPanel1.Visibility = Visibility.Visible;
            TxtBxStackPanel2.Visibility = Visibility.Visible;
            TxtBxStackPanel3.Visibility = Visibility.Visible;
        }

        private void P_Product_Checked(object sender, RoutedEventArgs e)
        {
            //Panel
            TxtBxStackPanel4.Visibility = Visibility.Visible;

            //Part
            TxtBxStackPanel0.Visibility = Visibility.Collapsed;
            TxtBxStackPanel1.Visibility = Visibility.Collapsed;
            TxtBxStackPanel2.Visibility = Visibility.Collapsed;
            TxtBxStackPanel3.Visibility = Visibility.Collapsed;
        }

        private void ForceValidation()
        {
            NameTextBox.GetBindingExpression(TextBox.TextProperty).UpdateSource();
            SerialNoTextBox.GetBindingExpression(TextBox.TextProperty).UpdateSource();
        }

        private void InsertButton_Click(object sender, RoutedEventArgs e)
        {
            #region validation 
            ForceValidation();
            if (Validation.GetHasError(NameTextBox) || Validation.GetHasError(SerialNoTextBox))
            {
                var sMessageDialog = new MessageDialog
                {
                    Message = { Text =
                    "ERROR: Fill required fields!" }
                };

                DialogHost.Show(sMessageDialog, "RootDialog");
                return;
            }

            if (!(bool)P_Panel.IsChecked && !(bool)P_Part.IsChecked)
            {
                var sMessageDialog = new MessageDialog
                {
                    Message = { Text =
                    "ERROR: Select either part or panel!" }
                };

                DialogHost.Show(sMessageDialog, "RootDialog");
                return;
            }


            if ((bool)P_Panel.IsChecked)
            {
                if (MakeComboBox.SelectedValue == null ||
                    PanelTypeComboBox.SelectedValue == null ||
                    SizeComboBox.SelectedValue == null ||
                    PanelIPNumberComboBox.SelectedValue == null ||
                    CertComboBox.SelectedValue == null
                    )
                {
                    var sMessageDialog = new MessageDialog
                    {
                        Message = { Text =
                    "ERROR: Select all fields!" }
                    };

                    DialogHost.Show(sMessageDialog, "RootDialog");
                    return;
                }
            }

            if ((bool)P_Part.IsChecked)
            {
                if (MakeComboBox.SelectedValue == null ||
                    PartTypeComboBox.SelectedValue == null
                    )
                {
                    var sMessageDialog = new MessageDialog
                    {
                        Message = { Text =
                    "ERROR: Select all fields!" }
                    };

                    DialogHost.Show(sMessageDialog, "RootDialog");
                    return;
                }
            }

            #endregion

            if ((bool)P_Panel.IsChecked)
            {
                AlphaElectric_DataAccessLayer.Panel panel = new AlphaElectric_DataAccessLayer.Panel();
                panel.Name = NameTextBox.Text;
                panel.SerialNo = SerialNoTextBox.Text;
                panel.MakeID = int.Parse(MakeComboBox.SelectedValue.ToString());
                panel.Name = NameTextBox.Text;

                panel.TypeID = int.Parse(PanelTypeComboBox.SelectedValue.ToString());
                panel.SizeTypeID = int.Parse(SizeComboBox.SelectedValue.ToString());
                panel.PanelShellGradeProtectionIPNumber = int.Parse(PanelIPNumberComboBox.SelectedValue.ToString());
                panel.CertificationID = int.Parse(CertComboBox.SelectedValue.ToString());

                Product incomingNewProduct = new AlphaElectric_DataAccessLayer.Panel();
                incomingNewProduct = panel;
                AddProd(incomingNewProduct);
            }

            if ((bool)P_Part.IsChecked)
            {
                AlphaElectric_DataAccessLayer.Part part = new AlphaElectric_DataAccessLayer.Part();
                part.Name = NameTextBox.Text;
                part.SerialNo = SerialNoTextBox.Text;
                part.MakeID = int.Parse(MakeComboBox.SelectedValue.ToString());
                part.Name = NameTextBox.Text;

                part.PaTypeID = int.Parse(PartTypeComboBox.SelectedValue.ToString());

                Product incomingNewProduct = new Part();
                incomingNewProduct = part;
                AddProd(incomingNewProduct);
            }
        }

        private void AddProd(Product incomingNewProduct)
        {
            ProductFactory fac = new ProductFactory();
            if (fac.InsertProduct(incomingNewProduct))
            {
                // Adding Stock Level to Zero
                var newProduct = new Inventory();
                newProduct.ID = incomingNewProduct.ID;
                newProduct.StockLevel = 0;
                var inFac = new InventoryFactory().InsertInventory(newProduct);

                var sMessageDialog = new MessageDialog
                {
                    Message = { Text = "Added succesfully!" }
                };
                DialogHost.Show(sMessageDialog, "RootDialog");
                ClearButton_Click(null, null);
                return;
            }
            else
            {
                var sMessageDialog = new MessageDialog
                {
                    Message = { Text = "Couldn't Insert!" }
                };
                DialogHost.Show(sMessageDialog, "RootDialog");
                return;
            }
        }

        private void ClearButton_Click(object sender, RoutedEventArgs e)
        {
            NameTextBox.Clear();
            SerialNoTextBox.Clear();

            MakeComboBox.SelectedItem = null;
            CertComboBox.SelectedItem = null;
            PanelIPNumberComboBox.SelectedItem = null;
            SizeComboBox.SelectedItem = null;
            PanelTypeComboBox.SelectedItem = null;
            PartTypeComboBox.SelectedItem = null;
        }
    }
}
