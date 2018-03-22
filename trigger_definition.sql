----1. trigger before insert on NEW Airport Information 

CREATE OR REPLACE TRIGGER airport_before_insert
BEFORE INSERT
   ON AIRPORTS
   FOR EACH ROW

DECLARE
   v_username varchar2(10);

BEGIN

SELECT user INTO v_username
   FROM dual;
  
   :new.create_date := sysdate;
   :new.created_by := v_username;

END;


--2. trigger for before update on BOOKINGS Table 
CREATE OR REPLACE TRIGGER bookings_before_update
BEFORE UPDATE
   ON BOOKINGS
   FOR EACH ROW

DECLARE
   v_username varchar2(10);

BEGIN

  
   SELECT user INTO v_username
   FROM dual;

   :new.updated_date := sysdate;
   :new.updated_by := v_username;

END;

---3.trigger for before delete of records from the PASSENGERS table
CREATE OR REPLACE TRIGGER passengers_before_delete
BEFORE DELETE
   ON PASSENGERS
   FOR EACH ROW
DECLARE
   v_username varchar2(10);

BEGIN

   SELECT user INTO v_username
   FROM dual;

   -- Insert record into Archive_passengers table
   INSERT INTO arch_passengers
   ( FIRST_NAME,
     LAST_NAME,
     ID,
     AGE,
     NATIONALITY,
     delete_date,
     deleted_by )
   VALUES
   ( :old.FIRST_NAME,
     :old.LAST_NAME,
     :old.ID,
     :old.AGE,
     old.NATIONALITY,
      sysdate,
      v_username );

END;

---4. Trigger for after update of records on flights table

CREATE OR REPLACE TRIGGER flights_after_update
AFTER UPDATE
   ON FLIGHTS
   FOR EACH ROW
    WHEN (new.BOARDING_TIME != old. BOARDING_TIME)
DECLARE
   v_username varchar2(10);

BEGIN

   -- Find username of person performing UPDATE into table
   SELECT user INTO v_username
   FROM dual;

   -- Insert record into audit table
   INSERT INTO orders_audit
   ( FLIGHT_NO,
     BOARDING_TIME,
     DESTINATION,
     ORIGIN,
     AIRLINE,
     PLANE_MODEL,
     BASE_PRICE,
     updated_date_time,
     updated_by)
   VALUES
   ( :old.FLIGHT_NO,
     :new.BOARDING_TIME,
     :old.DESTINATION,
     :old.ORIGIN,
     :old.AIRLINE,
     :old.PLANE_MODEL,
     :old.BASE_PRICE,
     sysdate,
     v_username );

END;
