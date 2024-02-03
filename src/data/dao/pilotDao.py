
class PilotDao:
    def __init__(self, d):
        self.database = d

    def insert(self, pilot):
        try:
            if pilot is None:
                raise Exception("Invalid pilot object")

            sql_statement = "insert into pilot(first_name, last_name, age, email, phone_num) values(?, ?, ?, ?, ?);"
            values = (str(pilot.first_name), str(pilot.last_name), int(pilot.age), str(pilot.email), str(pilot.phone_num))
            self.database.execute(sql_statement, values)
            return "Pilot was inserted"
        except Exception as e:
            print(f"Error inserting pilot into the database: {str(e)}")

    def read_all_pilots(self):
        try:
            sql_statement = "select * from print_all_pilots;"
            data = self.database.execute_with_data(sql_statement, None)
            return data
        except Exception:
            return "Error with reading pilots from database"

    def read_by_name(self, name):
        try:
            if name is None:
                raise ValueError("Invalid name object")

            sql_statement = "select pilot.id from pilot where last_name = ?;"
            values = (str(name))
            data = self.database.execute_for_agr(sql_statement, values)
            return data
        except ValueError:
            return "Error with reading id"


    def update(self, old_email, email_tmp, last_name):
        try:
            if last_name is None and email_tmp is None and old_email is None:
                raise ValueError()
            sql_statement = "UPDATE pilot SET email = ? where email = ? and last_name = ?;"
            values = (str(email_tmp), str(old_email), str(last_name))
            self.database.execute(sql_statement, values)
            return "Passenger's email was updated."
        except ValueError:
            return "Error Invalid values"
        except Exception as e:
            return f"Error updating passenger into the database: {str(e)}"

    def delete(self, email):
        try:
            if email is None:
                raise ValueError()
            sql_statement = "delete from pilot where email = ?;"
            values = (str(email))
            self.database.execute(sql_statement, values)
            return "Pilot was deleted."
        except ValueError:
            return "Error with deleting pilot"