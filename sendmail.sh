#!/usr/bin/env python
#-*- coding: UTF-8 -*-

# autor: Carlos Rueda
# fecha: 2014-02-14
# mail: carlos.rueda@deimos-space.com


import time
import smtplib
import os
import sys

SMTP_SERVER = 'smtp.gmail.com'
SMTP_PORT = 587
         
sender = 'crueda.casa@gmail.com'
password = '??'

recipient = sys.argv[1]
subject = sys.argv[2]
mybody = sys.argv[3]
         
body_text = "" + mybody + ""
         
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
session.sendmail(sender, recipient, headers + "\r\n\r\n" + body_text)
session.quit()   

#print "mail enviado"