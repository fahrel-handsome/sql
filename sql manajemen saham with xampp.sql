
-- MEMBUAT DATABASE
CREATE DATABASE Manajemen_Saham;
use Manajemen_Saham

-- MEMBUAT TABEL INVESTOR
CREATE TABLE Investor (
    InvestorID INT PRIMARY KEY,
    Nama VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL
);
-- MEMBUAT TABEL SAHAM
CREATE TABLE Saham (
    SahamID INT PRIMARY KEY,
    Kode_Saham VARCHAR(10) UNIQUE NOT NULL,
    Nama_Perusahaan VARCHAR(100) NOT NULL
);
-- MEMBUAT TABEL TRANSAKSI
CREATE TABLE Transaksi (
    TransaksiID INT PRIMARY KEY,
    InvestorID INT,
    SahamID INT,
    FOREIGN KEY (InvestorID) REFERENCES Investor(InvestorID),
    FOREIGN KEY (SahamID) REFERENCES Saham(SahamID)
);
-- MEMBUAT TABEL PORTOFOLIO
CREATE TABLE Portofolio (
    PortofolioID INT PRIMARY KEY,
    InvestorID INT,
    SahamID INT,
    Jumlah_Lot INT,
    FOREIGN KEY (InvestorID) REFERENCES Investor(InvestorID) ON DELETE CASCADE,
    FOREIGN KEY (SahamID) REFERENCES Saham(SahamID) ON DELETE CASCADE
);

--MEMASUKKAN DATA KE TABEL
INSERT INTO Investor (InvestorID, Nama, Email) VALUES
(1, 'Fahrel', 'fahrel@gmail.com'),
(2, 'Ilham', 'ilham@gmail.com'),
(3, 'Jaya', 'Jaya@gmail.com'),
(4, 'Kusuma', 'Kusuma@gmail.com'),
(5, 'Asep', 'Asep@gmail.com');

INSERT INTO Saham (SahamID, Kode_Saham, Nama_Perusahaan) VALUES
(44, 'BBCA', 'Bank Central Asia'),
(55, 'BBRI', 'Bank Rakyat Indonesia'),
(66, 'ASII', 'Astra Internasional'),
(77, 'TLKM', 'Telkom Indonesia'),
(88, 'BREN', 'Barito Pacifik');

INSERT INTO Transaksi (TransaksiID, InvestorID, SahamID) VALUES
(222, 1, 44),
(333, 2, 55),
(444, 3, 66),
(555, 4, 77),
(666, 5, 88);

INSERT INTO Portofolio (PortofolioID, InvestorID, SahamID, Jumlah_Lot) VALUES
(101, 1, 44, 200),
(102, 2, 55, 1000),
(103, 3, 66, 250),
(104, 4, 77, 99),
(105, 5, 88, 800);

-- Melihat semua data dari setiap tabel
SELECT * FROM Investor;
SELECT * FROM Saham;
SELECT * FROM Transaksi;
SELECT * FROM Portofolio;

-- Melihat transaksi saham dengan informasi investor dan saham yang dibeli
SELECT 
    Transaksi.TransaksiID, Investor.Nama AS Nama_Investor, 
    Saham.Kode_Saham, Saham.Nama_Perusahaan
FROM Transaksi
JOIN Investor ON Transaksi.InvestorID = Investor.InvestorID
JOIN Saham ON Transaksi.SahamID = Saham.SahamID;

-- Melihat struktur masing-masing tabel
DESC Investor;
DESC Saham;
DESC Transaksi;
DESC Portofolio;

-- Melihat daftar tabel dalam database
show tables;