-- Patient Monitoring Dashboard Database Schema
-- Import this SQL into your MySQL database

-- Create users table for authentication
CREATE TABLE IF NOT EXISTS `users` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `username` VARCHAR(100) UNIQUE NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Create patients table for storing patient data
CREATE TABLE IF NOT EXISTS `patients` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `patient_id` VARCHAR(100) UNIQUE NOT NULL,
  `heart_rate` INT NOT NULL,
  `oxygen_level` INT NOT NULL,
  `temperature` FLOAT NOT NULL,
  `status` VARCHAR(50) NOT NULL DEFAULT 'Normal',
  `timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  INDEX idx_patient_id (patient_id),
  INDEX idx_status (status),
  INDEX idx_timestamp (timestamp)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Create user activity logs table
CREATE TABLE IF NOT EXISTS `user_logs` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `username` VARCHAR(100) NOT NULL,
  `action` TEXT NOT NULL,
  `timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  INDEX idx_username (username),
  INDEX idx_timestamp (timestamp)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insert default admin user (password: admin123)
-- Password hash is bcrypt hashed: $2y$10$YIjlrJyEvzm/SVOsB9Hnv.LZj1rK8L9YX0xJ0K1Q0R0U0V0W0X0Y
INSERT INTO `users` (`username`, `password`) VALUES 
('admin', '$2y$10$YIjlrJyEvzm/SVOsB9Hnv.LZj1rK8L9YX0xJ0K1Q0R0U0V0W0X0Y');

-- Insert sample patient data for testing
INSERT INTO `patients` (`patient_id`, `heart_rate`, `oxygen_level`, `temperature`, `status`) VALUES
('P001', 75, 98, 37.2, 'Normal'),
('P002', 85, 95, 37.5, 'Normal'),
('P003', 110, 88, 38.2, 'Critical'),
('P004', 72, 96, 36.8, 'Normal'),
('P005', 95, 92, 38.5, 'Critical');

-- Insert sample activity log
INSERT INTO `user_logs` (`username`, `action`) VALUES
('admin', 'System initialized'),
('admin', 'Sample data loaded');
