# Hometask 8 — HTTPS on AWS EC2 (Automation via AWS CLI)

Author: Ilona Dembitska  
Course: DevOps  
Lab: Hometask #8  
Topic: Automated Apache + HTTPS configuration on EC2 using user-data  

##  Опис лабораторної

Мета роботи — автоматично розгорнути EC2 інстанс через AWS CLI та налаштувати на ньому:

- встановлення Apache2
- розгортання простого HTML-сайту
- генерацію self-signed TLS certificate
- налаштування HTTPS (port 443)
- редірект HTTP → HTTPS
- виконання всіх дій через user-data script

Вся конфігурація виконується автоматично під час старту інстанса.
## Як запустити лабораторну
bash run-instance.sh

Перевірка HTTPS
 1. Відкрити AWS → EC2 → Instances
 2. Скопіювати Public IPv4 address
 3. Відкрити у браузері:
  https://YOUR_PUBLIC_IP
