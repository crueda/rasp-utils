#!/usr/bin/env python
#-*- coding: UTF-8 -*-

# autor: Carlos Rueda
# fecha: 2014-02-24
# mail: carlos.rueda@deimos-space.com

#!/usr/bin/python
import time
import smtplib
from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler


class MyHandler(FileSystemEventHandler):

    def on_modified(self, event):

        SMTP_SERVER = 'smtp.gmail.com'
        SMTP_PORT = 587
         
        sender = 'crueda.casa@gmail.com'
        password = '??'
        recipient = 'crueda@gmail.com'
        subject = 'Alerta de WEBCAM'
        body = 'Evento lanzado'
         
        body = "" + body + ""
         
        headers = ["From: " + sender,
                   "Subject: " + subject,
                   "To: " + recipient,
                   "MIME-Version: 1.0",
                   "Content-Type: text/html"]
        headers = "\r\n".join(headers)

        print "Cambio detectado en el directorio -> enviar email"
        hora_actual = time.strftime("20%y %m %d - %H %M %S", time.localtime())
        session = smtplib.SMTP(SMTP_SERVER, SMTP_PORT)
        session.ehlo()
        session.starttls()
        session.ehlo
        session.login(sender, password)
        session.sendmail(sender, recipient, headers + "\r\n\r\n" + hora_actual + " -> " + body)
        session.quit()        


if __name__ == "__main__":
    event_handler = MyHandler()
    observer = Observer()
    observer.schedule(event_handler, path='/home/pi/webcam', recursive=False)
    observer.start()

    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        observer.stop()
    observer.join()