from src.data.database import Database
from src.logic.aplication import Application
from src.presentation.user_interface import UserInterface

def main():
    database = Database("Airport")
    app = Application()
    ui = UserInterface(database)
    ui.app = app
    app.user_interface = ui

    app.start()


if __name__ == "__main__":
    main()

