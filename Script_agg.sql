SELECT
    tanggal,
    case when extract (month from tanggal) = 1 then 'Januari'
    	 when extract (month from tanggal) = 2 then 'Februari'
    	 when extract (month from tanggal) = 3 then 'Maret'
    	 when extract (month from tanggal) = 4 then 'April'
    	 when extract (month from tanggal) = 5 then 'Mei'
    	 when extract (month from tanggal) = 6 then 'Juni' end
    AS bulan,        
    id_invoice,
    cabang_sales AS lokasi_cabang,
    nama AS pelanggan,
    nama_barang AS produk,
    lini AS merek,
    jumlah_barang AS jumlah_produk_terjual,
    harga AS harga_satuan,
    (jumlah_barang * harga) AS total_pendapatan
into tabel_aggregat
FROM base_table
ORDER BY 1, 4, 5, 6, 7, 8, 9, 10

;

explain analyze
select * from tabel_aggregat where tanggal = '2022-01-20' ;

create index idx_tabel_aggregat
on tabel_aggregat(tanggal)
