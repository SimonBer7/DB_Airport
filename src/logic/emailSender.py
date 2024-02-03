import smtplib
from email.mime.text import MIMEText

class EmailSender:
    def __init__(self, reservation, flight):
        self.subject = None
        self.body = None
        self.sender_email = None
        self.sender_password = None
        self.set_values(reservation, flight)

    def set_values(self, reservation, flight):
        self.subject = "Bernard's Airport - Reservation " + str(reservation.pin)
        self.sender_email = "airportbernard@gmail.com"
        self.sender_password = "wyzm hzct ador fcps"
        self.body = f"""Dear Passenger,
        
We hope this message finds you well. Thank you for choosing Bernard's Airport for your travel needs.

Your reservation details are as follows:
- Reservation ID: {reservation.pin}
- Date of leaving: {flight.date_leaving}
- Date of arriving: {flight.date_arriving}
- Date of reservation: {reservation.date}
- Price: {reservation.price} KC

We are committed to providing you with a seamless and enjoyable airport experience. Our dedicated team is working hard to ensure that your journey with us is comfortable and stress-free.

If you have any specific requests or questions regarding your reservation, please feel free to reach out to our customer service team at airportbernard@gmail.com. We are here to assist you in any way we can.

Once again, thank you for choosing Bernard's Airport. We look forward to welcoming you on airport and wish you a pleasant and safe journey.

Safe travels!

Sincerely,
Bernard's Airport
"""



    def send_reservation_email(self, user):
        msg = MIMEText(self.body)
        msg["Subject"] = self.subject
        msg["From"] = self.sender_email
        msg["To"] = user.email
        with smtplib.SMTP_SSL("smtp.gmail.com", 465) as server:
            server.login(self.sender_email, self.sender_password)
            server.sendmail(self.sender_email, msg["To"], msg.as_string())
