CREATE DATABASE ecommerce;
##"สร้างDatabase"

CREATE TABLE products(
	product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price DECIMAL (10,2) NOT NULL,
    stock INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
##"สร้างตาราง"

หรือกด New+ และ สร้างตารางได้เหมือนกัน

INSERT INTO products(name, price, stock) VALUES
('Laptop', 1200.50, 10),
('mouse', 25.99, 50),
('keyboard', 45.00, 30);
##"ใส่ข้อมูล"

ALTER TABLE products ADD description TEXT;
##"สร้างใหม่"
ALTER TABLE products CHANGE description somthing TEXT;
##"เปลี่ยน"
ALTER TABLE products DROP description;
##"ลบ"

INSERT INTO `1.	devices` (`device_id`, `device_name`, `ip_address`, `device_type`, `status`) VALUES ('1001', 'เครือข่าย', '202.158.112.21', 'เร้าเตอร์', 'ออนไลน์');ฃ
##"เพิ่มข้อมูลลงไปในตาราง"

In terminal
cd\ (ออกไปไดร์c)
cd XAMPP (เข้าโฟเดอร์XAMPP)
cd MYSQL (เข้าโฟเดอร์ MYSQL)
cd BIN (เข้าโฟเดอร์BIN)
.\MYSQLDUMP -u ROOT -p ecommerce > c:\xampp\htdocs\ecommerce_backup.sql (สร้าง Backup เข้าไปใน )

SELECT * FROM `devices` WHERE status IN ('ออฟไลน์', 'ซ่อมแซม');
##"แสดงผลตารางตามเงื่อนไข"

SELECT 
    d.device_name AS 'ชื่ออุปกรณ์', 
    d.ip_address AS 'IP Address', 
    a.alert_type AS 'ประเภทการแจ้งเตือน', 
    a.created_at AS 'เวลาที่เกิดการแจ้งเตือน'
##"ตอนนี้เลือกคอลั้มที่เราต้องการจะให้แสดงข้อมุล โดยมี d. a. คือตัวบอกว่ามาจากต่างตาราง และ AS คือจะให้แสดงผลในตาราง"
FROM alerts a
##"จากตาราง a"
JOIN devices d ON a.device_id = d.device_id
##"รวมกับตาราง d โดย เชื่อโดย device_id ของ ตาราง a และ d"
WHERE a.severity IN ('Critical', 'High')
##"กำหนดเงื่อนไข"
ORDER BY a.created_at DESC;
##"เงื่อนไขการแสดงตามลำดับ"

SELECT 
    d.device_name AS 'ชื่ออุปกรณ์',
    AVG(t.cpu_usage) AS 'ค่าเฉลี่ย CPU',
##"ใช้ AVG ในการหาค่าเฉลี่ยของ t.cpu_usage และให้เป็นตารางค่าเฉลี่ย CPU"
    SUM(t.bytes_sent + t.bytes_received) AS 'ปริมาณรับ-ส่งข้อมูลรวม'
##"ใช้ SUM ในการหาค่าผลรวมของ t.bytes_sent + t.bytes_received และให้เป็นตารางปริมาณรับ-ส่งข้อมูลรวม CPU"
FROM traffic_logs t
JOIN devices d ON t.device_id = d.device_id
GROUP BY d.device_id;
##"ให้ GROUP BY เพื่อแบ่งกลุ่มตามคอลั้มที่ใส่ด้านหลัง ในที่นี้คือd.device_id เพราะต้องการให้แยกออกเป็นแต่ละรยการ ใช้d.device_idเพราะค่าไม่ซ้ำกัน และทำให้GROUP BY GROUP อย่างละอัน ทำให้ค่าแยกกันอย่างละรายการ"
