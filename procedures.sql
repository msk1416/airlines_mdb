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