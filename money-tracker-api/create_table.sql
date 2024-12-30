CREATE TABLE records (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    name VARCHAR(25) NOT NULL,
    amount DOUBLE NOT NULL,
    date DATETIME NOT NULL,
    notes TEXT,
    is_masuk TINYINT(1) NOT NULL DEFAULT 0, -- 1 untuk Masuk, 0 untuk tidak
    is_keluar TINYINT(1) NOT NULL DEFAULT 0 -- 1 untuk Keluar, 0 untuk tidak
);
