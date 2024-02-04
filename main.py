"""
Airport Management System

This script represents the main entry point for an Airport Management System. It initializes the necessary components
such as Database, Application, and UserInterface to manage airport-related information.

Dependencies:
    - src.data.database.Database: Provides functionality to interact with the airport database.
    - src.logic.aplication.Application: Implements the core logic of the airport management application.
    - src.presentation.user_interface.UserInterface: Handles user interaction and interfaces with the application.

Usage:
    Execute this script to start the Airport Management System.

"""

from src.data.database import Database
from src.logic.aplication import Application
from src.presentation.user_interface import UserInterface

def main():
    # Initialize the database with the name "Airport"
    database = Database("Airport")

    # Initialize the Application
    app = Application()

    # Initialize the UserInterface with the provided database
    ui = UserInterface(database)

    # Establish bidirectional communication between the Application and UserInterface
    ui.app = app
    app.user_interface = ui

    # Start the application
    app.start()

if __name__ == "__main__":
    # Execute the main function when the script is run
    main()
