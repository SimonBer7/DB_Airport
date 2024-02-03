# Projekt Alfa 3 (Bernard’s Airport)

## Informace o Autorovi
- **Autor:** Šimon Bernard C4b
- **E-mail:** bernard@spsejecna.cz
- **Datum:** 03. 02. 2024
- **Škola:** Střední průmyslová škola elektrotechnická, Ječná 30, Praha, Česká republika

## Typ a Zaměření Projektu
- **Typ projektu:** Alfa 3
- **Zaměření projektu:** Cestovní ruch (Bernard’s Airport)

## Použité Externí Knihovny
1. **pyodbc:** [Odkaz na pyodbc](https://pypi.org/project/pyodbc/)
   - Instalace: `python -m pip install pyodbc`

2. **prettytable:** [Odkaz na prettytable](https://pypi.org/project/prettytable/)
   - Instalace: `python -m pip install -U prettytable`

## Chod Aplikace
- **Spuštění Aplikace:**
- 1. `Path/to/project: python -m venv venv`
  2. `Path/to/project: venv\Scripts\activate`
  3. `Path/to/project: python -m pip install pyodbc`
  4. `Path/to/project: python -m pip install -U prettytable`
  5. `Path/to/project: python main.py`
## Popis
- Po úspěšném spuštění program přivítá uživatele.
- Uživatel má možnost přihlásit se jako administrátor (admin) nebo jako běžný uživatel.
- Administrátor má plná práva nad aplikací, zatímco uživatel má omezená práva.
- Uživatel může zobrazit detaily svého účtu, změnit e-mail, získat seznam rezervací letů, provést novou rezervaci letu, smazat objednaný let, smazat účet nebo se odhlásit.
- Při rezervaci letu je odeslán detail rezervace na zadaný e-mail uživatele.
- Administrátor má možnost CRUD (Vytvoření, Čtení, Úprava, Mazání) nad všemi tabulkami, resetování databáze a odhlášení.
- Program využívá 6 pohledů pro usnadnění výpisu dat a práci s nimi.

## Konfigurace
- Konfigurace probíhá ve složce `/conf/configuration.ini`

## E-R Model Databáze
![E-R Model](https://raw.githubusercontent.com/SimonBer7/DB_Airport/main/diagrams/er_model.png)

## Import
- Po prvním spuštění programu se data importují z csv souborů do databáze a vytvoří se administrátorský účet.
- Data jsou importována do tabulek Destination, Plane, Pilot a Flight.
- Import probíhá ze souborů ve složce `/data/` (destinations.csv, flights.csv, …).

### Příklad dat z destination.csv:

## Export
- Export databáze se nachází ve složce `/data/export` => `/data/export/export.sql`
- Export dat je k dispozici v `/data/export/export_dat.sql`

