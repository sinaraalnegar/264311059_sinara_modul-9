**1. Lampirkan kedua script SQL kelompok Anda: (1) Query JOIN yang kompleks, dan (2) Script DDL pembentukan kolom/tabel denormalisasi beserta query panggilannya!**
Jawab : 

'''sql
-- Menghitung total tempat/lokasi ramah lingkungan yang didaftarkan oleh setiap mitra
SELECT 
    u.user_id AS id_mitra,
    u.name AS nama_mitra,
    COUNT(l.lokasi_id) AS total_lokasi_terdaftar
FROM users u
JOIN lokasi l ON u.user_id = l.mitra_id
WHERE u.role = 'mitra'
GROUP BY u.user_id, u.name;
