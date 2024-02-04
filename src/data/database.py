import pyodbc
import configparser

class Database:
    """
    The Database class represents a connection to a SQL Server database using the pyodbc library.
    It provides methods for executing SQL queries, creating and dropping tables, and managing the database.

    ...

    Attributes
    ----------
    connection_string : str
        The connection string used to establish a connection to the database.
    name : str
        The name of the database.

    Methods
    -------
    get_connection_string()
        Retrieves the connection string from the configuration file.
    execute_with_data(query, values)
        Executes a SQL query that returns data and fetches the result.
    execute_for_agr(query, values)
        Executes a SQL query that returns a single aggregate result.
    execute(query, values=None)
        Executes a SQL query without fetching any result.
    create_database()
        Creates the necessary tables for the database.
    drop_database()
        Drops all tables in the database.

    """

    def __init__(self, name):
        """
        Initializes a new Database object with the provided name.

        Parameters
        ----------
        name : str
            The name of the database.
        """
        self.connection_string = self.get_connection_string()
        self.name = name

    def get_connection_string(self):
        """
        Retrieves the connection string from the configuration file.

        Returns
        -------
        str
            The connection string.
        """
        config = configparser.ConfigParser()
        config.read('conf/configuration.ini')
        server = config.get('dbconnection', 'server')
        database = config.get('dbconnection', 'database')
        username = config.get('dbconnection', 'username')
        password = config.get('dbconnection', 'password')
        return (
            f'DRIVER={{ODBC Driver 17 for SQL Server}};'
            f'SERVER={server};'
            f'DATABASE={database};'
            f'UID={username};'
            f'PWD={password};'
        )

    def execute_with_data(self, query, values):
        """
        Executes a SQL query that returns data and fetches the result.

        Parameters
        ----------
        query : str
            The SQL query to be executed.
        values : list or None
            The parameter values to be substituted in the query.

        Returns
        -------
        list
            The result of the query as a list of tuples.
        """
        try:
            connection = pyodbc.connect(self.connection_string)
            cursor = connection.cursor()
            if values:
                data = cursor.execute(query, values)
                result = data.fetchall()
                connection.commit()
            else:
                data = cursor.execute(query)
                result = data.fetchall()
                connection.commit()
            return result
        except Exception as e:
            return f"Error: {e}"
        finally:
            cursor.close()
            connection.close()

    def execute_for_agr(self, query, values):
        """
        Executes a SQL query that returns a single aggregate result.

        Parameters
        ----------
        query : str
            The SQL query to be executed.
        values : list or None
            The parameter values to be substituted in the query.

        Returns
        -------
        any
            The single aggregate result of the query.
        """
        try:
            connection = pyodbc.connect(self.connection_string)
            cursor = connection.cursor()
            if values:
                data = cursor.execute(query, values)
                result = data.fetchone()[0]
            else:
                data = cursor.execute(query)
                result = data.fetchone()[0]
            connection.commit()
            return result
        except Exception as e:
            return f"Error: {e}"
        finally:
            cursor.close()
            connection.close()

    def execute(self, query, values=None):
        """
        Executes a SQL query without fetching any result.

        Parameters
        ----------
        query : str
            The SQL query to be executed.
        values : list or None, optional
            The parameter values to be substituted in the query. Default is None.
        """
        connection = pyodbc.connect(self.connection_string)
        cursor = connection.cursor()
        if values:
            cursor.execute(query, values)
        else:
            cursor.execute(query)
        connection.commit()
        cursor.close()
        connection.close()

    def create_database(self):
        """
        Creates the necessary tables for the database.

        Returns
        -------
        str
            A message indicating that the database was created.
        """
        sql_statements = """
                            BEGIN TRANSACTION;
                            create table passenger(
                                id int primary key identity(1,1),
                                first_name varchar(50) not null,
                                last_name varchar(50) not null,
                                email varchar(150) not null check(email like '%@%'),
                                password varchar(255) not null,
                                phone_num varchar(15) not null,
                                pin varchar(11) not null check(pin like '%/%') unique
                            );

                            create table pilot(
                                id int primary key identity(1,1),
                                first_name varchar(50) not null,
                                last_name varchar(50) not null,
                                age int not null check(age > 28),
                                email varchar(150) not null check(email like '%@%'),
                                phone_num varchar(15) not null
                            );

                            create table plane(
                                id int primary key identity(1,1),
                                name varchar(100) not null,
                                type varchar(100) not null check(type in ('private', 'public')), 
                                capacity int not null check(capacity > 0),
                                range int not null check(range > 0),
                                active char(1) not null
                            );


                            create table destination(
                                id int primary key identity(1,1),
                                country varchar(50) not null,
                                capital varchar(50) not null,
                                language varchar(50) not null,
                                avg_temp float not null
                            );


                            create table flight(
                                id int primary key identity(1,1),
                                fly_number int not null check(fly_number > 0) unique,
                                destination_id int foreign key references destination(id),
                                plane_id int foreign key references plane(id),
                                pilot_id int foreign key references pilot(id),
                                date_leaving date not null,
                                date_arriving date not null,
                                price int not null check(price > 0)
                            );


                            create table reservation(
                                id int primary key identity(1,1),
                                pin int not null check(pin > 0) unique,
                                passenger_id int foreign key references passenger(id),
                                flight_id int foreign key references flight(id),
                                date datetime not null,
                                price int not null check(price > 0)
                            );
                            COMMIT;
                        """
        self.execute(sql_statements)
        return "Database was created."

    def drop_database(self):
        """
        Drops all tables in the database.

        Returns
        -------
        str
            A message indicating that the database was deleted.
        """
        sql_statements = """drop table reservation;
                            drop table flight;
                            drop table destination;
                            drop table plane;
                            drop table pilot;
                            drop table passenger;"""
        self.execute(sql_statements)
        return "Database was deleted."
