//namespace AlphaElectric.Reports
//{
//    partial class CompaniesListReport
//    {
//        /// <summary>
//        /// Required designer variable.
//        /// </summary>
//        private System.ComponentModel.IContainer components = null;

//        /// <summary> 
//        /// Clean up any resources being used.
//        /// </summary>
//        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
//        protected override void Dispose(bool disposing)
//        {
//            if (disposing && (components != null))
//            {
//                components.Dispose();
//            }
//            base.Dispose(disposing);
//        }

//        #region Designer generated code

//        /// <summary>
//        /// Required method for Designer support - do not modify
//        /// the contents of this method with the code editor.
//        /// </summary>
//        private void InitializeComponent()
//        {
//            this.components = new System.ComponentModel.Container();
//            DevExpress.DataAccess.EntityFramework.EFConnectionParameters efConnectionParameters1 = new DevExpress.DataAccess.EntityFramework.EFConnectionParameters();
//            this.Detail = new DevExpress.XtraReports.UI.DetailBand();
//            this.TopMargin = new DevExpress.XtraReports.UI.TopMarginBand();
//            this.BottomMargin = new DevExpress.XtraReports.UI.BottomMarginBand();
//            this.efDataSource1 = new DevExpress.DataAccess.EntityFramework.EFDataSource(this.components);
//            this.pageHeaderBand1 = new DevExpress.XtraReports.UI.PageHeaderBand();
//            this.xrLabel1 = new DevExpress.XtraReports.UI.XRLabel();
//            this.xrLabel2 = new DevExpress.XtraReports.UI.XRLabel();
//            this.xrLabel3 = new DevExpress.XtraReports.UI.XRLabel();
//            this.xrLabel4 = new DevExpress.XtraReports.UI.XRLabel();
//            this.xrLine1 = new DevExpress.XtraReports.UI.XRLine();
//            this.xrLine2 = new DevExpress.XtraReports.UI.XRLine();
//            this.groupHeaderBand1 = new DevExpress.XtraReports.UI.GroupHeaderBand();
//            this.xrLabel5 = new DevExpress.XtraReports.UI.XRLabel();
//            this.xrLabel6 = new DevExpress.XtraReports.UI.XRLabel();
//            this.xrLabel7 = new DevExpress.XtraReports.UI.XRLabel();
//            this.xrLabel8 = new DevExpress.XtraReports.UI.XRLabel();
//            this.pageFooterBand1 = new DevExpress.XtraReports.UI.PageFooterBand();
//            this.xrPageInfo1 = new DevExpress.XtraReports.UI.XRPageInfo();
//            this.xrPageInfo2 = new DevExpress.XtraReports.UI.XRPageInfo();
//            this.reportHeaderBand1 = new DevExpress.XtraReports.UI.ReportHeaderBand();
//            this.xrLabel9 = new DevExpress.XtraReports.UI.XRLabel();
//            this.xrLine3 = new DevExpress.XtraReports.UI.XRLine();
//            this.Title = new DevExpress.XtraReports.UI.XRControlStyle();
//            this.FieldCaption = new DevExpress.XtraReports.UI.XRControlStyle();
//            this.PageInfo = new DevExpress.XtraReports.UI.XRControlStyle();
//            this.DataField = new DevExpress.XtraReports.UI.XRControlStyle();
//            ((System.ComponentModel.ISupportInitialize)(this.efDataSource1)).BeginInit();
//            ((System.ComponentModel.ISupportInitialize)(this)).BeginInit();
//            // 
//            // Detail
//            // 
//            this.Detail.Dpi = 100F;
//            this.Detail.HeightF = 23F;
//            this.Detail.Name = "Detail";
//            this.Detail.Padding = new DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100F);
//            this.Detail.StyleName = "DataField";
//            this.Detail.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
//            // 
//            // TopMargin
//            // 
//            this.TopMargin.Dpi = 100F;
//            this.TopMargin.HeightF = 100F;
//            this.TopMargin.Name = "TopMargin";
//            this.TopMargin.Padding = new DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100F);
//            this.TopMargin.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
//            // 
//            // BottomMargin
//            // 
//            this.BottomMargin.Dpi = 100F;
//            this.BottomMargin.HeightF = 100F;
//            this.BottomMargin.Name = "BottomMargin";
//            this.BottomMargin.Padding = new DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100F);
//            this.BottomMargin.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
//            // 
//            // efDataSource1
//            // 
//            efConnectionParameters1.ConnectionString = "";
//            efConnectionParameters1.ConnectionStringName = "AlphaElectricEntitiesDB";
//            efConnectionParameters1.Source = typeof(AlphaElectric_DataAccessLayer.AlphaElectricEntitiesDB);
//            this.efDataSource1.ConnectionParameters = efConnectionParameters1;
//            this.efDataSource1.Name = "efDataSource1";
//            // 
//            // pageHeaderBand1
//            // 
//            this.pageHeaderBand1.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
//            this.xrLabel2,
//            this.xrLabel3,
//            this.xrLine1,
//            this.xrLine2,
//            this.xrLabel4,
//            this.xrLabel1});
//            this.pageHeaderBand1.Dpi = 100F;
//            this.pageHeaderBand1.HeightF = 45.00002F;
//            this.pageHeaderBand1.Name = "pageHeaderBand1";
//            // 
//            // xrLabel1
//            // 
//            this.xrLabel1.Dpi = 100F;
//            this.xrLabel1.LocationFloat = new DevExpress.Utils.PointFloat(188.4174F, 7.000001F);
//            this.xrLabel1.Name = "xrLabel1";
//            this.xrLabel1.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
//            this.xrLabel1.SizeF = new System.Drawing.SizeF(113.5424F, 36F);
//            this.xrLabel1.StyleName = "FieldCaption";
//            this.xrLabel1.Text = "Phone";
//            // 
//            // xrLabel2
//            // 
//            this.xrLabel2.Dpi = 100F;
//            this.xrLabel2.LocationFloat = new DevExpress.Utils.PointFloat(301.9597F, 7.000001F);
//            this.xrLabel2.Name = "xrLabel2";
//            this.xrLabel2.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
//            this.xrLabel2.SizeF = new System.Drawing.SizeF(108.1356F, 36F);
//            this.xrLabel2.StyleName = "FieldCaption";
//            this.xrLabel2.Text = "Email";
//            // 
//            // xrLabel3
//            // 
//            this.xrLabel3.Dpi = 100F;
//            this.xrLabel3.LocationFloat = new DevExpress.Utils.PointFloat(410.0953F, 4.999987F);
//            this.xrLabel3.Name = "xrLabel3";
//            this.xrLabel3.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
//            this.xrLabel3.SizeF = new System.Drawing.SizeF(233.9047F, 36F);
//            this.xrLabel3.StyleName = "FieldCaption";
//            this.xrLabel3.Text = "Address";
//            // 
//            // xrLabel4
//            // 
//            this.xrLabel4.Dpi = 100F;
//            this.xrLabel4.LocationFloat = new DevExpress.Utils.PointFloat(5.999994F, 7.000001F);
//            this.xrLabel4.Name = "xrLabel4";
//            this.xrLabel4.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
//            this.xrLabel4.SizeF = new System.Drawing.SizeF(182.4174F, 36F);
//            this.xrLabel4.StyleName = "FieldCaption";
//            this.xrLabel4.Text = "Company Name";
//            // 
//            // xrLine1
//            // 
//            this.xrLine1.Dpi = 100F;
//            this.xrLine1.LocationFloat = new DevExpress.Utils.PointFloat(6F, 5F);
//            this.xrLine1.Name = "xrLine1";
//            this.xrLine1.SizeF = new System.Drawing.SizeF(638F, 2F);
//            // 
//            // xrLine2
//            // 
//            this.xrLine2.Dpi = 100F;
//            this.xrLine2.LocationFloat = new DevExpress.Utils.PointFloat(6F, 43F);
//            this.xrLine2.Name = "xrLine2";
//            this.xrLine2.SizeF = new System.Drawing.SizeF(638F, 2F);
//            // 
//            // groupHeaderBand1
//            // 
//            this.groupHeaderBand1.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
//            this.xrLabel5,
//            this.xrLabel6,
//            this.xrLabel7,
//            this.xrLabel8});
//            this.groupHeaderBand1.Dpi = 100F;
//            this.groupHeaderBand1.GroupFields.AddRange(new DevExpress.XtraReports.UI.GroupField[] {
//            new DevExpress.XtraReports.UI.GroupField("Phone", DevExpress.XtraReports.UI.XRColumnSortOrder.Ascending),
//            new DevExpress.XtraReports.UI.GroupField("Email", DevExpress.XtraReports.UI.XRColumnSortOrder.Ascending),
//            new DevExpress.XtraReports.UI.GroupField("Address", DevExpress.XtraReports.UI.XRColumnSortOrder.Ascending),
//            new DevExpress.XtraReports.UI.GroupField("CompanyName", DevExpress.XtraReports.UI.XRColumnSortOrder.Ascending)});
//            this.groupHeaderBand1.HeightF = 41F;
//            this.groupHeaderBand1.Name = "groupHeaderBand1";
//            this.groupHeaderBand1.StyleName = "DataField";
//            // 
//            // xrLabel5
//            // 
//            this.xrLabel5.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
//            new DevExpress.XtraReports.UI.XRBinding("Text", null, "Contacts.Phone")});
//            this.xrLabel5.Dpi = 100F;
//            this.xrLabel5.LocationFloat = new DevExpress.Utils.PointFloat(188.4174F, 0F);
//            this.xrLabel5.Name = "xrLabel5";
//            this.xrLabel5.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
//            this.xrLabel5.SizeF = new System.Drawing.SizeF(113.5424F, 23F);
//            this.xrLabel5.Text = "xrLabel5";
//            // 
//            // xrLabel6
//            // 
//            this.xrLabel6.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
//            new DevExpress.XtraReports.UI.XRBinding("Text", null, "Contacts.Email")});
//            this.xrLabel6.Dpi = 100F;
//            this.xrLabel6.LocationFloat = new DevExpress.Utils.PointFloat(301.9597F, 0F);
//            this.xrLabel6.Name = "xrLabel6";
//            this.xrLabel6.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
//            this.xrLabel6.SizeF = new System.Drawing.SizeF(108.1356F, 23F);
//            this.xrLabel6.Text = "xrLabel6";
//            // 
//            // xrLabel7
//            // 
//            this.xrLabel7.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
//            new DevExpress.XtraReports.UI.XRBinding("Text", null, "Contacts.Address")});
//            this.xrLabel7.Dpi = 100F;
//            this.xrLabel7.LocationFloat = new DevExpress.Utils.PointFloat(410.0953F, 0F);
//            this.xrLabel7.Name = "xrLabel7";
//            this.xrLabel7.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
//            this.xrLabel7.SizeF = new System.Drawing.SizeF(233.9047F, 23F);
//            this.xrLabel7.Text = "xrLabel7";
//            // 
//            // xrLabel8
//            // 
//            this.xrLabel8.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
//            new DevExpress.XtraReports.UI.XRBinding("Text", null, "Contacts.CompanyName")});
//            this.xrLabel8.Dpi = 100F;
//            this.xrLabel8.LocationFloat = new DevExpress.Utils.PointFloat(5.999994F, 0F);
//            this.xrLabel8.Name = "xrLabel8";
//            this.xrLabel8.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
//            this.xrLabel8.SizeF = new System.Drawing.SizeF(182.4174F, 23F);
//            this.xrLabel8.Text = "xrLabel8";
//            // 
//            // pageFooterBand1
//            // 
//            this.pageFooterBand1.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
//            this.xrPageInfo1,
//            this.xrPageInfo2});
//            this.pageFooterBand1.Dpi = 100F;
//            this.pageFooterBand1.HeightF = 29F;
//            this.pageFooterBand1.Name = "pageFooterBand1";
//            // 
//            // xrPageInfo1
//            // 
//            this.xrPageInfo1.Dpi = 100F;
//            this.xrPageInfo1.LocationFloat = new DevExpress.Utils.PointFloat(6F, 6F);
//            this.xrPageInfo1.Name = "xrPageInfo1";
//            this.xrPageInfo1.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
//            this.xrPageInfo1.PageInfo = DevExpress.XtraPrinting.PageInfo.DateTime;
//            this.xrPageInfo1.SizeF = new System.Drawing.SizeF(313F, 23F);
//            this.xrPageInfo1.StyleName = "PageInfo";
//            // 
//            // xrPageInfo2
//            // 
//            this.xrPageInfo2.Dpi = 100F;
//            this.xrPageInfo2.Format = "Page {0} of {1}";
//            this.xrPageInfo2.LocationFloat = new DevExpress.Utils.PointFloat(331F, 6F);
//            this.xrPageInfo2.Name = "xrPageInfo2";
//            this.xrPageInfo2.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
//            this.xrPageInfo2.SizeF = new System.Drawing.SizeF(313F, 23F);
//            this.xrPageInfo2.StyleName = "PageInfo";
//            this.xrPageInfo2.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopRight;
//            // 
//            // reportHeaderBand1
//            // 
//            this.reportHeaderBand1.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
//            this.xrLabel9,
//            this.xrLine3});
//            this.reportHeaderBand1.Dpi = 100F;
//            this.reportHeaderBand1.HeightF = 57F;
//            this.reportHeaderBand1.Name = "reportHeaderBand1";
//            // 
//            // xrLabel9
//            // 
//            this.xrLabel9.Dpi = 100F;
//            this.xrLabel9.LocationFloat = new DevExpress.Utils.PointFloat(6F, 2F);
//            this.xrLabel9.Name = "xrLabel9";
//            this.xrLabel9.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
//            this.xrLabel9.SizeF = new System.Drawing.SizeF(638F, 39F);
//            this.xrLabel9.StyleName = "Title";
//            this.xrLabel9.Text = "Companies List Report";
//            // 
//            // xrLine3
//            // 
//            this.xrLine3.Dpi = 100F;
//            this.xrLine3.LocationFloat = new DevExpress.Utils.PointFloat(6F, 0F);
//            this.xrLine3.Name = "xrLine3";
//            this.xrLine3.SizeF = new System.Drawing.SizeF(638F, 2F);
//            // 
//            // Title
//            // 
//            this.Title.BackColor = System.Drawing.Color.Transparent;
//            this.Title.BorderColor = System.Drawing.Color.Black;
//            this.Title.Borders = DevExpress.XtraPrinting.BorderSide.None;
//            this.Title.BorderWidth = 1F;
//            this.Title.Font = new System.Drawing.Font("Times New Roman", 24F);
//            this.Title.ForeColor = System.Drawing.Color.Black;
//            this.Title.Name = "Title";
//            // 
//            // FieldCaption
//            // 
//            this.FieldCaption.BackColor = System.Drawing.Color.Transparent;
//            this.FieldCaption.BorderColor = System.Drawing.Color.Black;
//            this.FieldCaption.Borders = DevExpress.XtraPrinting.BorderSide.None;
//            this.FieldCaption.BorderWidth = 1F;
//            this.FieldCaption.Font = new System.Drawing.Font("Times New Roman", 10F, System.Drawing.FontStyle.Bold);
//            this.FieldCaption.ForeColor = System.Drawing.Color.Black;
//            this.FieldCaption.Name = "FieldCaption";
//            // 
//            // PageInfo
//            // 
//            this.PageInfo.BackColor = System.Drawing.Color.Transparent;
//            this.PageInfo.BorderColor = System.Drawing.Color.Black;
//            this.PageInfo.Borders = DevExpress.XtraPrinting.BorderSide.None;
//            this.PageInfo.BorderWidth = 1F;
//            this.PageInfo.Font = new System.Drawing.Font("Times New Roman", 8F);
//            this.PageInfo.ForeColor = System.Drawing.Color.Black;
//            this.PageInfo.Name = "PageInfo";
//            // 
//            // DataField
//            // 
//            this.DataField.BackColor = System.Drawing.Color.Transparent;
//            this.DataField.BorderColor = System.Drawing.Color.Black;
//            this.DataField.Borders = DevExpress.XtraPrinting.BorderSide.None;
//            this.DataField.BorderWidth = 1F;
//            this.DataField.Font = new System.Drawing.Font("Times New Roman", 8F);
//            this.DataField.ForeColor = System.Drawing.Color.Black;
//            this.DataField.Name = "DataField";
//            this.DataField.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
//            // 
//            // CompaniesListReport
//            // 
//            this.Bands.AddRange(new DevExpress.XtraReports.UI.Band[] {
//            this.Detail,
//            this.TopMargin,
//            this.BottomMargin,
//            this.pageHeaderBand1,
//            this.groupHeaderBand1,
//            this.pageFooterBand1,
//            this.reportHeaderBand1});
//            this.ComponentStorage.AddRange(new System.ComponentModel.IComponent[] {
//            this.efDataSource1});
//            this.DataMember = "Contacts";
//            this.DataSource = this.efDataSource1;
//            this.StyleSheet.AddRange(new DevExpress.XtraReports.UI.XRControlStyle[] {
//            this.Title,
//            this.FieldCaption,
//            this.PageInfo,
//            this.DataField});
//            this.Version = "16.2";
//            ((System.ComponentModel.ISupportInitialize)(this.efDataSource1)).EndInit();
//            ((System.ComponentModel.ISupportInitialize)(this)).EndInit();

