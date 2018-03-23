


--Update Proc: Procedure that changes the passenger id on a booking
set serveroutput on;
CREATE OR REPLACE PROCEDURE change_passenger (
    old_id IN NUMBER, 
    flight IN VARCHAR2, 
    new_id IN NUMBER) IS
    
    row_count   NUMBER;
BEGIN
select count(*) into row_count from BOOKINGS where passenger_id=old_id and flight_number=flight;
IF row_count > 0 THEN
    select count(*) into row_count from PASSENGERS where id=new_id;
    IF row_count > 0 THEN
        update BOOKINGS set passenger_id=new_id where passenger_id=old_id and flight_number=flight;
    ELSE
        DBMS_OUTPUT.PUT_LINE('There is no passenger with the supplied id number.');
    END IF;  
ELSE
    DBMS_OUTPUT.PUT_LINE('There is no booking in the Database for this passenger and flight.');
END IF;
END;


--Tests
execute CHANGE_PASSENGER (47331569, '12345', 902380);
execute CHANGE_PASSENGER (902380, '12345', 77777);
execute CHANGE_PASSENGER (902380, 'qwer12345', 47331569);
execute CHANGE_PASSENGER (151632, 'KL237', 445478);





--Add Proc: Procedure that adds a flight booking 

create or replace PROCEDURE book_flight (
    passenger IN bookings.passenger_id%TYPE,
    flight IN bookings.flight_number%TYPE,
    disc_title IN discounts.disc_id%TYPE )
    IS
    passenger_found number := 0;
    flight_found number := 0;
    BEGIN
        select count(*) into passenger_found
        from passengers where id = passenger;
        select count(*) into flight_found
        from flights where flight_no = flight;
        
        if passenger_found + flight_found = 2 then
            insert into bookings 
            values (passenger, 
                    flight, 
                    get_reduced_price(flight, disc_title),
                    round(dbms_random.value() * 100)); --random seat no.
        elsif passenger_found  = 0 then
            dbms_output.put_line('User with ID = ' || passenger || ' does not exist.');
        elsif flight_found = 0 then
            dbms_output.put_line('Flight with number = ' || flight || ' does not exist.');
        end if;
    END;

--Tests
EXECUTE book_flight(902380, 'RY900', 'STUDENT');
EXECUTE BOOK_FLIGHT(48666411, 'ET340', '-');
EXECUTE BOOK_FLIGHT(41155478, 'FR210', 'STUDENT');
EXECUTE BOOK_FLIGHT(3326448, 'FR210', 'STUDENT');
EXECUTE BOOK_FLIGHT(47331569, 'IB887', 'STUDENT');
EXECUTE BOOK_FLIGHT(902380, 'KL237', 'CHILD');
EXECUTE BOOK_FLIGHT(151632, 'KL237', 'W-VETERAN');
EXECUTE BOOK_FLIGHT(4411556, 'ES922', 'CHILD');
EXECUTE BOOK_FLIGHT(4411556, 'KL237', 'STUDENT');
EXECUTE BOOK_FLIGHT(47331569, 'KL237', '-');
EXECUTE BOOK_FLIGHT(902380, 'IB887', '-');
EXECUTE BOOK_FLIGHT(4225448, 'RY900', '-');
EXECUTE BOOK_FLIGHT(47331569, '12345', '-');




--Get Proc: Procedure that retrieves a cursor to the flights of a passenger

create or replace procedure getClientsOfFlightCursor (
    f_no IN BOOKINGS.FLIGHT_NUMBER%TYPE,
    cur_clients OUT SYS_REFCURSOR )
    is 
    begin
    OPEN cur_clients FOR
    SELECT * FROM bookings WHERE flight_number = f_no;
    
    END;
    
    
    
    
--Function that returns certain discount applied to a flight  

create or replace function get_reduced_price (
flight IN bookings.flight_number%TYPE,
disc_title IN discounts.disc_id%TYPE) 
return NUMBER 
IS
flight_price flights.base_price%TYPE := 0;
disc_quant discounts.percentage%TYPE := 0;
BEGIN
select base_price into flight_price
from flights where flight_no = flight;
if SQL%FOUND then
    select percentage into disc_quant
    from discounts where disc_id = disc_title;
    if disc_quant = NULL then
        return flight_price;
    end if;
    return (flight_price * (100 - disc_quant) / 100);
else 
    dbms_output.put_line('This flight does not exist.');
    return 0;
end if;
END;

--Tests
set SERVEROUTPUT ON
BEGIN
  DBMS_OUTPUT.PUT_LINE(get_reduced_price('AT404', 'FREQUENT'));
  DBMS_OUTPUT.PUT_LINE(get_reduced_price('12345', 'BABY'));
  DBMS_OUTPUT.PUT_LINE(get_reduced_price('RY900', 'STUDENT'));
  DBMS_OUTPUT.PUT_LINE(get_reduced_price('ET340', 'W-VETERAN'));
  DBMS_OUTPUT.PUT_LINE(get_reduced_price('ES922', 'FREQUENT'));
  --DBMS_OUTPUT.PUT_LINE(get_reduced_price('ES922', 'NONEXIST'));
  
END;
/

begin
    dbms_output.put_line(round(dbms_random.value() * 100));
end;
/



--Function that shuffles seat number on 2nd class clients
--for a selected flight (assuming seats 1 to 20 are reserved for 1st class
create or replace function shuffle_seats_flight (
    flight_n IN bookings.flight_number%TYPE)
    return NUMBER
    IS
    cur SYS_REFCURSOR;
    tmp_client bookings%ROWTYPE;
    counter NUMBER := 0;
    BEGIN
        getClientsOfFlightCursor(flight_n, cur);
        loop
            fetch cur into tmp_client;
            exit when cur%NOTFOUND;
            if tmp_client.seat_number > 20 then
                update bookings 
                set seat_number = round(dbms_random.value() * 100)
                where passenger_id = tmp_client.passenger_id and
                      flight_number = tmp_client.flight_number;
                
                counter := counter + 1;
            end if;
        end loop;
        close cur;
        return counter;
    END;
    
--Tests
    set serveroutput on;
    BEGIN
      DBMS_OUTPUT.PUT_LINE('count: ' || shuffle_seats_flight('RY900'));
      DBMS_OUTPUT.PUT_LINE('count: ' || shuffle_seats_flight('KL237'));
      DBMS_OUTPUT.PUT_LINE('count: ' || shuffle_seats_flight('ES922'));
    END;
    
