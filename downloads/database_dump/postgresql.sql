create table pegawai ( id serial primary key, rfid_pegawai varchar(30),nama_pegawai varchar(50) );

insert into pegawai(rfid_pegawai, nama_pegawai) values ('0014832825', 'razi');
insert into pegawai(rfid_pegawai, nama_pegawai) values ('0014832822', 'santi');
insert into pegawai(rfid_pegawai, nama_pegawai) values ('0014532811', 'budi');
insert into pegawai(rfid_pegawai, nama_pegawai) values ('0017732811', 'ani');
insert into pegawai(rfid_pegawai, nama_pegawai) values ('0014832811', 'susi');
insert into pegawai(rfid_pegawai, nama_pegawai) values ('0018832811', 'anton');
insert into pegawai(rfid_pegawai, nama_pegawai) values ('0014800811', 'nana');

CREATE TABLE users (id serial primary key, username varchar(100), user_level varchar(80), password varchar(255));
insert into users(username, user_level, password) values ('andi', 'pegawai', '123');
insert into users(username, user_level, password) values ('susi', 'kasir', '123456');
insert into users(username, user_level, password) values ('budi', 'kasir', '1256');


CREATE TABLE rfid (id serial primary key, rfid varchar(100), nama varchar(80) );
insert into rfid(rfid, nama) values ('0014832825', 'razi');
insert into rfid(rfid, nama) values ('0014222825', 'budi');
insert into rfid(rfid, nama) values ('0014442825', 'susi');


-- CREATE TABLE kasir (
--     id serial primary key, 
--     nik varchar(100), 
--     nama varchar(80), 
--     hp varchar(15), 
--     alamat varchar(255), 
--     jm_masuk varchar(10), 
--     jm_keluar varchar(10),حقهىف
--     no_pos varchar(10)
-- )

CREATE TABLE kasir ( id serial primary key, nik varchar(100), nama varchar(80), hp varchar(15), alamat varchar(255), jm_masuk varchar(10), jm_keluar varchar(10), no_pos varchar(10) );
insert into kasir (nik, nama, hp, alamat, jm_masuk, jm_keluar, no_pos) values ('111223344', 'susi', '085263636', 'darussalam', '08:00', '12:00', '1');insert into kasir (nik, nama, hp, alamat, jm_masuk, jm_keluar, no_pos) values ('1144523344', 'budi', '0852636234', 'darussalam', '12:00', '18:00', '1');
ALTER TABLE kasir add column shift varchar(30);
ALTER TABLE kasir add column roller_stat BOOLEAN NOT NULL DEFAULT TRUE;


CREATE TABLE gate ( id serial primary key, no_pos varchar(10), tipe_pos varchar(30), jns_kendaraan varchar(50), ip_cam varchar(60) );
insert into gate (no_pos, tipe_pos, jns_kendaraan, ip_cam) values ('1', 'masuk', 'motor', '192.168.100.10#192.168.100.12');
insert into gate (no_pos, tipe_pos, jns_kendaraan, ip_cam) values ('1', 'keluar', 'motor', '192.168.100.16#192.168.100.18');

CREATE TABLE tarif ( id serial primary key, tarif_dasar integer, tarif_max integer, rules TEXT DEFAULT '', jns_kendaraan varchar(50) );

insert into tarif (tarif_dasar, jns_kendaraan) values (1000, 'motor');
insert into tarif (tarif_dasar, jns_kendaraan) values (2000, 'mobil');

insert into tarif (id, rules, jns_kendaraan, toleransi, tipe_tarif, base_rules, denda) 
values (2, 
'{"0" : "1000", "4":"1500", "10":"1500", "16":"1500", "24":"5500"}',
'motor',
10,
'other',
'{"0" : "1000", "4":"1500", "6":"1500", "24":"5500"}',
0
);

