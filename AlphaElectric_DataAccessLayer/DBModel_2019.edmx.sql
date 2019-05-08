
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 05/08/2019 00:29:09
-- Generated from EDMX file: F:\Cloud\Stuff\IIU\Semester 5\VP\Project\AlphaElectric\AlphaElectric_DataAccessLayer\DBModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [AlphaElectric];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_EmployeeDesignation]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Employees] DROP CONSTRAINT [FK_EmployeeDesignation];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductInventory]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Inventories] DROP CONSTRAINT [FK_ProductInventory];
GO
IF OBJECT_ID(N'[dbo].[FK_PanelPanelShellGradeProtection]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Products_Panel] DROP CONSTRAINT [FK_PanelPanelShellGradeProtection];
GO
IF OBJECT_ID(N'[dbo].[FK_PanelSizeType]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Products_Panel] DROP CONSTRAINT [FK_PanelSizeType];
GO
IF OBJECT_ID(N'[dbo].[FK_PanelCertification]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Products_Panel] DROP CONSTRAINT [FK_PanelCertification];
GO
IF OBJECT_ID(N'[dbo].[FK_PanelType]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Products_Panel] DROP CONSTRAINT [FK_PanelType];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductMake]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Products] DROP CONSTRAINT [FK_ProductMake];
GO
IF OBJECT_ID(N'[dbo].[FK_PartPaType]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Products_Part] DROP CONSTRAINT [FK_PartPaType];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductProduct_CustomerOrderBT]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Product_CustomerOrderBT] DROP CONSTRAINT [FK_ProductProduct_CustomerOrderBT];
GO
IF OBJECT_ID(N'[dbo].[FK_Product_CustomerOrderBTCustomerOrder]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Product_CustomerOrderBT] DROP CONSTRAINT [FK_Product_CustomerOrderBTCustomerOrder];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductProduct_PurchaseOrderBT]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Product_PurchaseOrderBT] DROP CONSTRAINT [FK_ProductProduct_PurchaseOrderBT];
GO
IF OBJECT_ID(N'[dbo].[FK_PurchaseOrderProduct_PurchaseOrderBT]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Product_PurchaseOrderBT] DROP CONSTRAINT [FK_PurchaseOrderProduct_PurchaseOrderBT];
GO
IF OBJECT_ID(N'[dbo].[FK_CustomerOrderContact]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CustomerOrders] DROP CONSTRAINT [FK_CustomerOrderContact];
GO
IF OBJECT_ID(N'[dbo].[FK_PurchaseOrderContact]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PurchaseOrders] DROP CONSTRAINT [FK_PurchaseOrderContact];
GO
IF OBJECT_ID(N'[dbo].[FK_PanelPanel_ProjectBT]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Panel_ProjectBT] DROP CONSTRAINT [FK_PanelPanel_ProjectBT];
GO
IF OBJECT_ID(N'[dbo].[FK_ProjectPanel_ProjectBT]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Panel_ProjectBT] DROP CONSTRAINT [FK_ProjectPanel_ProjectBT];
GO
IF OBJECT_ID(N'[dbo].[FK_LocationInventory]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Inventories] DROP CONSTRAINT [FK_LocationInventory];
GO
IF OBJECT_ID(N'[dbo].[FK_EmployeeEmployeeStatus]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Employees] DROP CONSTRAINT [FK_EmployeeEmployeeStatus];
GO
IF OBJECT_ID(N'[dbo].[FK_OrderStatusCustomerOrder]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CustomerOrders] DROP CONSTRAINT [FK_OrderStatusCustomerOrder];
GO
IF OBJECT_ID(N'[dbo].[FK_OrderStatusPurchaseOrder]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PurchaseOrders] DROP CONSTRAINT [FK_OrderStatusPurchaseOrder];
GO
IF OBJECT_ID(N'[dbo].[FK_EmployeePurchaseOrder]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PurchaseOrders] DROP CONSTRAINT [FK_EmployeePurchaseOrder];
GO
IF OBJECT_ID(N'[dbo].[FK_CustomerOrderEmployee]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CustomerOrders] DROP CONSTRAINT [FK_CustomerOrderEmployee];
GO
IF OBJECT_ID(N'[dbo].[FK_ProjectCustomerOrder]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Projects] DROP CONSTRAINT [FK_ProjectCustomerOrder];
GO
IF OBJECT_ID(N'[dbo].[FK_Panel_inherits_Product]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Products_Panel] DROP CONSTRAINT [FK_Panel_inherits_Product];
GO
IF OBJECT_ID(N'[dbo].[FK_Part_inherits_Product]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Products_Part] DROP CONSTRAINT [FK_Part_inherits_Product];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Employees]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Employees];
GO
IF OBJECT_ID(N'[dbo].[Designations]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Designations];
GO
IF OBJECT_ID(N'[dbo].[Products]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Products];
GO
IF OBJECT_ID(N'[dbo].[Inventories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Inventories];
GO
IF OBJECT_ID(N'[dbo].[Locations]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Locations];
GO
IF OBJECT_ID(N'[dbo].[PanelShellGradeProtections]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PanelShellGradeProtections];
GO
IF OBJECT_ID(N'[dbo].[SizeTypes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SizeTypes];
GO
IF OBJECT_ID(N'[dbo].[Types]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Types];
GO
IF OBJECT_ID(N'[dbo].[Certifications]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Certifications];
GO
IF OBJECT_ID(N'[dbo].[Makes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Makes];
GO
IF OBJECT_ID(N'[dbo].[PaTypes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PaTypes];
GO
IF OBJECT_ID(N'[dbo].[CustomerOrders]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CustomerOrders];
GO
IF OBJECT_ID(N'[dbo].[Product_CustomerOrderBT]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Product_CustomerOrderBT];
GO
IF OBJECT_ID(N'[dbo].[Contacts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Contacts];
GO
IF OBJECT_ID(N'[dbo].[PurchaseOrders]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PurchaseOrders];
GO
IF OBJECT_ID(N'[dbo].[Product_PurchaseOrderBT]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Product_PurchaseOrderBT];
GO
IF OBJECT_ID(N'[dbo].[Projects]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Projects];
GO
IF OBJECT_ID(N'[dbo].[Logins]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Logins];
GO
IF OBJECT_ID(N'[dbo].[Panel_ProjectBT]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Panel_ProjectBT];
GO
IF OBJECT_ID(N'[dbo].[EmployeeStatus]', 'U') IS NOT NULL
    DROP TABLE [dbo].[EmployeeStatus];
GO
IF OBJECT_ID(N'[dbo].[OrderStatus]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OrderStatus];
GO
IF OBJECT_ID(N'[dbo].[Products_Panel]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Products_Panel];
GO
IF OBJECT_ID(N'[dbo].[Products_Part]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Products_Part];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Employees'
CREATE TABLE [dbo].[Employees] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(200)  NOT NULL,
    [LastName] nvarchar(200)  NOT NULL,
    [Phone] nvarchar(200)  NOT NULL,
    [Passport] nvarchar(200)  NOT NULL,
    [JoinDate] datetime  NOT NULL,
    [Address] nvarchar(200)  NOT NULL,
    [DesignationID] int  NOT NULL,
    [EmployeeStatusID] int  NOT NULL
);
GO

-- Creating table 'Designations'
CREATE TABLE [dbo].[Designations] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(200)  NOT NULL
);
GO

-- Creating table 'Products'
CREATE TABLE [dbo].[Products] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [SerialNo] nvarchar(200)  NOT NULL,
    [Name] nvarchar(200)  NOT NULL,
    [MakeID] int  NOT NULL
);
GO

-- Creating table 'Inventories'
CREATE TABLE [dbo].[Inventories] (
    [ID] int  NOT NULL,
    [StockLevel] int  NOT NULL,
    [LocationID] int  NOT NULL
);
GO

-- Creating table 'Locations'
CREATE TABLE [dbo].[Locations] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(100)  NULL
);
GO

-- Creating table 'PanelShellGradeProtections'
CREATE TABLE [dbo].[PanelShellGradeProtections] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [IPNum] nvarchar(200)  NOT NULL,
    [DescriptionSolids] nvarchar(200)  NOT NULL,
    [DescriptionLiquids] nvarchar(200)  NOT NULL
);
GO

-- Creating table 'SizeTypes'
CREATE TABLE [dbo].[SizeTypes] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Description] nvarchar(200)  NOT NULL
);
GO

-- Creating table 'Types'
CREATE TABLE [dbo].[Types] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Description] nvarchar(200)  NOT NULL
);
GO

-- Creating table 'Certifications'
CREATE TABLE [dbo].[Certifications] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Description] nvarchar(200)  NOT NULL,
    [Name] nvarchar(200)  NOT NULL
);
GO

-- Creating table 'Makes'
CREATE TABLE [dbo].[Makes] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(100)  NOT NULL
);
GO

-- Creating table 'PaTypes'
CREATE TABLE [dbo].[PaTypes] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(200)  NOT NULL
);
GO

-- Creating table 'CustomerOrders'
CREATE TABLE [dbo].[CustomerOrders] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [OrderDate] datetime  NOT NULL,
    [DeliveryDate] datetime  NOT NULL,
    [ContactID] int  NOT NULL,
    [OrderStatusID] int  NOT NULL,
    [EmployeeID] int  NOT NULL
);
GO

-- Creating table 'Product_CustomerOrderBT'
CREATE TABLE [dbo].[Product_CustomerOrderBT] (
    [ProductID] int  NOT NULL,
    [CustomerOrderID] int  NOT NULL,
    [Quantity] int  NOT NULL
);
GO

-- Creating table 'Contacts'
CREATE TABLE [dbo].[Contacts] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [CompanyName] nvarchar(200)  NOT NULL,
    [Phone] nvarchar(200)  NOT NULL,
    [Email] nvarchar(200)  NOT NULL,
    [Address] nvarchar(200)  NOT NULL
);
GO

-- Creating table 'PurchaseOrders'
CREATE TABLE [dbo].[PurchaseOrders] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [PODate] datetime  NOT NULL,
    [ContactID] int  NOT NULL,
    [OrderStatusID] int  NOT NULL,
    [EmployeeID] int  NOT NULL
);
GO

-- Creating table 'Product_PurchaseOrderBT'
CREATE TABLE [dbo].[Product_PurchaseOrderBT] (
    [Quantity] int  NOT NULL,
    [ProductID] int  NOT NULL,
    [PurchaseOrderID] int  NOT NULL
);
GO

-- Creating table 'Projects'
CREATE TABLE [dbo].[Projects] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(200)  NOT NULL,
    [DeliveyDate] datetime  NOT NULL,
    [CustomerOrderID] int  NOT NULL
);
GO

-- Creating table 'Logins'
CREATE TABLE [dbo].[Logins] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Username] nvarchar(200)  NOT NULL,
    [Password] nvarchar(200)  NOT NULL,
    [Name] nvarchar(200)  NOT NULL
);
GO

-- Creating table 'Panel_ProjectBT'
CREATE TABLE [dbo].[Panel_ProjectBT] (
    [Quantity] int  NOT NULL,
    [PanelID] int  NOT NULL,
    [ProjectID] int  NOT NULL
);
GO

-- Creating table 'EmployeeStatus'
CREATE TABLE [dbo].[EmployeeStatus] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'OrderStatus'
CREATE TABLE [dbo].[OrderStatus] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Products_Panel'
CREATE TABLE [dbo].[Products_Panel] (
    [PanelShellGradeProtectionIPNumber] int  NOT NULL,
    [SizeTypeID] int  NOT NULL,
    [CertificationID] int  NOT NULL,
    [TypeID] int  NOT NULL,
    [ID] int  NOT NULL
);
GO

-- Creating table 'Products_Part'
CREATE TABLE [dbo].[Products_Part] (
    [PaTypeID] int  NOT NULL,
    [ID] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ID] in table 'Employees'
ALTER TABLE [dbo].[Employees]
ADD CONSTRAINT [PK_Employees]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Designations'
ALTER TABLE [dbo].[Designations]
ADD CONSTRAINT [PK_Designations]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [PK_Products]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Inventories'
ALTER TABLE [dbo].[Inventories]
ADD CONSTRAINT [PK_Inventories]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Locations'
ALTER TABLE [dbo].[Locations]
ADD CONSTRAINT [PK_Locations]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'PanelShellGradeProtections'
ALTER TABLE [dbo].[PanelShellGradeProtections]
ADD CONSTRAINT [PK_PanelShellGradeProtections]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'SizeTypes'
ALTER TABLE [dbo].[SizeTypes]
ADD CONSTRAINT [PK_SizeTypes]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Types'
ALTER TABLE [dbo].[Types]
ADD CONSTRAINT [PK_Types]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Certifications'
ALTER TABLE [dbo].[Certifications]
ADD CONSTRAINT [PK_Certifications]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Makes'
ALTER TABLE [dbo].[Makes]
ADD CONSTRAINT [PK_Makes]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'PaTypes'
ALTER TABLE [dbo].[PaTypes]
ADD CONSTRAINT [PK_PaTypes]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'CustomerOrders'
ALTER TABLE [dbo].[CustomerOrders]
ADD CONSTRAINT [PK_CustomerOrders]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ProductID], [CustomerOrderID] in table 'Product_CustomerOrderBT'
ALTER TABLE [dbo].[Product_CustomerOrderBT]
ADD CONSTRAINT [PK_Product_CustomerOrderBT]
    PRIMARY KEY CLUSTERED ([ProductID], [CustomerOrderID] ASC);
GO

-- Creating primary key on [ID] in table 'Contacts'
ALTER TABLE [dbo].[Contacts]
ADD CONSTRAINT [PK_Contacts]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'PurchaseOrders'
ALTER TABLE [dbo].[PurchaseOrders]
ADD CONSTRAINT [PK_PurchaseOrders]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ProductID], [PurchaseOrderID] in table 'Product_PurchaseOrderBT'
ALTER TABLE [dbo].[Product_PurchaseOrderBT]
ADD CONSTRAINT [PK_Product_PurchaseOrderBT]
    PRIMARY KEY CLUSTERED ([ProductID], [PurchaseOrderID] ASC);
GO

-- Creating primary key on [ID] in table 'Projects'
ALTER TABLE [dbo].[Projects]
ADD CONSTRAINT [PK_Projects]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Logins'
ALTER TABLE [dbo].[Logins]
ADD CONSTRAINT [PK_Logins]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [PanelID], [ProjectID] in table 'Panel_ProjectBT'
ALTER TABLE [dbo].[Panel_ProjectBT]
ADD CONSTRAINT [PK_Panel_ProjectBT]
    PRIMARY KEY CLUSTERED ([PanelID], [ProjectID] ASC);
GO

-- Creating primary key on [ID] in table 'EmployeeStatus'
ALTER TABLE [dbo].[EmployeeStatus]
ADD CONSTRAINT [PK_EmployeeStatus]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'OrderStatus'
ALTER TABLE [dbo].[OrderStatus]
ADD CONSTRAINT [PK_OrderStatus]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Products_Panel'
ALTER TABLE [dbo].[Products_Panel]
ADD CONSTRAINT [PK_Products_Panel]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Products_Part'
ALTER TABLE [dbo].[Products_Part]
ADD CONSTRAINT [PK_Products_Part]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [DesignationID] in table 'Employees'
ALTER TABLE [dbo].[Employees]
ADD CONSTRAINT [FK_EmployeeDesignation]
    FOREIGN KEY ([DesignationID])
    REFERENCES [dbo].[Designations]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EmployeeDesignation'
CREATE INDEX [IX_FK_EmployeeDesignation]
ON [dbo].[Employees]
    ([DesignationID]);
GO

-- Creating foreign key on [ID] in table 'Inventories'
ALTER TABLE [dbo].[Inventories]
ADD CONSTRAINT [FK_ProductInventory]
    FOREIGN KEY ([ID])
    REFERENCES [dbo].[Products]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [PanelShellGradeProtectionIPNumber] in table 'Products_Panel'
ALTER TABLE [dbo].[Products_Panel]
ADD CONSTRAINT [FK_PanelPanelShellGradeProtection]
    FOREIGN KEY ([PanelShellGradeProtectionIPNumber])
    REFERENCES [dbo].[PanelShellGradeProtections]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PanelPanelShellGradeProtection'
CREATE INDEX [IX_FK_PanelPanelShellGradeProtection]
ON [dbo].[Products_Panel]
    ([PanelShellGradeProtectionIPNumber]);
GO

-- Creating foreign key on [SizeTypeID] in table 'Products_Panel'
ALTER TABLE [dbo].[Products_Panel]
ADD CONSTRAINT [FK_PanelSizeType]
    FOREIGN KEY ([SizeTypeID])
    REFERENCES [dbo].[SizeTypes]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PanelSizeType'
CREATE INDEX [IX_FK_PanelSizeType]
ON [dbo].[Products_Panel]
    ([SizeTypeID]);
GO

-- Creating foreign key on [CertificationID] in table 'Products_Panel'
ALTER TABLE [dbo].[Products_Panel]
ADD CONSTRAINT [FK_PanelCertification]
    FOREIGN KEY ([CertificationID])
    REFERENCES [dbo].[Certifications]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PanelCertification'
CREATE INDEX [IX_FK_PanelCertification]
ON [dbo].[Products_Panel]
    ([CertificationID]);
GO

-- Creating foreign key on [TypeID] in table 'Products_Panel'
ALTER TABLE [dbo].[Products_Panel]
ADD CONSTRAINT [FK_PanelType]
    FOREIGN KEY ([TypeID])
    REFERENCES [dbo].[Types]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PanelType'
CREATE INDEX [IX_FK_PanelType]
ON [dbo].[Products_Panel]
    ([TypeID]);
GO

-- Creating foreign key on [MakeID] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [FK_ProductMake]
    FOREIGN KEY ([MakeID])
    REFERENCES [dbo].[Makes]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductMake'
CREATE INDEX [IX_FK_ProductMake]
ON [dbo].[Products]
    ([MakeID]);
GO

-- Creating foreign key on [PaTypeID] in table 'Products_Part'
ALTER TABLE [dbo].[Products_Part]
ADD CONSTRAINT [FK_PartPaType]
    FOREIGN KEY ([PaTypeID])
    REFERENCES [dbo].[PaTypes]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PartPaType'
CREATE INDEX [IX_FK_PartPaType]
ON [dbo].[Products_Part]
    ([PaTypeID]);
GO

-- Creating foreign key on [ProductID] in table 'Product_CustomerOrderBT'
ALTER TABLE [dbo].[Product_CustomerOrderBT]
ADD CONSTRAINT [FK_ProductProduct_CustomerOrderBT]
    FOREIGN KEY ([ProductID])
    REFERENCES [dbo].[Products]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [CustomerOrderID] in table 'Product_CustomerOrderBT'
ALTER TABLE [dbo].[Product_CustomerOrderBT]
ADD CONSTRAINT [FK_Product_CustomerOrderBTCustomerOrder]
    FOREIGN KEY ([CustomerOrderID])
    REFERENCES [dbo].[CustomerOrders]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Product_CustomerOrderBTCustomerOrder'
CREATE INDEX [IX_FK_Product_CustomerOrderBTCustomerOrder]
ON [dbo].[Product_CustomerOrderBT]
    ([CustomerOrderID]);
GO

-- Creating foreign key on [ProductID] in table 'Product_PurchaseOrderBT'
ALTER TABLE [dbo].[Product_PurchaseOrderBT]
ADD CONSTRAINT [FK_ProductProduct_PurchaseOrderBT]
    FOREIGN KEY ([ProductID])
    REFERENCES [dbo].[Products]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [PurchaseOrderID] in table 'Product_PurchaseOrderBT'
ALTER TABLE [dbo].[Product_PurchaseOrderBT]
ADD CONSTRAINT [FK_PurchaseOrderProduct_PurchaseOrderBT]
    FOREIGN KEY ([PurchaseOrderID])
    REFERENCES [dbo].[PurchaseOrders]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PurchaseOrderProduct_PurchaseOrderBT'
CREATE INDEX [IX_FK_PurchaseOrderProduct_PurchaseOrderBT]
ON [dbo].[Product_PurchaseOrderBT]
    ([PurchaseOrderID]);
GO

-- Creating foreign key on [ContactID] in table 'CustomerOrders'
ALTER TABLE [dbo].[CustomerOrders]
ADD CONSTRAINT [FK_CustomerOrderContact]
    FOREIGN KEY ([ContactID])
    REFERENCES [dbo].[Contacts]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CustomerOrderContact'
CREATE INDEX [IX_FK_CustomerOrderContact]
ON [dbo].[CustomerOrders]
    ([ContactID]);
GO

-- Creating foreign key on [ContactID] in table 'PurchaseOrders'
ALTER TABLE [dbo].[PurchaseOrders]
ADD CONSTRAINT [FK_PurchaseOrderContact]
    FOREIGN KEY ([ContactID])
    REFERENCES [dbo].[Contacts]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PurchaseOrderContact'
CREATE INDEX [IX_FK_PurchaseOrderContact]
ON [dbo].[PurchaseOrders]
    ([ContactID]);
GO

-- Creating foreign key on [PanelID] in table 'Panel_ProjectBT'
ALTER TABLE [dbo].[Panel_ProjectBT]
ADD CONSTRAINT [FK_PanelPanel_ProjectBT]
    FOREIGN KEY ([PanelID])
    REFERENCES [dbo].[Products_Panel]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ProjectID] in table 'Panel_ProjectBT'
ALTER TABLE [dbo].[Panel_ProjectBT]
ADD CONSTRAINT [FK_ProjectPanel_ProjectBT]
    FOREIGN KEY ([ProjectID])
    REFERENCES [dbo].[Projects]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProjectPanel_ProjectBT'
CREATE INDEX [IX_FK_ProjectPanel_ProjectBT]
ON [dbo].[Panel_ProjectBT]
    ([ProjectID]);
GO

-- Creating foreign key on [LocationID] in table 'Inventories'
ALTER TABLE [dbo].[Inventories]
ADD CONSTRAINT [FK_LocationInventory]
    FOREIGN KEY ([LocationID])
    REFERENCES [dbo].[Locations]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_LocationInventory'
CREATE INDEX [IX_FK_LocationInventory]
ON [dbo].[Inventories]
    ([LocationID]);
GO

-- Creating foreign key on [EmployeeStatusID] in table 'Employees'
ALTER TABLE [dbo].[Employees]
ADD CONSTRAINT [FK_EmployeeEmployeeStatus]
    FOREIGN KEY ([EmployeeStatusID])
    REFERENCES [dbo].[EmployeeStatus]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EmployeeEmployeeStatus'
CREATE INDEX [IX_FK_EmployeeEmployeeStatus]
ON [dbo].[Employees]
    ([EmployeeStatusID]);
GO

-- Creating foreign key on [OrderStatusID] in table 'CustomerOrders'
ALTER TABLE [dbo].[CustomerOrders]
ADD CONSTRAINT [FK_OrderStatusCustomerOrder]
    FOREIGN KEY ([OrderStatusID])
    REFERENCES [dbo].[OrderStatus]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderStatusCustomerOrder'
CREATE INDEX [IX_FK_OrderStatusCustomerOrder]
ON [dbo].[CustomerOrders]
    ([OrderStatusID]);
GO

-- Creating foreign key on [OrderStatusID] in table 'PurchaseOrders'
ALTER TABLE [dbo].[PurchaseOrders]
ADD CONSTRAINT [FK_OrderStatusPurchaseOrder]
    FOREIGN KEY ([OrderStatusID])
    REFERENCES [dbo].[OrderStatus]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderStatusPurchaseOrder'
CREATE INDEX [IX_FK_OrderStatusPurchaseOrder]
ON [dbo].[PurchaseOrders]
    ([OrderStatusID]);
GO

-- Creating foreign key on [EmployeeID] in table 'PurchaseOrders'
ALTER TABLE [dbo].[PurchaseOrders]
ADD CONSTRAINT [FK_EmployeePurchaseOrder]
    FOREIGN KEY ([EmployeeID])
    REFERENCES [dbo].[Employees]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EmployeePurchaseOrder'
CREATE INDEX [IX_FK_EmployeePurchaseOrder]
ON [dbo].[PurchaseOrders]
    ([EmployeeID]);
GO

-- Creating foreign key on [EmployeeID] in table 'CustomerOrders'
ALTER TABLE [dbo].[CustomerOrders]
ADD CONSTRAINT [FK_CustomerOrderEmployee]
    FOREIGN KEY ([EmployeeID])
    REFERENCES [dbo].[Employees]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CustomerOrderEmployee'
CREATE INDEX [IX_FK_CustomerOrderEmployee]
ON [dbo].[CustomerOrders]
    ([EmployeeID]);
GO

-- Creating foreign key on [CustomerOrderID] in table 'Projects'
ALTER TABLE [dbo].[Projects]
ADD CONSTRAINT [FK_ProjectCustomerOrder]
    FOREIGN KEY ([CustomerOrderID])
    REFERENCES [dbo].[CustomerOrders]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProjectCustomerOrder'
CREATE INDEX [IX_FK_ProjectCustomerOrder]
ON [dbo].[Projects]
    ([CustomerOrderID]);
GO

-- Creating foreign key on [ID] in table 'Products_Panel'
ALTER TABLE [dbo].[Products_Panel]
ADD CONSTRAINT [FK_Panel_inherits_Product]
    FOREIGN KEY ([ID])
    REFERENCES [dbo].[Products]
        ([ID])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ID] in table 'Products_Part'
ALTER TABLE [dbo].[Products_Part]
ADD CONSTRAINT [FK_Part_inherits_Product]
    FOREIGN KEY ([ID])
    REFERENCES [dbo].[Products]
        ([ID])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------