//        }

//        #endregion

//        private DevExpress.XtraReports.UI.DetailBand Detail;
//        private DevExpress.XtraReports.UI.TopMarginBand TopMargin;
//        private DevExpress.XtraReports.UI.BottomMarginBand BottomMargin;
//        private DevExpress.DataAccess.EntityFramework.EFDataSource efDataSource1;
//        private DevExpress.XtraReports.UI.PageHeaderBand pageHeaderBand1;
//        private DevExpress.XtraReports.UI.XRLabel xrLabel1;
//        private DevExpress.XtraReports.UI.XRLabel xrLabel2;
//        private DevExpress.XtraReports.UI.XRLabel xrLabel3;
//        private DevExpress.XtraReports.UI.XRLabel xrLabel4;
//        private DevExpress.XtraReports.UI.XRLine xrLine1;
//        private DevExpress.XtraReports.UI.XRLine xrLine2;
//        private DevExpress.XtraReports.UI.GroupHeaderBand groupHeaderBand1;
//        private DevExpress.XtraReports.UI.XRLabel xrLabel5;
//        private DevExpress.XtraReports.UI.XRLabel xrLabel6;
//        private DevExpress.XtraReports.UI.XRLabel xrLabel7;
//        private DevExpress.XtraReports.UI.XRLabel xrLabel8;
//        private DevExpress.XtraReports.UI.PageFooterBand pageFooterBand1;
//        private DevExpress.XtraReports.UI.XRPageInfo xrPageInfo1;
//        private DevExpress.XtraReports.UI.XRPageInfo xrPageInfo2;
//        private DevExpress.XtraReports.UI.ReportHeaderBand reportHeaderBand1;
//        private DevExpress.XtraReports.UI.XRLabel xrLabel9;
//        private DevExpress.XtraReports.UI.XRLine xrLine3;
//        private DevExpress.XtraReports.UI.XRControlStyle Title;
//        private DevExpress.XtraReports.UI.XRControlStyle FieldCaption;
//        private DevExpress.XtraReports.UI.XRControlStyle PageInfo;
//        private DevExpress.XtraReports.UI.XRControlStyle DataField;
//    }
//}
