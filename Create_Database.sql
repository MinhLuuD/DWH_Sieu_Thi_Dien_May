CREATE DATABASE DWH_Sieu_Thi_Dien_May
GO

USE DWH_Sieu_Thi_Dien_May
GO

-- Bảng Cities
CREATE TABLE Cities (
    City_Id INT PRIMARY KEY IDENTITY(1,1),
    City_Name NVARCHAR(100)
);

-- Bảng Districts
CREATE TABLE Districts (
    District_Id INT PRIMARY KEY IDENTITY(1,1),
    District_Name NVARCHAR(100),
    City_Id INT
);

-- Bảng Wards
CREATE TABLE Wards (
    Ward_Id INT PRIMARY KEY IDENTITY(1,1),
    Ward_Name NVARCHAR(100),
    District_Id INT
);

-- Bảng Customers
CREATE TABLE Customers (
    Customer_Id NVARCHAR(50) PRIMARY KEY,
    Name NVARCHAR(100),
    Mobile NVARCHAR(20),
    Ward_Id INT,
    Address_customer NVARCHAR(200)
);

-- Bảng Banks
CREATE TABLE Banks (
    Bank_Id INT PRIMARY KEY IDENTITY(1,1),
    Bank_Name NVARCHAR(100)
);

-- Bảng Warehouses
CREATE TABLE Warehouses (
    Warehouse_Id INT PRIMARY KEY IDENTITY(1,1),
    Warehouse_Name NVARCHAR(100)
);

-- Bảng Staffs
CREATE TABLE Staffs (
    Staff_Id INT PRIMARY KEY IDENTITY(1,1),
    Staff_Name NVARCHAR(100)
);

-- Bảng Manufacturers
CREATE TABLE Manufacturers (
    Manufacturer_Id INT PRIMARY KEY IDENTITY(1,1),
    Manufacturer_Name NVARCHAR(100)
);

-- Bảng Industries
CREATE TABLE Industries (
    Industry_Id INT PRIMARY KEY IDENTITY(1,1),
    Industry_Name NVARCHAR(100),
    Manufacturer_Id INT
);

-- Bảng Products
CREATE TABLE Products (
    Product_Id NVARCHAR(50) PRIMARY KEY,
    Product_Name NVARCHAR(100),
    Product_Detail NVARCHAR(200),
    Model NVARCHAR(100),
    Industry_Id INT
);

-- Bảng Orders
CREATE TABLE Orders (
    Order_Id NVARCHAR(50) PRIMARY KEY ,
    Source_ NVARCHAR(100),
    Customer_Id NVARCHAR(50),
    Store_Id INT,
    Order_Date NVARCHAR(10),
    Receipt_Date NVARCHAR(10),
    Type_ NVARCHAR(50),
    DA_Sale NVARCHAR(50),
	Event_id INT,
    Bank_Id INT,
    Warehouse_Id INT,
    Total_Sale DECIMAL(18,2),
    Delivery NVARCHAR(50),
    Status_ NVARCHAR(50),
    Customer_Service NVARCHAR(100),
    Staff_Id INT
);

-- Bảng OrderDetails
CREATE TABLE OrderDetails (
    OrderDetail_Id INT PRIMARY KEY IDENTITY(1,1),
    Order_Id NVARCHAR(50),
    Product_Id NVARCHAR(50),
    Quantity INT,
    Price DECIMAL(18,2),
    Cost DECIMAL(18,2),
    Tax DECIMAL(18,2),
    Discount DECIMAL(18,2),
    Sale DECIMAL(18,2)
);

-- Bảng Stores
CREATE TABLE Stores (
    Store_Id INT PRIMARY KEY IDENTITY(1,1),
    Store_Name NVARCHAR(100)
);

-- Bảng Dates
CREATE TABLE Dates (
    Date_Id NVARCHAR(10) PRIMARY KEY,
    Date_ DATE,
    Year_ INT,
    Quarter_ NVARCHAR(10),
    Month_ INT,
    Day_ INT
);

-- Bảng Events
CREATE TABLE Events (
    Event_Id INT PRIMARY KEY IDENTITY(1,1),
    Event_Name NVARCHAR(100)
);


-- Districts -> Cities
ALTER TABLE Districts ADD CONSTRAINT FK_Districts_Cities FOREIGN KEY (City_Id) REFERENCES Cities(City_Id);

-- Wards -> Districts
ALTER TABLE Wards ADD CONSTRAINT FK_Wards_Districts FOREIGN KEY (District_Id) REFERENCES Districts(District_Id);

-- Customers -> Wards
ALTER TABLE Customers ADD CONSTRAINT FK_Customers_Wards FOREIGN KEY (Ward_Id) REFERENCES Wards(Ward_Id);

-- Industries -> Manufacturers
ALTER TABLE Industries ADD CONSTRAINT FK_Industries_Manufacturers FOREIGN KEY (Manufacturer_Id) REFERENCES Manufacturers(Manufacturer_Id);

-- Products -> Industries
ALTER TABLE Products ADD CONSTRAINT FK_Products_Industries FOREIGN KEY (Industry_Id) REFERENCES Industries(Industry_Id);

-- Orders -> Customers
ALTER TABLE Orders ADD CONSTRAINT FK_Orders_Customers FOREIGN KEY (Customer_Id) REFERENCES Customers(Customer_Id);

-- Orders -> Stores
ALTER TABLE Orders ADD CONSTRAINT FK_Orders_Stores FOREIGN KEY (Store_Id) REFERENCES Stores(Store_Id);

-- Orders -> Events
ALTER TABLE Orders ADD CONSTRAINT FK_Orders_Events FOREIGN KEY (Event_Id) REFERENCES Events(Event_Id);

-- Orders -> Banks
ALTER TABLE Orders ADD CONSTRAINT FK_Orders_Banks FOREIGN KEY (Bank_Id) REFERENCES Banks(Bank_Id);

-- Orders -> Warehouses
ALTER TABLE Orders ADD CONSTRAINT FK_Orders_Warehouses FOREIGN KEY (Warehouse_Id) REFERENCES Warehouses(Warehouse_Id);

-- Orders -> Staffs
ALTER TABLE Orders ADD CONSTRAINT FK_Orders_Staffs FOREIGN KEY (Staff_Id) REFERENCES Staffs(Staff_Id);

-- Orders -> Dates (Order_Date)
ALTER TABLE Orders ADD CONSTRAINT FK_Orders_OrderDate FOREIGN KEY (Order_Date) REFERENCES Dates(Date_Id);

-- Orders -> Dates (Receipt_Date)
ALTER TABLE Orders ADD CONSTRAINT FK_Orders_ReceiptDate FOREIGN KEY (Receipt_Date) REFERENCES Dates(Date_Id);

-- OrderDetails -> Orders
ALTER TABLE OrderDetails ADD CONSTRAINT FK_OrderDetails_Orders FOREIGN KEY (Order_Id) REFERENCES Orders(Order_Id);

-- OrderDetails -> Products
ALTER TABLE OrderDetails ADD CONSTRAINT FK_OrderDetails_Products FOREIGN KEY (Product_Id) REFERENCES Products(Product_Id);



