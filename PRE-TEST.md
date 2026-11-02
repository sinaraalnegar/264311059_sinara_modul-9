Pre-Test
1.	Jelaskan secara singkat tujuan penggunaan klausa JOIN pada basis data relasional dan apa kelemahannya jika digunakan pada tabel dengan jutaan baris data!
Jawab : 
Tujuan utama penggunaan klausa JOIN dalam basis data relasional adalah untuk menggabungkan data dari dua tabel atau lebih yang saling berelasi ke dalam satu tampilan atau hasil query yang utuh. Kelemahan jika digunakan pada tabel dengan jutaan baris data adalah lonjakan beban CPU dan RAM (Memory Overhead), pemindaian tabel penuh, blokir jaringan dan transfer data berlebih.

2.	Apa yang dimaksud dengan redundansi data, dan mengapa dalam konsep "Denormalisasi" redundansi ini sengaja diciptakan?   
Jawab : 
Redundansi data adalah kondisi ketika data atau informasi yang sama disimpan di lebih dari satu tempat atau tabel dalam sebuah basis data. Redundansi sengaja diciptakan dalam denormalisasi karena mempercepat kinerja pembacaan, menyederhanakan kueri, ideal untuk sistem analitik. 

3.	Berikan satu contoh konkret bagaimana sebuah atribut turunan dapat menghindari penggunaan fungsi agregasi (seperti SUM) dalam query!  
Jawab : 
Contoh konkretnya adalah alih-alih menggunakan fungsi agregasi seperti SUM(total_harga) pada tabel transaksi setiap kali ingin menampilkan total belanja pelanggan, kita dapat membuat atribut turunan berupa kolom fisik bernama total_belanja langsung pada tabel pelanggan yang nilainya diperbarui secara otomatis setiap kali terjadi transaksi baru.

