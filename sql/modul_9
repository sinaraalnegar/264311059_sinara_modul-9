-- 1.Menghitung total tempat/lokasi ramah lingkungan yang didaftarkan oleh setiap mitra
SELECT 
    u.user_id AS id_mitra,
    u.name AS nama_mitra,
    COUNT(l.lokasi_id) AS total_lokasi_terdaftar
FROM users u
JOIN lokasi l ON u.user_id = l.mitra_id
WHERE u.role = 'mitra'
GROUP BY u.user_id, u.name;

-- 2. A. Menambahkan atribut redundan (turunan) pada tabel master (users)
ALTER TABLE users 
ADD COLUMN total_lokasi_terdaftar INT DEFAULT 0;

-- B. Mengisi kolom turunan tersebut dengan data hasil agregasi dari tabel lokasi
UPDATE users u
SET total_lokasi_terdaftar = (
    SELECT COUNT(l.lokasi_id)
    FROM lokasi l
    WHERE l.mitra_id = u.user_id
);

-- 3. Query baca yang sangat cepat untuk fitur dasbor tanpa JOIN atau agregasi
SELECT 
    user_id AS id_mitra,
    name AS nama_mitra,
    total_lokasi_terdaftar
FROM users
WHERE role = 'mitra';
