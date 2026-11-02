-- 1. Tabel Users (Pengguna & Mitra)
CREATE TABLE users (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(150) NOT NULL,
  email VARCHAR(150) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  role ENUM('admin','mitra','masyarakat') NOT NULL DEFAULT 'masyarakat',
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- 2. Tabel Kategori Lokasi
CREATE TABLE kategori_lokasi (
  kategori_id INT AUTO_INCREMENT PRIMARY KEY,
  nama_kategori VARCHAR(100) NOT NULL UNIQUE,
  deskripsi TEXT
);

-- 3. Tabel Lokasi Ramah Lingkungan
CREATE TABLE lokasi (
  lokasi_id INT AUTO_INCREMENT PRIMARY KEY,
  kategori_id INT NOT NULL,
  mitra_id INT NOT NULL,
  nama_tempat VARCHAR(150) NOT NULL,
  alamat TEXT NOT NULL,
  latitude DECIMAL(10,8) NOT NULL,
  longitude DECIMAL(11,8) NOT NULL,
  jam_operasional VARCHAR(100) DEFAULT NULL,
  deskripsi TEXT,
  status_validasi ENUM('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (kategori_id) REFERENCES kategori_lokasi(kategori_id) ON UPDATE CASCADE,
  FOREIGN KEY (mitra_id) REFERENCES users(user_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- 4. Tabel Konten Edukasi
CREATE TABLE konten_edukasi (
  edukasi_id INT AUTO_INCREMENT PRIMARY KEY,
  admin_id INT NOT NULL,
  judul VARCHAR(200) NOT NULL,
  isi_konten TEXT NOT NULL,
  kategori_edukasi VARCHAR(100) NOT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (admin_id) REFERENCES users(user_id) ON DELETE CASCADE ON UPDATE CASCADE
);


-- ==========================================
-- DATA DUMMY (DML)
-- ==========================================

-- Data Dummy Users
INSERT INTO users (user_id, name, email, password, role) VALUES
(1, 'Admin Utama EcoMap', 'admin@ecomap.madiun.go.id', '$2y$10$e8R4a...', 'admin'),
(2, 'Bank Sampah Sekar Asri', 'mitra1@sekarasri.org', '$2y$10$f9T1z...', 'mitra'),
(3, 'Madiun Thrift Center', 'mitra2@thriftmadiun.com', '$2y$10$g0U2a...', 'mitra');

-- Data Dummy Kategori Lokasi
INSERT INTO kategori_lokasi (kategori_id, nama_kategori, deskripsi) VALUES
(1, 'Bank Sampah', 'Fasilitas pemilahan dan daur ulang sampah warga'),
(2, 'Thrift Shop', 'Toko pakaian bekas berkualitas untuk mendukung pemakaian ulang'),
(3, 'Usaha Zero Waste', 'Toko bahan pokok tanpa kemasan plastik sekali pakai');

-- Data Dummy Lokasi
INSERT INTO lokasi (lokasi_id, kategori_id, mitra_id, nama_tempat, alamat, latitude, longitude, jam_operasional, deskripsi, status_validasi) VALUES
(1, 1, 2, 'Bank Sampah Sekar Asri Winongo', 'Jl. Ring Road Barat No. 12, Winongo, Madiun', -7.62810000, 111.51230000, '08:00 - 15:00 WIB', 'Pusat daur ulang sampah organik dan anorganik.', 'approved'),
(2, 2, 3, 'Madiun Thrift Store Centre', 'Jl. Pahlawan No. 45, Kartoharjo, Madiun', -7.62540000, 111.52340000, '10:00 - 21:00 WIB', 'Pusat pakaian bekas layak pakai.', 'approved');

-- Data Dummy Konten Edukasi
INSERT INTO konten_edukasi (edukasi_id, admin_id, judul, isi_konten, kategori_edukasi) VALUES
(1, 1, 'Cara Memilah Sampah Organik di Rumah', 'Langkah awal membuat kompos sederhana dari sisa makanan...', 'Pengelolaan Sampah');
