from src.data.models.passenger import Passenger
class PassengerDao:
    def __init__(self, d):
        self.database = d


    def insert(self, passenger):
        try:
            if passenger is None:
                raise Exception("Invalid passenger object")

            sql_statement = "INSERT INTO passenger(first_name, last_name, email, password, phone_num, pin) values(?, ?, ?, ?, ?, ?);"
            values = (str(passenger.get_first_name()), str(passenger.get_last_name()), str(passenger.get_email()), str(passenger.get_password()), str(passenger.get_phone_num()), str(passenger.get_pin()))
            self.database.execute(sql_statement, values)
            return "Passenger was inserted"
        except Exception as e:
            return f"Error inserting passenger into the database: {str(e)}"

    def read_id(self, pin):
        if pin is None:
            raise ValueError()

        sql_statement = "select passenger.id from passenger where pin = ?"
        values = (str(pin))
        data = self.database.execute_for_agr(sql_statement, values)
        return data

    def read(self, pin):
        try:
            if pin is None:
                raise ValueError()
            sql_statement = "exec print_user_flights ?"
            values = (str(pin))
            data = self.database.execute_with_data(sql_statement, values)
            return data
        except ValueError:
            return "Error with reading from database"

    def read_to_login(self, email, pas):
        try:
            if email is None or pas is None:
                raise ValueError()

            password = Passenger.hash_password(pas)
            sql_statement = "select first_name, last_name, email, password, phone_num, pin from passenger where email = ? and password = ?;"
            values = (str(email), str(password))
            data = self.database.execute_with_data(sql_statement,values)

            for id in data:
                passenger = Passenger(id[0], id[1], id[2], id[3], id[4], id[5])
            return passenger
        except ValueError:
            return "Error with reading from database"

    def read_all_passengers(self):
        sql_statement = "select * from print_all_passengers;"
        data = self.database.execute_with_data(sql_statement, None)
        return data



    def update(self, email_tmp, pas):
        try:
            if pas is None and email_tmp is None:
                raise Exception("Invalid values")
            password = Passenger.hash_password(pas)
            sql_statement = "UPDATE passenger SET email = ? where password = ?;"
            values = (str(email_tmp), str(password))
            self.database.execute(sql_statement, values)
            return "Passenger's email was updated."
        except Exception as e:
            return f"Error updating passenger into the database: {str(e)}"

    def delete(self, passenger):
        try:
            if passenger is None:
                raise ValueError("Invalid passenger object")
            sql_statement = "DELETE FROM passenger WHERE first_name = ? and last_name = ? and email = ? and password = ? and phone_num = ? and pin = ?;"
            values = (
                str(passenger.first_name),
                str(passenger.last_name),
                str(passenger.email),
                str(passenger.password),
                str(passenger.phone_num),
                str(passenger.pin)
            )
            self.database.execute(sql_statement, values)
            return "Passenger was deleted"
        except ValueError as ve:
            return f"Error: {ve}"
        except Exception as e:
            return f"Error deleting passenger from the database: {str(e)}"

    def admin_delete_by_id(self, id):
        try:
            if id is None:
                raise ValueError()
            sql_statement = "delete from passenger where id = ?;"
            values = (int(id))
            self.database.execute(sql_statement, values)
            return "Passenger was deleted"
        except ValueError:
            return "Error with deleting passenger"