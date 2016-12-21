
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 12/21/2016 16:43:02
-- Generated from EDMX file: C:\Users\Shuayb Ashraf\documents\visual studio 2017\Projects\AlphaElectric\AlphaElectric_DataAccessLayer\DBModel.edmx
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
IF OBJECT_ID(N'[dbo].[FK_InventoryLocation]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Locations] DROP CONSTRAINT [FK_InventoryLocation];
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
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [Phone] int  NOT NULL,
    [Passport] nvarchar(max)  NOT NULL,
    [JoinDate] datetime  NOT NULL,
    [Address] nvarchar(max)  NOT NULL,
    [DesignationID] int  NOT NULL
);
GO

-- Creating table 'Designations'
CREATE TABLE [dbo].[Designations] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Products'
CREATE TABLE [dbo].[Products] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [SerialNo] nvarchar(max)  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [MakeID] int  NOT NULL
);
GO

-- Creating table 'Inventories'
CREATE TABLE [dbo].[Inventories] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [StockLevel] int  NOT NULL
);
GO

-- Creating table 'Locations'
CREATE TABLE [dbo].[Locations] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'PanelShellGradeProtections'
CREATE TABLE [dbo].[PanelShellGradeProtections] (
    [IPNumber] int IDENTITY(1,1) NOT NULL,
    [DescriptionSolids] nvarchar(max)  NOT NULL,
    [DescriptionLiquids] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'SizeTypes'
CREATE TABLE [dbo].[SizeTypes] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Description] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Types'
CREATE TABLE [dbo].[Types] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Description] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Certifications'
CREATE TABLE [dbo].[Certifications] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Description] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Makes'
CREATE TABLE [dbo].[Makes] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'PaTypes'
CREATE TABLE [dbo].[PaTypes] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'CustomerOrders'
CREATE TABLE [dbo].[CustomerOrders] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [OrderDate] datetime  NOT NULL,
    [DeliveryDate] datetime  NOT NULL,
    [ContactID] int  NOT NULL
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
    [CompanyName] nvarchar(max)  NOT NULL,
    [Phone] int  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [Address] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'PurchaseOrders'
CREATE TABLE [dbo].[PurchaseOrders] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [PODate] datetime  NOT NULL,
    [ContactID] int  NOT NULL
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
    [Name] nvarchar(max)  NOT NULL,
    [DeliveyDate] datetime  NOT NULL,
    [Status] bit  NOT NULL,
    [CustomerOrderID] int  NOT NULL
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

-- Creating primary key on [IPNumber] in table 'PanelShellGradeProtections'
ALTER TABLE [dbo].[PanelShellGradeProtections]
ADD CONSTRAINT [PK_PanelShellGradeProtections]
    PRIMARY KEY CLUSTERED ([IPNumber] ASC);
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

-- Creating foreign key on [ID] in table 'Locations'
ALTER TABLE [dbo].[Locations]
ADD CONSTRAINT [FK_InventoryLocation]
    FOREIGN KEY ([ID])
    REFERENCES [dbo].[Inventories]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
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
        ([IPNumber])
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