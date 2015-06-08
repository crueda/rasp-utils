#!/usr/bin/env python
#-*- coding: UTF-8 -*-

# autor: Carlos Rueda
# fecha: 2013-12-14
# mail: carlos.rueda@deimos-space.com

import smtplib
 
SMTP_SERVER = 'smtp.gmail.com'
SMTP_PORT = 587
 
sender = 'crueda.casa@gmail.com'
password = '??'
recipient = 'crueda@gmail.com'
subject = 'Gmail SMTP Test'
body = 'blah blah blah'
 
body = "" + body + ""
 
headers = ["From: " + sender,
           "Subject: " + subject,
           "To: " + recipient,
           "MIME-Version: 1.0",
           "Content-Type: text/html"]
headers = "\r\n".join(headers)
 
session = smtplib.SMTP(SMTP_SERVER, SMTP_PORT)
 
session.ehlo()
session.starttls()
session.ehlo
session.login(sender, password)
 
session.sendmail(sender, recipient, headers + "\r\n\r\n" + body)
session.quit()