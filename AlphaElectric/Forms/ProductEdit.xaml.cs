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
    public partial class ProductEdit : UserControl
    {
        ProductViewModel _vm;
        //Adding backgroud worker
        BackgroundWorker worker;
        List<Product> prodlist;

        public ProductEdit()
        {
            InitializeComponent();

            _vm = new ProductViewModel();
            this.DataContext = _vm;
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
            prodlist = new ProductFactory().SelectAll();
            List<Make> mklist = new MakeFactory().SelectAll();
            List<Location> locList = new LocationFactory().SelectAll();
            this.Dispatcher.Invoke(() =>
            {
                MakeComboBox.ItemsSource = mklist;
                MakeComboBox.DisplayMemberPath = "Name";
                MakeComboBox.SelectedValuePath = "ID";

                SelectProductComboBox.ItemsSource = prodlist;
                SelectProductComboBox.DisplayMemberPath = "Name";
                SelectProductComboBox.SelectedValuePath = "ID";

                LocationComboBox.ItemsSource = locList;
                LocationComboBox.DisplayMemberPath = "Name";
                LocationComboBox.SelectedValuePath = "ID";
            });
        }

        private void ForceValidation()
        {
            this.SerialNoTextBox.GetBindingExpression(TextBox.TextProperty).UpdateSource();
            this.StockLevelTextBox.GetBindingExpression(TextBox.TextProperty).UpdateSource();
            this.NameTextBox.GetBindingExpression(TextBox.TextProperty).UpdateSource();
            this.MakeComboBox.GetBindingExpression(ComboBox.SelectedValueProperty).UpdateSource();
            this.LocationComboBox.GetBindingExpression(ComboBox.SelectedValueProperty).UpdateSource();
            this.SelectProductComboBox.GetBindingExpression(ComboBox.SelectedValueProperty).UpdateSource();
        }

        private void InsertButton_Click(object sender, RoutedEventArgs e)
        {
            #region validation 
            ForceValidation();
            if (Validation.GetHasError(SerialNoTextBox) ||
                Validation.GetHasError(StockLevelTextBox) ||
                Validation.GetHasError(NameTextBox) ||
                Validation.GetHasError(MakeComboBox) ||
                Validation.GetHasError(LocationComboBox) ||
                Validation.GetHasError(SelectProductComboBox)
                )
            {
                var sMessageDialog = new MessageDialog
                {
                    Message = { Text =
                    "ERROR: Fill required fields!" }
                };

                DialogHost.Show(sMessageDialog, "RootDialog");
                return;
            }

            if (SelectProductComboBox.SelectedItem == null)
            {
                var sMessageDialog = new MessageDialog
                {
                    Message = { Text =
                    "ERROR: Select a Product!" }
                };

                DialogHost.Show(sMessageDialog, "RootDialog");
                return;
            }

            if (MakeComboBox.SelectedItem == null)
            {
                var sMessageDialog = new MessageDialog
                {
                    Message = { Text =
                    "ERROR: Select a Make Name!" }
                };

                DialogHost.Show(sMessageDialog, "RootDialog");
                return;
            }

            if (LocationComboBox.SelectedItem == null)
            {
                var sMessageDialog = new MessageDialog
                {
                    Message = { Text =
                    "ERROR: Select a Location!" }
                };

                DialogHost.Show(sMessageDialog, "RootDialog");
                return;
            }

            if (string.IsNullOrEmpty(StockLevelTextBox.Text) || !(int.TryParse(StockLevelTextBox.Text, out int a)))
            {
                var sMessageDialog = new MessageDialog
                {
                    Message = { Text =
                    "ERROR: Enter valid Stock level\n(Numerical value)!" }
                };

                DialogHost.Show(sMessageDialog, "RootDialog");
                return;
            }

            if (int.Parse(StockLevelTextBox.Text) < 0)
            {
                var sMessageDialog = new MessageDialog
                {
                    Message = { Text =
                    "ERROR: Enter right value for stock.." }
                };

                DialogHost.Show(sMessageDialog, "RootDialog");
                return;
            }
            #endregion

            bool flag1 = false;
            bool flag2 = false;

            if (new ProductFactory().Update(int.Parse(SelectProductComboBox.SelectedValue.ToString()),
                SerialNoTextBox.Text,
                NameTextBox.Text,
                int.Parse(MakeComboBox.SelectedValue.ToString())))
            {
                flag1 = true;
            }
            else
                flag1 = false;

            if (new InventoryFactory().Update(int.Parse(SelectProductComboBox.SelectedValue.ToString()),
                int.Parse(StockLevelTextBox.Text.ToString()),
               int.Parse(LocationComboBox.SelectedValue.ToString())))
            {
                flag2 = true;
            }
            else
                flag2 = false;

            if (flag1 || flag2)
            {
                var sMessageDialog = new MessageDialog
                {
                    Message = { Text = "Updated Info!" }
                };

                DialogHost.Show(sMessageDialog, "RootDialog");
            }
            else
            {
                var sMessageDialog = new MessageDialog
                {
                    Message = { Text = "Unable to update Info" }
                };

                DialogHost.Show(sMessageDialog, "RootDialog");
            }
        }

        private void SelectProductComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateFields();
        }

        void UpdateFields()
        {
            if (SelectProductComboBox.SelectedValue != null)
            {
                var id = int.Parse(SelectProductComboBox.SelectedValue.ToString());
                var prod = new ProductFactory().SelectAll().Where(x => x.ID == id).FirstOrDefault();
                if (prod != null)
                {
                    SerialNoTextBox.Text = prod.SerialNo;
                    NameTextBox.Text = prod.Name;
                    MakeComboBox.SelectedValue = prod.MakeID;
                }

                var inven = new InventoryFactory().SelectAll().Where(x => x.ID == id).FirstOrDefault();
                if (inven != null)
                {
                    LocationComboBox.SelectedValue = inven.LocationID;
                    StockLevelTextBox.Text = inven.StockLevel.ToString();
                }
            }
        }

        private void ClearButton_Click(object sender, RoutedEventArgs e)
        {
            Clear();
        }

        private void Clear()
        {
            this.SelectProductComboBox.SelectedItem = null;
            this.MakeComboBox.SelectedItem = null;
            this.SerialNoTextBox.Clear();
            this.NameTextBox.Clear();
            this.StockLevelTextBox.Clear();
        }
    }
}