# airlines_mdb
## Usage: 
1. Run table create scripts in table_creation.sql file
2. Populate some data running the data_initialization.sql file
3. Set up triggers by running triggers.sql file
4. Compile functions and procedures in the following order:
   * 4.1. Run GET_REDUCED_PRICE function script in functions.sql file
   * 4.2. Compile procedures.sql file
   * 4.3. Compile SHUFFLE_SEATS_FLIGHT function from functions.sql file
5. Ready!