insert into tarif (id, rules, jns_kendaraan, toleransi, tipe_tarif, base_rules, denda) 
values (2, 
'{"0" : "2000", "4":"1000", "10":"1000", "16":"1000", "24":"6000"}',
'mobil',
10,
'other',
'{"0" : "2000", "4":"1000", "6":"1000", "24":"6000"}',
0
);

ALTER TABLE tarif add column tipe_tarif varchar(20);
ALTER TABLE tarif add column denda integer default 0;
ALTER TABLE tarif add column base_rules TEXT;

update tarif set base_rules='{"2" : "1000", "4":"1000", "6":"1000", "24":"5000"}' where id=1;
update tarif set base_rules='{"2" : "2000", "4":"1000", "6":"1000", "24":"6000"}' where id=2;

ALTER TABLE tarif drop column tarif_dasar;
ALTER TABLE tarif drop column tarif_max;
ALTER TABLE tarif drop column waktu_max;

-- 05012023 091305 993320
-- CREATE TABLE clients_socket ( id integer NOT NULL, ip character varying(20) NOT NULL, port integer NOT NULL );
CREATE TABLE clients_socket ( id serial primary key, ip character varying(20) NOT NULL, port integer NOT NULL );


-- id|barcode|date_time|gate|images_path 
create table pegawai ( id serial primary key, rfid_pegawai varchar(30),nama_pegawai varchar(50) );
CREATE TABLE karcis ( id serial primary key, barcode varchar(150), datetime timestamp(6) with time zone, gate varchar(20), images_path varchar(255), status_parkir BOOLEAN NOT NULL DEFAULT FALSE, jenis_kendaraan varchar(30), ip_raspi varchar(25) );
ALTER TABLE karcis ADD COLUMN images_path_keluar VARCHAR(255); ALTER TABLE karcis ALTER COLUMN images_path_keluar SET AFTER images_path;


ALTER TABLE karcis ALTER COLUMN date_keluar set DEFAULT '';
ALTER TABLE karcis add column date_keluar timestamp without time zone;
ALTER TABLE karcis add column lost_ticket BOOLEAN NOT NULL DEFAULT FALSE;

ALTER TABLE karcis add column lama_parkir interval;ALTER TABLE karcis add column tarif integer;ALTER TABLE karcis add column nopol varchar(60);ALTER TABLE karcis add column kd_shift varchar(20);ALTER TABLE karcis add column jns_transaksi varchar(60);

ALTER TABLE karcis drop column tarif;
ALTER TABLE karcis drop column nopol;
ALTER TABLE karcis drop column kd_shift;
ALTER TABLE karcis drop column jns_transaksi;

update karcis set lama_parkir=300 where id=5;

update karcis set lama_parkir='1 Hours' where id=2; update karcis set lama_parkir='20 Minutes' where id=3; update karcis set lama_parkir='2 Hours 5 Minutes' where id=4;



insert into karcis (datetime) values(to_timestamp(1672912953.570569));
insert into karcis (barcode, datetime, gate, jenis_kendaraan) values ('3127192', '2023-02-05 15:02:12', '2', 'mobil');

update karcis set date_keluar='2023-02-05 15:20:12', status_parkir=true, tarif=4000, nopol='BL 1123', kd_shift='s1' where id=1;  update karcis set date_keluar='2023-03-05 15:53:39', status_parkir=true, tarif=4000, nopol='BL 1123', kd_shift='s1' where id=2; update karcis set date_keluar='2023-02-05 15:59:00', status_parkir=true, tarif=4000, nopol='BL 1123', kd_shift='s1' where id=3;update karcis set date_keluar='2023-02-05 17:57:44', status_parkir=true, tarif=4000, nopol='BL 1123', kd_shift='s1' where id=4;  update karcis set date_keluar='2023-02-05 18:00:41', status_parkir=true, tarif=4000, nopol='BL 1123', kd_shift='s1' where id=5;  update karcis set date_keluar='2023-02-05 18:20:05', status_parkir=true, tarif=4000, nopol='BL 1123', kd_shift='s1' where id=6;  update karcis set date_keluar='2023-02-05 18:50:21', status_parkir=true, tarif=4000, nopol='BL 1123', kd_shift='s1' where id=7;  

