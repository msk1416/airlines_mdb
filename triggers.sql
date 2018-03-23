--Trigger that updates the money a client has spent whenever he
--books a flight
CREATE OR REPLACE TRIGGER UPDATE_MONEY_SPENT
AFTER INSERT
   ON BOOKINGS
   FOR EACH ROW
BEGIN
    UPDATE PASSENGERS 
    SET MONEY_SPENT = MONEY_SPENT + :NEW.FINAL_PRICE
    WHERE ID = :NEW.PASSENGER_ID;
END;


--Trigger that updates nationality counter when a new client is inserted
CREATE OR REPLACE TRIGGER UPDATE_NATIONALITY_COUNT_INSERT
AFTER INSERT
   ON PASSENGERS
   FOR EACH ROW
BEGIN
    UPDATE NATIONALITIES 
    SET COUNT = COUNT + 1
    WHERE SHORT_NAME = :NEW.NATIONALITY;
END;


--Trigger that updates nationality counter when a client is deleted
CREATE OR REPLACE TRIGGER UPDATE_NATIONALITY_COUNT_DELETE
AFTER DELETE
   ON PASSENGERS
   FOR EACH ROW
BEGIN
    UPDATE NATIONALITIES 
    SET COUNT = COUNT - 1
    WHERE SHORT_NAME = :OLD.NATIONALITY;
END;

--Trigger that updates the money spent on a flight when its
--client is changed
CREATE OR REPLACE TRIGGER UPDATE_MONEY_SPENT_DIFF_CLIENT 
AFTER UPDATE
ON BOOKINGS 
FOR EACH ROW
BEGIN
  update passengers
  set money_spent = money_spent - :OLD.final_price
  where id = :old.passenger_id;
  
  update passengers
  set money_spent = money_spent + :NEW.final_price
  where id = :new.passenger_id;
END;
