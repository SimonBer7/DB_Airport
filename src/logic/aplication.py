from src.data.models.passenger import Passenger

class Application:
    def __init__(self):
        self.running = False
        self.user_interface = None
        self.logged_user = None
        self.admin = Passenger("Admin", "Admin", "admin@gmail.com", Passenger.hash_password("admin"), "111111111", "111111/1111")

    def start(self):
        self.user_interface.print_message("Welcome to Bernard's Airport, let's book some flights :)")
        self.running = True
        self.user_interface.print_message(self.user_interface.check_tables())
        while self.running:
            command = self.user_interface.print_login
            if self.logged_user is not None:
                if self.logged_user.email == self.admin.get_email() and self.logged_user.password == self.admin.get_password():
                    command = self.user_interface.print_admin_menu
                else:
                    command = self.user_interface.print_menu
            command()

    def login(self):
        self.logged_user = self.user_interface.login()
        if self.logged_user is not None:
            self.user_interface.print_name(self.logged_user)


    def signup(self):
        self.user_interface.signup()

    def show_profile(self):
        self.user_interface.show_profile(self.logged_user)


    def change_email(self):
        self.user_interface.change_email()

    def show_my_flights(self):
        self.user_interface.show_my_flights(self.logged_user)


    def book_flight(self):
        self.user_interface.book_flight()


    def delete_my_flight(self):
        self.user_interface.delete_my_flight()


    def delete_acount(self):
        self.user_interface.delete_acount()


    def log_out(self):
        self.user_interface.print_message(self.logged_user.get_first_name()+" was logged out...")
        self.logged_user = None


    def exit(self):
        self.running = self.user_interface.exit()

    def passenger_crud(self):
        self.user_interface.passenger_crud()

    def pilot_crud(self):
        self.user_interface.pilot_crud()

    def plane_crud(self):
        self.user_interface.plane_crud()

    def destination_crud(self):
        self.user_interface.destination_crud()

    def flight_crud(self):
        self.user_interface.flight_crud()

    def reservation_crud(self):
        self.user_interface.reservation_crud()