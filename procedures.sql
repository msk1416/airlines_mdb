
--Procedure that changes the passenger id on a booking
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

--Procedure that adds a flight booking 

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
EXECUTE book_flight(902380, 'RY900', 'STUDENT'); --WILL INSERT
EXECUTE book_flight(0000 , '12345', 'W-VETERAN'); --WON'T INSERT
EXECUTE book_flight(33115 , 'N03X15T', 'CHILD'); --WON'T INSERT


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