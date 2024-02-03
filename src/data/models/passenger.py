import hashlib

class Passenger:
    def __init__(self, f_name, l_name, email, password, phone_num, pin):
        self.first_name = f_name
        self.last_name = l_name
        self.email = email
        self.password = password
        self.phone_num = phone_num
        self.pin = pin

    def get_first_name(self):
        return self.first_name

    def get_last_name(self):
        return self.last_name

    def get_email(self):
        return self.email

    def get_password(self):
        return self.password

    def get_phone_num(self):
        return self.phone_num

    def get_pin(self):
        return self.pin

    @classmethod
    def hash_password(cls, password):
        hashed_password = hashlib.sha256(password.encode()).hexdigest()
        return hashed_password

    def to_string(self):
        return "Passeger "+self.first_name+" "+self.last_name+", email: "+self.email+", password: "+self.password+", phone: "+self.phone_num+", pin: "+self.pin



