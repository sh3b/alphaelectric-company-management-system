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
using System.ComponentModel;


// Added DA & Factories
using AlphaElectric_DataAccessLayer;
using AlphaElectric_DataAccessLayer.Factories;

namespace AlphaElectric.Forms
{
    /// <summary>
    /// Interaction logic for AddProduct.xaml
    /// </summary>
    public partial class AddProduct : MetroWindow
    {
        //Adding backgroud worker.
        BackgroundWorker worker;

        public AddProduct()
        {
            InitializeComponent();
        }

        //Executing after loading window
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
            List<PanelShellGradeProtection> shellgradelist =new PanelShellGradeProtectionFactory().SelectAll();
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

        private void InsertButton_Click(object sender, RoutedEventArgs e)
        {
            AlphaElectric_DataAccessLayer.Panel panel = new AlphaElectric_DataAccessLayer.Panel();
            Part part = new Part();

            if ((bool)P_Panel.IsChecked)
            {
                panel.Name = NameTextBox.Text;
                panel.SerialNo = SerialNoTextBox.Text;
                panel.MakeID = int.Parse(MakeComboBox.SelectedValue.ToString());
                panel.Name = NameTextBox.Text;

                panel.TypeID = int.Parse(PanelTypeComboBox.SelectedValue.ToString());
                panel.SizeTypeID = int.Parse(SizeComboBox.SelectedValue.ToString());
                panel.PanelShellGradeProtectionIPNumber = int.Parse(PanelIPNumberComboBox.SelectedValue.ToString());
                panel.CertificationID = int.Parse(CertComboBox.SelectedValue.ToString());

                Product x = new AlphaElectric_DataAccessLayer.Panel();
                x = panel;

                ProductFactory fac = new ProductFactory();
                if (fac.InsertProduct(x))
                    MessageBox.Show("inserted");
                else
                    MessageBox.Show("not inserted");
            }

            if ((bool)P_Part.IsChecked)
            {
                part.Name = NameTextBox.Text;
                part.SerialNo = SerialNoTextBox.Text;
                part.MakeID = int.Parse(MakeComboBox.SelectedValue.ToString());
                part.Name = NameTextBox.Text;

                part.PaTypeID = int.Parse(PartTypeComboBox.SelectedValue.ToString());

                Product x = new Part();
                x = part;

                ProductFactory fac = new ProductFactory();
                if (fac.InsertProduct(x))
                    MessageBox.Show("inserted");
                else
                    MessageBox.Show("not inserted");
            }
        }

        private void ExitButton_Click(object sender, RoutedEventArgs e)
        {
        }
    }
}
