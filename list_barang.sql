use list_barang;

show databases;

create table jenis_barang (
    jenis_brg varchar(50) primary KEY
);

insert into jenis_barang (jenis_brg) VALUES
('furniture'),
('ATK'),
('jaringan');

create table barang (
    kode_brg varchar(10) primary key,
    nama_brg varchar(50),
    jenis_brg varchar(50),
    foreign key (jenis_brg) references jenis_barang(jenis_brg)
);

insert into barang (kode_brg, nama_brg, jenis_brg) VALUES
('BRG_01', 'meja', 'furniture'),
('BRG_02', 'kursi', 'furniture'),
('BRG_03', 'meja kecil', 'furniture'),
('BRG_04', 'bolpoin','ATK'),
('BRG_05', 'HVS A4', 'ATK'),
('BRG_06', 'Paper clip', 'ATK'),
('BRG_07', 'router', 'jaringan'),
('BRG_08', 'LAN', 'jaringan'),
('BRG_09', 'RJ45', 'jaringan');

create table detail_barang (
    jenis_brg VARCHAR(50),
    kode_brg varchar(10),
    qty_brg INT,
    tgl_input_brg DATE,
    desc_brg varchar(100),
    foreign key (jenis_brg) references jenis_barang(jenis_brg),
    foreign key (kode_brg) references barang(kode_brg)
);

INSERT INTO Detail_Barang (jenis_brg, kode_brg, qty_brg, tgl_input_brg, desc_brg) VALUES
('Furniture', 'BRG_01', 40, '2022-04-20', 'Meja Gedung 1'),
('Furniture', 'BRG_02', 80, '2022-04-20', 'Kursi gedung 1'),
('Furniture', 'BRG_03', 12, '2022-04-22', 'Meja Ruangan'),
('ATK',       'BRG_04', 200, '2022-07-04', 'Alat Tulis Gedung 1'),
('ATK',       'BRG_05', 14, '2022-07-04', 'Alat Tulis Gedung 1'),
('ATK',       'BRG_06', 1000, '2022-07-04', 'Alat Tulis Gedung 1'),
('Jaringan',  'BRG_07', 1, '2022-07-10', 'Alat Jaringan Gdg 1'),
('Jaringan',  'BRG_08', 2, '2022-07-11', 'Alat Jaringan Gdg 1'),
('Jaringan',  'BRG_09', 10, '2022-07-11', 'Alat Jaringan Gdg 1');

SELECT
    db.kode_brg,
    b.nama_brg,
    db.jenis_brg,
    db.qty_brg,
    db.tgl_input_brg,
    db.DESC_brg
FROM
    detail_barang db
JOIN
    barang b on db.kode_brg = b.kode_brg
JOIN
    jenis_barang jb on db.jenis_brg = jb.jenis_brg;
