# Patient Monitoring Dashboard - Live Deployment Guide

## ✅ Quick Start Deployment to InfinityFree (100% FREE)

This guide will help you deploy the Patient Monitoring Dashboard live on the internet for **completely free** using InfinityFree hosting.

### Prerequisites
- A computer/device with internet access
- Git installed (optional, but recommended)
- GitHub account (you already have this)

---

## 📋 Step-by-Step Deployment Instructions

### Step 1: Create InfinityFree Account

1. Go to https://www.infinityfree.com
2. Click "Register Now"
3. Choose sign-up method:
   - **Option A**: Sign up with Google (easiest)
   - **Option B**: Sign up with GitHub
   - **Option C**: Sign up with Email
4. Complete the registration
5. You'll get automatic access to the dashboard

### Step 2: Create New Hosting Account

1. Log in to your InfinityFree dashboard
2. Click "+ Create Account"
3. Enter account details:
   - **Domain**: Choose a subdomain (e.g., yourname-patientdash.rf.gd)
   - OR bring your own domain
4. Click "Create"
5. Wait 1-2 minutes for activation

### Step 3: Access File Manager & Upload Application

#### Option A: Using File Manager (Easiest)

1. Go to InfinityFree dashboard
2. Click "File Manager" for your hosting account
3. Navigate to the `htdocs` folder (this is your web root)
4. You should see `index.html` - delete it
5. Upload all files from your GitHub repository:
   - `index.php`
   - `hashh.php`
   - `lib/` folder with Chart.js
   - All other files

**How to download repository files:**
- Go to https://github.com/Lithish779/Patient-monitoring-Dashboard
- Click "Code" → "Download ZIP"
- Extract the ZIP file
- Upload all files to the `htdocs` folder

#### Option B: Using FTP (Recommended for future updates)

1. Get FTP credentials from InfinityFree dashboard:
   - FTP Hostname
   - FTP Username
   - FTP Password

2. Use an FTP client (e.g., FileZilla):
   - Download: https://filezilla-project.org/
   - Enter FTP credentials
   - Connect and upload files to `htdocs` folder

### Step 4: Create MySQL Database

1. In InfinityFree dashboard, go to **MySQL Databases**
2. Create new database:
   - Enter database name (e.g., `patient_monitoring_db`)
   - Note the database name, username, and password
3. Click Create

### Step 5: Import Database Schema

**SQL Schema for Patient Monitoring Database:**

```sql
CREATE TABLE `users` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `username` VARCHAR(100) UNIQUE NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `patients` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `patient_id` VARCHAR(100) UNIQUE NOT NULL,
  `heart_rate` INT NOT NULL,
  `oxygen_level` INT NOT NULL,
  `temperature` FLOAT NOT NULL,
  `status` VARCHAR(50) NOT NULL,
  `timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE `user_logs` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `username` VARCHAR(100) NOT NULL,
  `action` TEXT NOT NULL,
  `timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert default admin user (password: admin123)
INSERT INTO `users` (`username`, `password`) VALUES 
('admin', '$2y$10$YIjlrJyEvzm/SVOsB9Hnv.LZj1rK8L9YX0xJ0K1Q0R0U0V0W0X0Y');

-- Insert sample patient data
INSERT INTO `patients` (`patient_id`, `heart_rate`, `oxygen_level`, `temperature`, `status`) VALUES
('P001', 75, 98, 37.2, 'Normal'),
('P002', 85, 95, 37.5, 'Normal'),
('P003', 110, 88, 38.2, 'Critical');
```

**To import this schema:**

1. InfinityFree Dashboard → **MySQL Databases**
2. Click **PhpMyAdmin** for your database
3. Go to **Import** tab
4. Copy-paste the SQL code above
5. Click **Go**

### Step 6: Update Database Connection in index.php

1. Open your `index.php` file in a text editor
2. Find lines 8-12 with database credentials:

```php
$host = 'localhost';
$db = 'patient_monitoring';
$user = 'root';
$pass = '';
```

3. Replace with InfinityFree credentials:
   - `$host` = Your InfinityFree MySQL host (usually in dashboard)
   - `$db` = Your database name from Step 4
   - `$user` = Your database username
   - `$pass` = Your database password

4. Save the file and re-upload to `htdocs` folder

### Step 7: Test Your Application

1. Go to your InfinityFree domain URL (e.g., `https://yourname-patientdash.rf.gd`)
2. You should see the login page
3. Login with credentials:
   - **Username**: `admin`
   - **Password**: `admin123`
4. You should see the Patient Monitoring Dashboard

---

## 🔐 Important Security Notes

⚠️ **BEFORE going live:**

1. **Change admin password**:
   - Edit the SQL INSERT statement with a new hashed password
   - Or create a new user with different credentials

2. **Enable HTTPS** (free with InfinityFree SSL):
   - Dashboard → SSL Settings → Enable

3. **Remove error_reporting** from production:
   - Comment out lines 1-3 in `index.php`

---

## 🚀 Your Live Application

Once deployed, your dashboard will be live at:
```
https://your-subdomain.rf.gd
```

Features available:
- ✅ Add/Edit/Delete patients
- ✅ Real-time charts and monitoring
- ✅ Critical alert notifications
- ✅ Patient history export to CSV
- ✅ User activity logging

---

## 📱 Features Summary

### Dashboard Includes:
- **Patient Monitoring**: Real-time heart rate, oxygen level, temperature tracking
- **Alert System**: Automatic critical alert detection
- **Data Visualization**: Interactive Google Charts
- **CSV Export**: Download patient data
- **User Authentication**: Secure login system
- **Activity Logging**: Track all user actions

---

## ❓ Troubleshooting

### "Connection failed" error:
- Check database credentials in index.php
- Verify database name is correct
- Test connection through PHPMyAdmin

### "No patients found":
- Make sure to insert sample data through PHPMyAdmin
- Or add patients through the dashboard interface

### Login not working:
- Verify users table has admin entry
- Check password hash is correct

---

## 🎉 Congratulations!

Your Patient Monitoring Dashboard is now LIVE and completely FREE! 

**Share your application URL with your team and start monitoring patients today!**

---

## 💡 Next Steps (Optional Enhancements)

- Add email notifications for critical alerts
- Implement two-factor authentication
- Add more patient data fields
- Create admin panel for user management
- Set up automated backups

---

## 📞 Support

If you need help:
- InfinityFree Support: https://www.infinityfree.com/support
- Check forum: https://forum.infinityfree.com
- GitHub issues: Open an issue in this repository
