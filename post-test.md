1.	Lampirkan kedua script SQL kelompok Anda: (1) Query JOIN yang kompleks, dan (2) Script DDL pembentukan kolom/tabel denormalisasi beserta query panggilannya!
Jawab :

-- Menghitung total tempat/lokasi ramah lingkungan yang didaftarkan oleh setiap mitra
SELECT 
    u.user_id AS id_mitra,
    u.name AS nama_mitra,
    COUNT(l.lokasi_id) AS total_lokasi_terdaftar
FROM users u
JOIN lokasi l ON u.user_id = l.mitra_id
WHERE u.role = 'mitra'
GROUP BY u.user_id, u.name;

-- A. DDL: Menambahkan kolom atribut turunan (redudan) pada tabel master (users)
ALTER TABLE users 
ADD COLUMN total_lokasi_terdaftar INT DEFAULT 0;

-- B. Mengisi kolom turunan tersebut dengan data hasil agregasi dari tabel lokasi
UPDATE users u
SET total_lokasi_terdaftar = (
    SELECT COUNT(l.lokasi_id)
    FROM lokasi l
    WHERE l.mitra_id = u.user_id
);

-- C. Pembuktian: Query baca kilat (untuk dasbor) tanpa JOIN atau agregasi
SELECT 
    user_id AS id_mitra,
    name AS nama_mitra,
    total_lokasi_terdaftar
FROM users
WHERE role = 'mitra';

2.	 Berdasarkan percobaan kelompok Anda, jelaskan dengan bahasa sendiri kelebihan denormalisasi dalam memangkas penggunaan klausa JOIN pada sistem informasi!
   
Jawab: 
denormalisasi berfungsi menyatukan data yang terpecah ke dalam satu tabel sehingga sistem tidak perlu lagi memakai klausa JOIN yang lambat. Hasilnya, proses pembacaan data menjadi jauh lebih cepat, penulisan query lebih sederhana, dan beban kerja server berkurang drastis terutama saat diakses banyak pengguna.


3.	Jelaskan secara singkat, apa risiko utama terhadap data (contoh: inkonsistensi) yang muncul akibat kelompok Anda menambahkan atribut turunan atau tabel rekapitulasi tersebut?
Jawab: 
Risiko utama terhadap data akibat penerapan denormalisasi adalah potensi terjadinya inkonsistensi data. Risiko ini muncul karena nilai pada kolom turunan disimpan secara permanen, sehingga jika ada perubahan data asli pada tabel terkait (misalnya mitra menambah atau menghapus lokasi baru), nilai rekapitulasi pada tabel master tidak akan memperbarui dirinya sendiri secara otomatis kecuali dilakukan pembaruan manual atau menggunakan fungsi trigger. Akibatnya, data yang tampil di aplikasi bisa menjadi tidak sinkron atau berbeda dengan kondisi data aslinya.