CREATE TABLE tes ( id serial primary key, barcode varchar(150), datetime timestamp(6) with time zone, gate varchar(20), images_path varchar(255), jns_kendaraan varchar(20) );
insert into tes (barcode, datetime, gate, jns_kendaraan) values ('12313123', '2023-02-05 15:02:12', '1', 'motor');

CREATE TABLE voucher ( id serial primary key, id_pel varchar(30), lokasi varchar(255), tarif serial, masa_berlaku date, jns_kendaraan varchar(20) );
CREATE TABLE laporan_users ( id serial primary key, barcode varchar(30), ket varchar(255) );



select id, barcode,  nopol, jenis_kendaraan, gate, datetime, date_keluar, lama_parkir, status_parkir, tarif, jns_transaksi, kd_shift from karcis where  cast( datetime as date ) between '2023-3-1' and '2023-4-24'  limit 18 OFFSET 0;

select id, datetime, date_keluar from karcis where cast( datetime as date ) between '2023-2-6' and '2023-2-7' or cast( date_keluar as date ) between '2023-3-1' and '2023-3-20';



jika yg dipilih status_parkir = masuk ==> false,maka range tanggal hanya berlaku utk column datetime 
jika yg dipilih status_parkir = keluar ==> true,maka range tanggal hanya berlaku utk column date_keluar 
jika yg dipilih status_parkir = semua kondisi ==> true or false, maka range tanggal yg berlaku adalah column datetime dan column date_keluar 
filter range tanggal harus pakai tanda kurung ==> () jika ada kombinasi ==> OR filter 

select id, barcode,  nopol, jenis_kendaraan, gate, datetime, date_keluar, lama_parkir, status_parkir, tarif, jns_transaksi, kd_shift from karcis where  (cast( datetime as date ) between '2022-12-1' and '2023-4-25' or cast( date_keluar as date ) between '2022-12-1' and '2023-4-25') and barcode like '%609%' and status_parkir=true;
select * from karcis where cast( datetime as date ) between '2022-12-1' and '2023-4-25' and barcode like '%609%';


select id, barcode,  nopol, jenis_kendaraan, gate, datetime, date_keluar, lama_parkir, status_parkir, tarif, jns_transaksi, kd_shift from karcis where cast( date_keluar as date ) between '2023-1-2' and '2023-4-25' and barcode like '%609%' or CAST( tarif as TEXT ) like '%609%' ;
select id, barcode,  nopol, jenis_kendaraan, gate, datetime, date_keluar, lama_parkir, status_parkir, tarif, jns_transaksi, kd_shift from karcis where cast( date_keluar as date ) between '2023-1-2' and '2023-4-25' and barcode like '%609%' or CAST( tarif as TEXT ) like '%609%' or nopol like '%609%' limit 18 OFFSET 0;
select id, barcode,  nopol, jenis_kendaraan, gate, datetime, date_keluar, lama_parkir, status_parkir, tarif, jns_transaksi, kd_shift from karcis where cast( datetime as date ) between '2023-1-2' and '2023-4-25' and status_parkir=false and barcode like '%609%' or CAST( tarif as TEXT ) like '%609%' or nopol like '%609%' limit 18 OFFSET 0;

select id, barcode,  nopol, jenis_kendaraan, gate, datetime, date_keluar, lama_parkir, status_parkir, tarif, jns_transaksi, kd_shift from karcis where cast( datetime as date ) between '2023-1-2' and '2023-4-25' and barcode like '%609%' or CAST( tarif as TEXT ) like '%609%' or nopol like '%609%' limit 18 OFFSET 0;
select id, barcode,  nopol, jenis_kendaraan, gate, datetime, date_keluar, lama_parkir, status_parkir, tarif, jns_transaksi, kd_shift from karcis where cast( date_keluar as date ) between '2023-1-2' and '2023-4-25' and barcode like '%609%' or CAST( tarif as TEXT ) like '%609%' or nopol like '%609%' limit 18 OFFSET 0;

