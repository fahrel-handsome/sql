CREATE DATABASE peminjaman_buku_perpustakaan

SHOW DATABASES;

USE Peminjaman_Buku_Perpustakaan

-- 1NF: Menghilangkan data yang terduplikasi dan membuat tabel sederhana
CREATE TABLE Mahasiswa (
    NIM VARCHAR(10) PRIMARY KEY,
    Nama_Mhs VARCHAR(50),
    Prodi VARCHAR(50)
);

INSERT INTO Mahasiswa (NIM, Nama_Mhs, Prodi) VALUES
('20230101', 'Andi R', 'Informatika'),
('20230102', 'Rina Lestari', 'SI');

SELECT * FROM Mahasiswa

CREATE TABLE Buku (
    Kode_Buku VARCHAR(5) PRIMARY KEY,
    Judul_Buku VARCHAR(50),
    Penulis VARCHAR(50)
);

INSERT INTO Buku (Kode_Buku, Judul_Buku, Penulis) VALUES
('BK01', 'Alpro', 'Rudi H'),
('BK02', 'Basdat', 'Tono W');

SELECT * FROM Buku

CREATE TABLE Peminjaman (
    Kode_Pinjam VARCHAR(5) PRIMARY KEY,
    Tgl_Pinjam DATE NOT NULL,
    Tgl_Kembali DATE NOT NULL,
    NIM VARCHAR(10),
    Kode_Buku VARCHAR(5),
    FOREIGN KEY (NIM) REFERENCES Mahasiswa(NIM),
    FOREIGN KEY (Kode_buku) REFERENCES Buku(Kode_buku)
);

INSERT INTO Peminjaman (Kode_Pinjam, Tgl_Pinjam, Tgl_Kembali, NIM, kode_buku) VALUES
('P001', '2025-03-01', '2025-03-10', '20230101','BK01'),
('P002', '2025-03-02', '2025-03-09', '20230101', 'BK02'),
('P003', '2025-03-02', '2025-03-12', '20230102', 'BK01');

SELECT * FROM Peminjaman

CREATE TABLE Detail_Peminjaman (
    Kode_Pinjam VARCHAR(5),
    Kode_Buku VARCHAR(5),
    PRIMARY KEY (Kode_Pinjam, Kode_Buku),
    FOREIGN KEY (Kode_Pinjam) REFERENCES Peminjaman(Kode_Pinjam),
    FOREIGN KEY (Kode_Buku) REFERENCES Buku(Kode_Buku)
);

INSERT INTO Detail_Peminjaman (Kode_Pinjam, Kode_Buku) VALUES
('P001', 'BK01'),
('P002', 'BK02'),
('P003', 'BK01');

SELECT * FROM Detail_Peminjaman

-- Query untuk menampilkan data lengkap peminjaman buku
SELECT
    pem.Kode_Pinjam,
    pem.Tgl_Pinjam,
    pem.Tgl_Kembali,
    mhs.Nama_Mhs,
    mhs.Prodi,
    bk.Judul_Buku,
    bk.Penulis,
    dp.Kode_Buku
FROM
    Peminjaman pem
JOIN
    Mahasiswa mhs ON pem.NIM = mhs.NIM
JOIN
    Detail_Peminjaman dp ON pem.Kode_Pinjam = dp.Kode_Pinjam
JOIN
    Buku bk ON dp.Kode_Buku = bk.Kode_Buku;