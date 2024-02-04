"""
Airport Management Application

This class represents the core application for managing airport-related activities. It includes functionalities for user
authentication, user actions, and interactions with the UserInterface. The application initializes a default admin user
and provides methods for handling various user actions.

Attributes:
    - running (bool): Represents the state of the application. True if the application is running, False otherwise.
    - user_interface (UserInterface): Handles user interactions and interfaces with the application.
    - logged_user (Passenger): Represents the currently logged-in user.
    - admin (Passenger): Represents the default admin user.

Methods:
    - start(): Initiates the application and enters a loop to handle user commands based on the user's role (admin or regular user).
    - login(): Handles the login process, updating the logged_user attribute upon successful login.
    - signup(): Invokes the UserInterface to handle the user signup process.
    - show_profile(): Displays the profile of the currently logged-in user.
    - change_email(): Allows the user to change their email address.
    - show_my_flights(): Displays the flights booked by the currently logged-in user.
    - book_flight(): Initiates the process of booking a flight.
    - delete_my_flight(): Allows the user to delete a booked flight.
    - delete_account(): Initiates the process of deleting the user's account.
    - log_out(): Logs out the currently logged-in user.
    - exit(): Exits the application, updating the running state based on user input.
    - passenger_crud(): Initiates CRUD operations for passenger entities using the UserInterface.
    - pilot_crud(): Initiates CRUD operations for pilot entities using the UserInterface.
    - plane_crud(): Initiates CRUD operations for plane entities using the UserInterface.
    - destination_crud(): Initiates CRUD operations for destination entities using the UserInterface.
    - flight_crud(): Initiates CRUD operations for flight entities using the UserInterface.
    - reservation_crud(): Initiates CRUD operations for reservation entities using the UserInterface.

Usage:
    Instantiate an Application object and call the start() method to begin the Airport Management System.

Example:
    app = Application()
    app.start()

Note:
    This class assumes the existence of a UserInterface class for handling user interactions and a Passenger class
    for representing user information.

"""

from src.data.models.passenger import Passenger

class Application:
    def __init__(self):
        """
        Initializes the Application with default attributes and an admin user.

        """
        self.running = False
        self.user_interface = None
        self.logged_user = None
        self.admin = Passenger("Admin", "Admin", "admin@gmail.com", Passenger.hash_password("admin"), "111111111", "111111/1111")

    def start(self):
        """
        Initiates the application and enters a loop to handle user commands based on the user's role (admin or regular user).

        """
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
        """
        Handles the login process, updating the logged_user attribute upon successful login.

        """
        self.logged_user = self.user_interface.login()
        if self.logged_user is not None:
            self.user_interface.print_name(self.logged_user)

    def signup(self):
        """
        Invokes the UserInterface to handle the user signup process.

        """
        self.user_interface.signup()

    def show_profile(self):
        """
        Displays the profile of the currently logged-in user.

        """
        self.user_interface.show_profile(self.logged_user)

    def change_email(self):
        """
        Allows the user to change their email address.

        """
        self.user_interface.change_email()

    def show_my_flights(self):
        """
        Displays the flights booked by the currently logged-in user.

        """
        self.user_interface.show_my_flights(self.logged_user)

    def book_flight(self):
        """
        Initiates the process of booking a flight.

        """
        self.user_interface.book_flight()

    def delete_my_flight(self):
        """
        Allows the user to delete a booked flight.

        """
        self.user_interface.delete_my_flight()

    def delete_account(self):
        """
        Initiates the process of deleting the user's account.

        """
        self.user_interface.delete_acount()

    def log_out(self):
        """
        Logs out the currently logged-in user.

        """
        self.user_interface.print_message(self.logged_user.get_first_name()+" was logged out...")
        self.logged_user = None

    def exit(self):
        """
        Exits the application, updating the running state based on user input.

        """
        self.running = self.user_interface.exit()

    def passenger_crud(self):
        """
        Initiates CRUD operations for passenger entities using the UserInterface.

        """
        self.user_interface.passenger_crud()

    def pilot_crud(self):
        """
        Initiates CRUD operations for pilot entities using the UserInterface.

        """
        self.user_interface.pilot_crud()

    def plane_crud(self):
        """
        Initiates CRUD operations for plane entities using the UserInterface.

        """
        self.user_interface.plane_crud()

    def destination_crud(self):
        """
        Initiates CRUD operations for destination entities using the UserInterface.

        """
        self.user_interface.destination_crud()

    def flight_crud(self):
        """
        Initiates CRUD operations for flight entities using the UserInterface.

        """
        self.user_interface.flight_crud()

    def reservation_crud(self):
        """
        Initiates CRUD operations for reservation entities using the UserInterface.

        """
        self.user_interface.reservation_crud()