select id, barcode,  nopol, jenis_kendaraan, gate, datetime, date_keluar, lama_parkir, status_parkir, tarif, jns_transaksi, kd_shift from karcis where cast( date_keluar as date ) between '2023-1-2' and '2023-4-25' and jns_transaksi='casual' and barcode like '%609%' or CAST( tarif as TEXT ) like '%609%' or nopol like '%609%' limit 18 OFFSET 0;

select id, barcode,  nopol, jenis_kendaraan, gate, datetime, date_keluar, lama_parkir, status_parkir, tarif, jns_transaksi, kd_shift from karcis where cast( date_keluar as date ) between '2023-1-2' and '2023-4-25' and jenis_kendaraan='motor' and barcode like '%609%' or CAST( tarif as TEXT ) like '%609%' or nopol like '%609%' limit 18 OFFSET 0;

select * from karcis where  cast( datetime as date ) between '2023-01-01' and '2023-04-27';

-- select id, barcode, nopol, jenis_kendaraan, gate, cast(datetime as date), cast(date_keluar as date), lama_parkir, status_parkir, tarif, jns_transaksi, kd_shift f, tarif, jns_transaksi, kd_shift from karcis where   ( cast( datetime as date ) between '2023-01-01' and '2023-04-27' or cast( date-01' and '2023-04-27' ) order by i_keluar as date ) between '2023-01-01' and '2023-04-27' ) order by id;
select id, barcode, nopol, jenis_kendaraan, gate, cast(datetime as date), cast(date_keluar as date), lama_parkir, status_parkir, tarif, jns_transaksi, kd_shift from karcis where   ( cast( datetime as date ) between '2023-01-01' and '2023-04-27' or cast( date_keluar as date ) between '2023-01-01' and '2023-04-27' ) order by id
select id, barcode, nopol, jenis_kendaraan, gate, cast(datetime as date), cast(date_keluar as date), lama_parkir, status_parkir, tarif, jns_transaksi, kd_shift from karcis where   ( cast( datetime as date ) between '2023-01-01' and '2023-04-27' or cast( date_keluar as date ) between '2023-01-01' and '2023-04-27' ) order by id;
select id, barcode, nopol, jenis_kendaraan, gate, cast(datetime as date), cast(date_keluar as date), lama_parkir, status_parkir, tarif, jns_transaksi, kd_shift f, tarif, jns_transaksi, kd_shift from karcis where   ( cast( datetime as date ) between '2023-01-01' and '2023-04-27');


select cast(EXTRACT(epoch FROM lama_parkir) as integer) AS interval_seconds from karcis where id=1;
SELECT * FROM karcis WHERE EXTRACT(epoch FROM lama_parkir) BETWEEN 1200 AND 10800;

0 sampai <1jam
toleransi_waktu sampai < 1jam
600 
select count(*) as jum , SUM(tarif) as total from karcis where CAST(date_keluar as date) between '2023-02-01' and '2023-02-28' and cast(EXTRACT(epoch FROM lama_parkir) as integer) >= 600 and cast(EXTRACT(epoch FROM lama_parkir) as integer) < 3600;
select * from karcis where cast(EXTRACT(epoch FROM lama_parkir) as integer)=3600; 

select * from karcis where CAST(date_keluar as date) 
between '2023-02-01' and '2023-02-28' 
and cast(EXTRACT(epoch FROM lama_parkir) as integer) >= 600 
and cast(EXTRACT(epoch FROM lama_parkir) as integer) < 3600
and status_parkir=true
and jenis_kendaraan='mobil';

insert into karcis (barcode, jenis_kendaraan,  nopol, date_keluar, tarif, lost_ticket) values ('000', 'mobil', 'BL 3345', '2023-02-05 15:02:12', 20000, true );