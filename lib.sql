---------------------------------------------LIBRARY PROJECT---------------------------------------------


CREATE USER LIB IDENTIFIED BY LIB;
GRANT ALL PRIVILEGE TO LIB;
CONNECT LIB/LIB;


--------------------------------------------------SELECT-------------------------------------------------


SELECT * FROM Card;
SELECT * FROM Location;
SELECT * FROM Branch;
SELECT * FROM Customer;
SELECT * FROM Employee;
SELECT * FROM Book;
SELECT * FROM Video;
SELECT * FROM Rent;
SELECT * FROM ADMIN;


-----------------------------------------------DROP TABLES-----------------------------------------------
DROP TABLE Rent;
DROP TABLE Video;
DROP TABLE Book;
DROP TABLE Employee;
DROP TABLE Customer;
DROP TABLE Branch;
DROP TABLE Location;
DROP TABLE Card;
DROP TABLE ADMIN1;




---------------------------------------------------CREATE TABLES-----------------------------------------
---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------






--------------------------------------------------TABLE 01 ADMIN-----------------------------------------


CREATE TABLE ADMIN1(
  USERID VARCHAR2(20),
  PASSWORD1 VARCHAR2(20)
);
INSERT INTO ADMIN1 VALUES('OVI','OVI');
INSERT INTO ADMIN1 VALUES('LAMI','LAMI');
INSERT INTO ADMIN1 VALUES('EMON','EMON');


-------------------------------------------------TABLE 02 CARD-------------------------------------------


CREATE TABLE Card(
  cardID NUMBER,
  status VARCHAR2(1) CHECK ((status = 'A') OR (status = 'B')),
  fines NUMBER,
  CONSTRAINT Card_PK PRIMARY KEY (cardID));

CREATE SEQUENCE card_sq
 START WITH     100
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;

INSERT INTO Card VALUES (card_sq.nextval ,'A',0);
INSERT INTO Card VALUES (card_sq.nextval,'A',0);
INSERT INTO Card VALUES (card_sq.nextval,'A',0);
INSERT INTO Card VALUES (card_sq.nextval,'A',0);
INSERT INTO Card VALUES (card_sq.nextval,'A',0);
INSERT INTO Card VALUES (card_sq.nextval,'A',0);
INSERT INTO Card VALUES (card_sq.nextval,'B',50);
INSERT INTO Card VALUES (card_sq.nextval,'B',10);
INSERT INTO Card VALUES (card_sq.nextval,'B',25);
INSERT INTO Card VALUES (card_sq.nextval,'B',15);
INSERT INTO Card VALUES (card_sq.nextval,'A',0);
INSERT INTO Card VALUES (card_sq.nextval,'A',0);
INSERT INTO Card VALUES (card_sq.nextval,'A',0);
INSERT INTO Card VALUES (card_sq.nextval,'A',0);
INSERT INTO Card VALUES (card_sq.nextval,'A',0);


--------------------------------------------TABLE 03 LOCATION------------------------------------------


CREATE TABLE Location(
  address VARCHAR2(50),
  CONSTRAINT Location_PK PRIMARY KEY (address));
INSERT INTO Location VALUES ('ARCHEOLOGY ROAD');
INSERT INTO Location VALUES ('CHEMISTRY ROAD');
INSERT INTO Location VALUES ('COMPUTING ROAD');
INSERT INTO Location VALUES ('PHYSICS ROAD');


----------------------------------------------TABLE 04 BRANCH-------------------------------------------


CREATE TABLE Branch(
  name VARCHAR2(40),
  address VARCHAR2(50),
  phone NUMBER(9),
  CONSTRAINT Branch_PK PRIMARY KEY (name),
  CONSTRAINT Branch_FK FOREIGN KEY (address) REFERENCES Location(address));
INSERT INTO Branch VALUES ('ARCHEOLOGY', 'ARCHEOLOGY ROAD', 645645645);
INSERT INTO Branch VALUES ('CHEMISTRY', 'CHEMISTRY ROAD', 622622622);
INSERT INTO Branch VALUES ('COMPUTING', 'COMPUTING ROAD', 644644644);
INSERT INTO Branch VALUES ('PHYSICS', 'PHYSICS ROAD', 666666666);


---------------------------------------------TABLE 05 CUSTOMER------------------------------------------


CREATE TABLE Customer(
  customerID NUMBER,
  name VARCHAR2(40),
  customerAddress VARCHAR2(50),
  phone NUMBER(9),
  password VARCHAR2(20),
  userName VARCHAR2(10),
  dateSignUp DATE,
  cardNumber NUMBER,
  CONSTRAINT Customer_PK PRIMARY KEY (customerID));
ALTER SESSION SET nls_date_format='dd-mm-yyyy';


INSERT INTO Customer VALUES (1, 'ALFRED', 'BACON STREET', 623623623, 'alfred123', 'al1', TO_DATE('12-05-2018'), 101);
INSERT INTO Customer VALUES (2, 'JAMES', 'DOWNTOWN ABBEY', 659659659, 'james123', 'ja2', TO_DATE('10-05-2018'), 102);
INSERT INTO Customer VALUES (3, 'GEORGE', 'DETROIT CITY', 654654654, 'george123', 'ge3', TO_DATE('21-06-2017'), 103);
INSERT INTO Customer VALUES (4, 'TOM', 'WASHINGTON DC.', 658658658, 'tom123', 'tom4', TO_DATE('05-12-2016'), 104);
INSERT INTO Customer VALUES (5, 'PETER', 'CASTERLY ROCK', 652652652, 'peter123', 'pe5', TO_DATE('09-08-2016'), 105);
INSERT INTO Customer VALUES (6, 'JENNY', 'TERRAKOTA', 651651651, 'jenny123', 'je6', TO_DATE('30-04-2017'), 106);
INSERT INTO Customer VALUES (7, 'ROSE', 'SWEET HOME ALABAMA', 657657657, 'rose123', 'ro7', TO_DATE('28-02-2018'), 107);
INSERT INTO Customer VALUES (8, 'MONICA', 'FAKE STREET 123', 639639639, 'monica123', 'mo8', TO_DATE('15-01-2016'), 108);
INSERT INTO Customer VALUES (9, 'PHOEBE', 'CENTRAL PERK', 678678678, 'phoebe123', 'pho9', TO_DATE('25-03-2016'), 109);
INSERT INTO Customer VALUES (10, 'RACHEL', 'WHEREVER', 687687687, 'rachel123', 'ra10', TO_DATE('01-09-2017'), 110);


----------------------------------------------TABLE 06 EMPLOYEE-----------------------------------------


CREATE TABLE Employee(
  employeeID NUMBER,
  name VARCHAR2(40),
  employeeAddress VARCHAR2(50),
  phone NUMBER(9),
  password VARCHAR2(20),
  userName VARCHAR2(10),
  paycheck NUMBER (8, 2),
  branchName VARCHAR2(40),
  cardNumber NUMBER,
  CONSTRAINT Employee_PK PRIMARY KEY (employeeID));
INSERT INTO Employee VALUES (211, 'ROSS', 'HIS HOUSE', 671671671, 'ross123', 'ro11', 1200, 'ARCHEOLOGY', 151);
INSERT INTO Employee VALUES (212, 'CHANDLER', 'OUR HEARTHS', 688688688, 'chandler123', 'chand12', 1150.50, 'ARCHEOLOGY', 152);
INSERT INTO Employee VALUES (213, 'JOEY', 'LITTLE ITAYLY', 628628628, 'joey123', 'jo13', 975.75, 'ARCHEOLOGY', 153);
INSERT INTO Employee VALUES (214, 'VICTOR', 'SANTA FE', 654321987, 'victor123', 'vic14', 2200, 'COMPUTING', 154);
INSERT INTO Employee VALUES (215, 'JAIRO', 'ARMILLA', 698754321, 'jairo123', 'ja15', 2200.50, 'CHEMISTRY', 155);


----------------------------------------------TABLE 07 BOOK----------------------------------------------


CREATE TABLE Book(
  ISBN VARCHAR2(4),
  bookID VARCHAR2(6),
  state VARCHAR2(10),
  avalability VARCHAR2(1) CHECK ((avalability = 'A') OR (avalability = 'O')),
  debyCost NUMBER(10,2),
  lostCost NUMBER(10,2),
  address VARCHAR2(50),
  CONSTRAINT Book_PK PRIMARY KEY(bookID) 
  );
INSERT INTO Book VALUES ('A123', 'B1A123', 'GOOD', 'A', 5, 20, 'ARCHEOLOGY ROAD');
INSERT INTO Book VALUES ('A123', 'B2A123', 'NEW', 'O', 6, 30, 'ARCHEOLOGY ROAD');
INSERT INTO Book VALUES ('B234', 'B1B234', 'NEW', 'A', 2, 15, 'CHEMISTRY ROAD');
INSERT INTO Book VALUES ('C321', 'B1C321', 'BAD', 'A', 1, 10, 'PHYSICS ROAD');
INSERT INTO Book VALUES ('H123', 'B1H123', 'GOOD', 'A', 3, 15, 'CHEMISTRY ROAD');
INSERT INTO Book VALUES ('Z123', 'B1Z123', 'GOOD', 'O', 4, 20, 'COMPUTING ROAD');
INSERT INTO Book VALUES ('L321', 'B1L321', 'NEW', 'O', 4, 20, 'COMPUTING ROAD');
INSERT INTO Book VALUES ('P321', 'B1P321', 'USED', 'A', 2, 12, 'CHEMISTRY ROAD');


--------------------------------------------TABLE 08 VIDEO-----------------------------------------------


CREATE TABLE Video(
  title VARCHAR2(50),
  year INT,
  videoID VARCHAR2(6),
  state VARCHAR2(10),
  avalability VARCHAR2(1) CHECK ((avalability = 'A') OR (avalability = 'O')),
  debyCost NUMBER(10,2),
  lostCost NUMBER(10,2),
  address VARCHAR(50),
  CONSTRAINT Video_PK PRIMARY KEY (videoID));
INSERT INTO Video VALUES ('CHEMISTRY FOR DUMMIES', 2016, 'V1CH16', 'NEW', 'O', 10, 50, 'CHEMISTRY ROAD');
INSERT INTO Video VALUES ('CHEMISTRY FOR DUMMIES', 2016, 'V2CH16', 'BAD', 'A', 5, 20, 'CHEMISTRY ROAD');
INSERT INTO Video VALUES ('COMPUTING MANAGER', 2014, 'V1CO14', 'GOOD', 'A', 4, 20, 'COMPUTING ROAD');
INSERT INTO Video VALUES ('JAVA LANGUAGE', 2015, 'V1JA15', 'USED', 'O', 4, 20, 'COMPUTING ROAD');
INSERT INTO Video VALUES ('DINOSAURS', 2000, 'V1DI00', 'GOOD', 'O', 5, 25, 'ARCHEOLOGY ROAD');
INSERT INTO Video VALUES ('T-REX, DEADLY KING', 1992, 'V1TR92', 'USED', 'A', 10, 50, 'ARCHEOLOGY ROAD');
INSERT INTO Video VALUES ('ANCESTORS OF THE HUMANITY', 1998, 'V1AN98', 'BAD', 'A', 3, 15, 'ARCHEOLOGY ROAD');
INSERT INTO Video VALUES ('PHYSICS, MOST BORING SH*T', 2018, 'V1PH18', 'NEW', 'A', 1, 5, 'PHYSICS ROAD');


-------------------------------------------TABLE 09 RENT-------------------------------------------------


CREATE TABLE Rent(
  cardID NUMBER,
  itemID VARCHAR2(6),
  apporpriationDate DATE,
  returnDate DATE,
  CONSTRAINT Rent_PK PRIMARY KEY (cardID,itemID));
INSERT INTO Rent VALUES (101, 'B2A123', TO_DATE('10-05-2018'), TO_DATE('20-05-2018'));
INSERT INTO Rent VALUES (102, 'B1Z123', TO_DATE('10-05-2018'), TO_DATE('25-05-2018'));
INSERT INTO Rent VALUES (104, 'V1JA15', TO_DATE('01-05-2018'), TO_DATE('21-05-2018'));
INSERT INTO Rent VALUES (105, 'V1DI00', TO_DATE('02-05-2018'), TO_DATE('25-05-2018'));
INSERT INTO Rent VALUES (154, 'B1L321', TO_DATE('04-05-2018'), TO_DATE('26-05-2018'));
INSERT INTO Rent VALUES (155, 'V1CH16', TO_DATE('29-04-2018'), TO_DATE('29-05-2018'));









--------------------------------------------------FUNCTIONS----------------------------------------------
---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------




-------------------------------------------- 01 ADMIN LOGIN--------------------------------------------


CREATE OR REPLACE PROCEDURE LOGIN_ADMIN1(USER IN VARCHAR2, PASS IN VARCHAR2)
IS 
PASSAD ADMIN1.PASSWORD1%TYPE;
BEGIN
SELECT PASSWORD1 INTO PASSAD FROM ADMIN1 WHERE USERID LIKE USER;
IF PASSAD LIKE PASS THEN
    DBMS_OUTPUT.PUT_LINE('User ' || user || ' loging succesfull');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Password incorrect');
  END IF;
  EXCEPTION WHEN no_data_found THEN 
  DBMS_OUTPUT.PUT_LINE('User incorrect');
END;
/

SET SERVEROUTPUT ON;
DECLARE
  USER ADMIN1.USERID%TYPE;
  PASS ADMIN1.PASSWORD1%TYPE;
BEGIN
  USER := '&Username';
  PASS := '&Password';
  LOGIN_ADMIN1(USER,PASS);
END;
/


----------------------------------------- 02 CUSTOMER ADDING TRIGGER -----------------------------------


CREATE OR REPLACE TRIGGER addCardCusto_library
AFTER INSERT ON customer FOR EACH ROW
DECLARE
BEGIN
  DBMS_OUTPUT.PUT_LINE('Card created');
END;
/


------------------------------------------------ 03 ADD CUSTOMER ----------------------------------------


CREATE OR REPLACE PROCEDURE addCustomer_library(auxCustomerId IN NUMBER, auxName IN VARCHAR2, auxCustomerAddress IN VARCHAR2, auxPhone IN NUMBER,
auxPass IN VARCHAR2, auxUserName IN VARCHAR2, auxCardNumber IN NUMBER)
IS
BEGIN
  INSERT INTO customer VALUES (auxCustomerId,auxName,auxCustomerAddress,auxPhone,auxPass,auxUserName,sysdate,auxCardNumber);
END;
/

SET SERVEROUTPUT ON;
DECLARE
  auxCustomerId NUMBER;
  auxName VARCHAR2(20);
  auxCustomerAddress VARCHAR2(20);
  auxPhone NUMBER;
  auxPass VARCHAR2(20);
  auxUserName VARCHAR2(20);
  auxCardNumber NUMBER;
BEGIN
  auxCustomerId := '&Customer_ID';
  auxName := '&Name';
  auxCustomerAddress := '&Address';
  auxPhone := '&Phone';
  auxPass := '&Password';
  auxUserName := '&User_Name';
  auxCardNumber := '&Card_Number';
  addCustomer_library(auxCustomerId,auxName,auxCustomerAddress,auxPhone,auxPass,auxUserName,auxCardNumber);
END;
/


------------------------------------- 04 CUSTOMER INFORMATION UPDATE -----------------------------------


CREATE OR REPLACE PROCEDURE updateInfoCusto_library(auxCustomer IN customer.customerid%TYPE, pNumber NUMBER, address VARCHAR2, newPass VARCHAR2)
IS
BEGIN
  UPDATE customer SET phone = pNumber, customeraddress = address, password = newPass WHERE customerid = auxCustomer;
END;
/

SET SERVEROUTPUT ON;
DECLARE
  auxCustomer customer.customerid%TYPE;
  pNumber NUMBER;
  address VARCHAR2(50);
  newPass VARCHAR2(20);
BEGIN
  auxCustomer := '&Customer_ID';
  pNumber := '&new_or_old_phone_number';
  address := '&new_or_old_address';
  newPass := '&new_or_old_password';
  updateInfoCusto_library(auxCustomer,pNumber,address,newPass);
END;
/


------------------------------------------ 05 VIEW CUSTOMER INFO ----------------------------------------


CREATE OR REPLACE PROCEDURE viewCustomer_library(auxCustomerID IN NUMBER)
IS
  custoName VARCHAR2(40);
  custoAdd VARCHAR2(50);
  custoPhone NUMBER(9);
  userNaM VARCHAR2(10);
  custoDate DATE;
  custoCard NUMBER;
BEGIN
  SELECT name,customeraddress,phone,username,datesignup,cardnumber
  INTO custoName, custoAdd, custoPhone, userNaM, custoDate, custoCard
  FROM customer
  WHERE customerid LIKE auxCustomerID;
  DBMS_OUTPUT.PUT_LINE('------------------------------------------');
  DBMS_OUTPUT.PUT_LINE('------------------------------------------');
  DBMS_OUTPUT.PUT_LINE('CUSTOMER ' || auxCustomerID || ' INFO');
  DBMS_OUTPUT.PUT_LINE('------------------------------------------');
  DBMS_OUTPUT.PUT_LINE('NAME           : ' || custoName);
  DBMS_OUTPUT.PUT_LINE('ADDRESS        : ' || custoAdd);
  DBMS_OUTPUT.PUT_LINE('PHONE          : ' || custoPhone);
  DBMS_OUTPUT.PUT_LINE('USER NAME      : ' || userNaM);
  DBMS_OUTPUT.PUT_LINE('DATE OF SIGN UP: ' || custoDate);
  DBMS_OUTPUT.PUT_LINE('CARD NUMBER    : ' || custoCard);
  DBMS_OUTPUT.PUT_LINE('------------------------------------------');
END;
/
SET SERVEROUTPUT ON;
DECLARE
  auxCustoID VARCHAR2(10);
BEGIN
  auxCustoID := '&CustomerID';
  viewCustomer_library(auxCustoID);
END;
/


--------------------------------------------- 06 CUSTOMER FINE------------------------------------------


CREATE OR REPLACE PROCEDURE customerAccount_library(custoID IN customer.customerid%TYPE)
IS
  auxCard NUMBER;
  auxFines NUMBER;
  auxItem VARCHAR(6);
  rented number := 0;
BEGIN
  SELECT cardnumber INTO auxCard FROM customer WHERE customerid LIKE custoID;
  SELECT COUNT(*) INTO rented FROM rent WHERE rent.cardid LIKE auxcard;
  
  DBMS_OUTPUT.PUT_LINE('The user card is ' || auxCard);  
  IF (rented > 0) THEN
    SELECT rent.itemid INTO auxItem FROM rent,card WHERE card.cardid = rent.cardid
    AND card.cardid LIKE auxCard;    
    DBMS_OUTPUT.PUT_LINE('The user has ' || auxItem || ' rented');
  ELSE    
    DBMS_OUTPUT.PUT_LINE('This user has no rents'); 
  END IF;
  
  SELECT fines INTO auxFines FROM card WHERE cardid LIKE auxcard;
  DBMS_OUTPUT.PUT_LINE('The user fines are ' || auxFines);
    
  EXCEPTION WHEN no_data_found THEN 
  DBMS_OUTPUT.PUT_LINE('NOT DATA FOUND');
END;
/

SET SERVEROUTPUT ON;
DECLARE
  custoID customer.customerid%TYPE;
BEGIN
  custoID := '&Customer_ID';
  customerAccount_library(custoID);
END;
/


-------------------------------------- 07 EMPLOYEE ADDING TRIGGER ---------------------------------------


CREATE OR REPLACE TRIGGER addCardEmp_library
AFTER INSERT ON employee FOR EACH ROW
DECLARE
BEGIN
  DBMS_OUTPUT.PUT_LINE('Card created');
END;
/


----------------------------------------------- 08 ADD EMPLOYEE  ---------------------------------------


CREATE OR REPLACE PROCEDURE addEmployee_library(auxEmployeeId IN NUMBER, auxEName IN VARCHAR2, auxEmployeeAddress IN VARCHAR2, auxEPhone IN NUMBER, auxEPass IN VARCHAR2, auxEUserName IN VARCHAR2, auxEBrance in VARCHAR2, auxEPaycheck IN NUMBER, auxECardNumber IN NUMBER)
IS
BEGIN
  INSERT INTO Employee VALUES (auxEmployeeId, auxEName, auxEmployeeAddress, auxEPhone, auxEPass, auxEUserName, auxEPaycheck, auxEBrance, auxECardNumber);
END;
/

SET SERVEROUTPUT ON;
DECLARE
  auxEmployeeId NUMBER;
  auxEName VARCHAR2(20);
  auxEmployeeAddress VARCHAR2(20);
  auxEPhone NUMBER;
  auxEPass VARCHAR2(20);
  auxEUserName VARCHAR2(10);
  auxEBrance VARCHAR2(20);
  auxEPaycheck NUMBER;
  auxECardNumber NUMBER;
BEGIN
  auxEmployeeId := '&Employee_ID';
  auxEName := '&Name';
  auxEmployeeAddress := '&Address';
  auxEPhone := '&Phone';
  auxEPass := '&Password';
  auxEUserName := '&User_Name';
  auxEBrance := '&Brance';
  auxEPaycheck := '&PayCheck';
  auxECardNumber := '&Card_Number';
  addEmployee_library(auxEmployeeId, auxEName, auxEmployeeAddress, auxEPhone, auxEPass, auxEUserName, auxEBrance, auxEPaycheck, auxECardNumber);
END;
/


---------------------------------- 09 EMPLOYEE INFORMATION UPDATE -------------------------------------


CREATE OR REPLACE PROCEDURE updateInfoEmp_library(auxEmployee IN employee.employeeid%TYPE, pNumber NUMBER, address VARCHAR2, newPass VARCHAR2, newPayCheck NUMBER,
newBranch VARCHAR2)
IS
BEGIN
  UPDATE employee SET phone = pNumber, employeeAddress = address, password = newPass, paycheck = auxEmployee, branchname = newBranch WHERE employeeid = auxEmployee;
END;
/

SET SERVEROUTPUT ON;
DECLARE
  auxEmployee employee.employeeid%TYPE;
  pNumber NUMBER;
  address VARCHAR2(50);
  newPass VARCHAR2(20);
  newPayCheck NUMBER;
  newBranch VARCHAR2(40);
BEGIN
  auxEmployee := '&Employee_ID';
  pNumber := '&new_or_old__phone_number';
  address := '&new_or_old_address';
  newPass := '&new_or_old_password';
  newPayCheck := '&new_or_old_paycheck';
  newBranch := '&new_or_old_branch';
  updateInfoEmp_library(auxEmployee,pNumber,address,newPass,newPayCheck,newBranch);
END;
/


--------------------------------------10 VIEW EMPLOYEE INFO . OBJECT-------------------------------------


CREATE OR REPLACE TYPE director_library AS OBJECT(
employeeid NUMBER,
name VARCHAR2(40),
address VARCHAR2(50),
phone INT(9),
paycheck NUMBER(10,2),
extrapaycheck NUMBER(10,2)
);
/
SET SERVEROUTPUT ON;
DECLARE 
   director director_library; 
BEGIN 
   director := director_library('212', 'CHANDLER', 'OUR HEARTHS', 688688688,1150.5,500); 
   dbms_output.put_line('DIRECTOR ID: '|| director.employeeid); 
   dbms_output.put_line('--------------------------------------------' ); 
   dbms_output.put_line('NAME: '|| director.name); 
   dbms_output.put_line('ADDRESS: '|| director.address); 
   dbms_output.put_line('PHONE: '|| director.phone); 
   dbms_output.put_line('PAYCHECK: '|| director.paycheck); 
   dbms_output.put_line('EXTRA: '|| director.extrapaycheck);
   dbms_output.put_line('--------------------------------------------' ); 
END;
/


-------------------------------------------- 11 EMPLOYEE FINE -------------------------------------------


CREATE OR REPLACE PROCEDURE employeeAccount_library(emploID IN employee.employeeid%TYPE)
IS
  auxCard NUMBER;
  auxFines NUMBER;
  auxItem VARCHAR(6);
  rented number := 0;
BEGIN
  SELECT cardnumber INTO auxCard FROM employee WHERE employeeid LIKE emploID;
  SELECT COUNT(*) INTO rented FROM rent WHERE rent.cardid LIKE auxcard;
  
  DBMS_OUTPUT.PUT_LINE('The user card is ' || auxCard);  
  IF (rented > 0) THEN
    SELECT rent.itemid INTO auxItem FROM rent,card WHERE card.cardid = rent.cardid
    AND card.cardid LIKE auxCard;    
    DBMS_OUTPUT.PUT_LINE('The user has ' || auxItem || ' rented');
  ELSE    
    DBMS_OUTPUT.PUT_LINE('This user has no rents'); 
  END IF;
  
  SELECT fines INTO auxFines FROM card WHERE cardid LIKE auxcard;
  DBMS_OUTPUT.PUT_LINE('The user fines are ' || auxFines);
    
  EXCEPTION WHEN no_data_found THEN 
  DBMS_OUTPUT.PUT_LINE('NOT DATA FOUND');
END;
/

SET SERVEROUTPUT ON;
DECLARE
  emploID employee.employeeid%TYPE;
BEGIN
  emploID := '&Employee_ID';
  employeeAccount_library(emploID);
END;
/


-------------------------------------------- 12 BOOK ADDING -------------------------------------------


CREATE OR REPLACE PROCEDURE addBook_library(auxISBN IN VARCHAR2, auxBookID IN VARCHAR2, auxState IN VARCHAR2, auxDebyCost IN NUMBER, auxLostCost IN NUMBER, auxAddress IN VARCHAR2)
IS
BEGIN
  INSERT INTO book VALUES(auxISBN,auxBookID,auxState,'A',auxDebyCost,auxLostCost,auxAddress);
  DBMS_OUTPUT.PUT_LINE('Book inserted correctly');
END;
/
SET SERVEROUTPUT ON;
DECLARE
  auxISBN VARCHAR2(4);
  auxItemID VARCHAR2(6);
  auxState VARCHAR2(10);
  auxDebyCost NUMBER(10,2);
  auxLostCost NUMBER(10,2);
  auxAddress VARCHAR2(50);
BEGIN
    auxISBN := '&ISBN';
    auxItemID := '&ItemID';
    auxState := '&State';
    auxDebyCost := '&Deby_Cost';
    auxLostCost := '&Lost_Cost';
    auxAddress := '&Location';
    addBook_library(auxISBN, auxItemID, auxState, auxDebyCost, auxLostCost, auxAddress);
END;
/


------------------------------------------------ 13 VIDEO ADDING -------------------------------------


CREATE OR REPLACE PROCEDURE addVideo_library(auxTitle IN VARCHAR2, auxYear IN INT, auxVideoID IN VARCHAR2, auxState IN VARCHAR2, auxDebyCost IN NUMBER, auxLostCost IN NUMBER, auxAddress IN VARCHAR2)
IS
BEGIN
  INSERT INTO video VALUES(auxTitle,auxYear,auxVideoID,auxState,'A',auxDebyCost,auxLostCost,auxAddress);
  DBMS_OUTPUT.PUT_LINE('Video inserted correctly');
END;
/
SET SERVEROUTPUT ON;
DECLARE
  auxTitle VARCHAR2(50);
  auxYear INT;
  auxItemID VARCHAR2(6);
  auxState VARCHAR2(10);
  auxDebyCost NUMBER(10,2);
  auxLostCost NUMBER(10,2);
  auxAddress VARCHAR2(50);
BEGIN
    auxTitle := '&Title';
    auxYear := '&Year';
    auxItemID := '&ItemID';
    auxState := '&State';
    auxDebyCost := '&Deby_Cost';
    auxLostCost := '&Lost_Cost';
    auxAddress := '&Location';
    addVideo_library(auxTitle, auxYear, auxItemID, auxState, auxDebyCost, auxLostCost, auxAddress);
END;
/


--------------------------- 14 CURSOR TO VIEW ALL BOOKS AND ALL VIDEOS ---------------------------------


CREATE OR REPLACE PROCEDURE allMedia_library(mediaType VARCHAR2)
IS
  CURSOR cBooks
  IS
    SELECT * FROM book;
  
  CURSOR cVideos
  IS
    SELECT * FROM video;
  
  xBooks cBooks%ROWTYPE;
  xVideos cVideos%ROWTYPE;
BEGIN
  IF mediaType LIKE 'books' THEN OPEN cBooks;
    DBMS_OUTPUT.PUT_LINE('ISBN     ID     STATE     AVALABILITY     DEBY_COST     LOST_COST    LOCATION');
    DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------------------------------');
    LOOP
      FETCH cBooks INTO xBooks;
      EXIT WHEN cBooks%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE(xBooks.isbn || '     ' || xBooks.bookid || '     ' || xBooks.state || '     ' || xBooks.avalability || '     ' || xBooks.debycost || '     ' ||
      xBooks.lostcost || '     ' || xBooks.address);
    END LOOP;
  ELSIF mediaType LIKE 'videos' THEN OPEN cVideos;
    DBMS_OUTPUT.PUT_LINE('TITLE     YEAR     ID     STATE     AVALABILITY     DEBY_COST     LOST_COST    LOCATION');
    DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------------------------------------');
    LOOP
      FETCH cVideos INTO xVideos;
      EXIT WHEN cVideos%NOTFOUND;
      
      DBMS_OUTPUT.PUT_LINE(xVideos.title || '     ' || xVideos.year || '     ' || xVideos.videoid || '     ' || xVideos.state || '     ' || xVideos.avalability || '     ' || xVideos.debycost || '     ' ||
      xVideos.lostcost || '     ' || xVideos.address);
    END LOOP;
  ELSE
    DBMS_OUTPUT.PUT_LINE('TYPE INCORRECT, you must choose between books or videos');
  END IF;
END;
/
SET SERVEROUTPUT ON;
DECLARE
  typeItem VARCHAR2(10);
BEGIN
  typeItem := '&Select_between_books_or_videos';
  allMedia_library(typeItem);
END;
/


----------------------------------------------- 15 VIEW ITEMS -------------------------------------------


CREATE OR REPLACE PROCEDURE viewItem_library(auxItemID IN VARCHAR2)
IS
  auxISBN VARCHAR2(4);
  auxTitle VARCHAR2(50);
  auxYear NUMBER;
  auxState VARCHAR2(10);
  auxDebyCost NUMBER(10,2);
  auxLostCost NUMBER(10,2);
  auxAddress VARCHAR2(50);
  auxAbala VARCHAR2(1);
  auxVideo NUMBER;
  auxBook NUMBER;
BEGIN
  
  SELECT COUNT(*) INTO auxBook FROM book WHERE bookid LIKE auxItemID;
  SELECT COUNT(*) INTO auxVideo FROM video WHERE videoid LIKE auxItemID;
  
  IF auxBook > 0 THEN
    SELECT isbn, state, avalability, debycost, lostcost, address INTO auxISBN, auxState,auxAbala, auxDebyCost, auxLostCost, auxAddress FROM book WHERE bookid LIKE auxItemID;
  
    DBMS_OUTPUT.PUT_LINE('BOOK ' || auxItemID || ' INFO');
    DBMS_OUTPUT.PUT_LINE('------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('ISBN: ' || auxISBN);
    DBMS_OUTPUT.PUT_LINE('STATE: ' || auxState);
    DBMS_OUTPUT.PUT_LINE('AVALABILITY: ' || auxAbala);
    DBMS_OUTPUT.PUT_LINE('DEBY COST: ' || auxDebyCost);
    DBMS_OUTPUT.PUT_LINE('LOST COST: ' || auxLostCost);
    DBMS_OUTPUT.PUT_LINE('ADDRESS: ' || auxAddress);
    DBMS_OUTPUT.PUT_LINE('------------------------------------------');

  ELSIF auxVideo > 0 THEN
    SELECT title, year, state, avalability, debycost, lostcost, address INTO auxTitle, auxYear, auxState, auxAbala, auxDebyCost, auxLostCost, auxAddress
    FROM video WHERE videoid LIKE auxItemID;
  
    DBMS_OUTPUT.PUT_LINE('VIDEO ' || auxItemID || ' INFO');
    DBMS_OUTPUT.PUT_LINE('------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('TITLE: ' || auxTitle);
    DBMS_OUTPUT.PUT_LINE('YEAR: ' || auxYear);
    DBMS_OUTPUT.PUT_LINE('STATE: ' || auxState);
    DBMS_OUTPUT.PUT_LINE('AVALABILITY: ' || auxAbala);
    DBMS_OUTPUT.PUT_LINE('DEBY COST: ' || auxDebyCost);
    DBMS_OUTPUT.PUT_LINE('LOST COST: ' || auxLostCost);
    DBMS_OUTPUT.PUT_LINE('ADDRESS: ' || auxAddress);
    DBMS_OUTPUT.PUT_LINE('------------------------------------------');

  END IF;
END;
/
SET SERVEROUTPUT ON;
DECLARE
  auxItemID VARCHAR2(10);
BEGIN
  auxItemID := '&Item_ID';
  viewItem_library(auxItemID);
END;
/


---------------------------------------- 16 REMOVE BOOK OR VIDEO ----------------------------------------


CREATE OR REPLACE PROCEDURE removeItem_library(auxItemID IN VARCHAR2)
IS
  auxBook NUMBER;
  auxVideo NUMBER;
BEGIN
  SELECT COUNT(*) INTO auxBook FROM book WHERE bookid LIKE auxItemID;
  SELECT COUNT(*) INTO auxVideo FROM video WHERE videoid LIKE auxItemID;
  
  IF auxBook > 0 THEN
    DELETE FROM book WHERE bookid LIKE auxItemID;
    DBMS_OUTPUT.PUT_LINE('Book removed correctly');
  ELSIF auxVideo > 0 THEN
    DELETE FROM video WHERE videoid LIKE auxItemID;
    DBMS_OUTPUT.PUT_LINE('Video removed correctly');
  END IF;
END;
/
SET SERVEROUTPUT ON;
DECLARE
  auxItemID VARCHAR2(10);
BEGIN
  auxItemID := '&ItemID_to_remove';
  removeItem_library(auxItemID);
END;
/


------------------------------------------------ 17 CUSTOMER LOGIN --------------------------------------


CREATE OR REPLACE PROCEDURE loginCustomer_library(user IN VARCHAR2, pass IN VARCHAR2)
IS
  passAux customer.password%TYPE;
BEGIN
  SELECT password INTO passAux FROM customer WHERE username LIKE user;

  IF passAux LIKE pass THEN
    DBMS_OUTPUT.PUT_LINE('User ' || user || ' loging succesfull');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Password incorrect');
  END IF;
  
  EXCEPTION WHEN no_data_found THEN 
  DBMS_OUTPUT.PUT_LINE('User incorrect');
END;
/
SET SERVEROUTPUT ON;
DECLARE
  user customer.username%TYPE;
  pass customer.password%TYPE;
BEGIN
  user := '&Username';
  pass := '&Password';
  loginCustomer_library(user,pass);
END;
/


----------------------------------------------- 18 EMPLOYEE LOGIN --------------------------------------


CREATE OR REPLACE PROCEDURE loginEmployee_library(user IN VARCHAR2, pass IN VARCHAR2)
IS
  passAux employee.password%TYPE;
BEGIN
  SELECT password INTO passAux FROM employee WHERE username LIKE user;
  
  IF passAux LIKE pass THEN
    DBMS_OUTPUT.PUT_LINE('User ' || user || ' loging succesfull');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Password incorrect');
  END IF;
  
  EXCEPTION WHEN no_data_found THEN 
  DBMS_OUTPUT.PUT_LINE('User incorrect');
END;
/

SET SERVEROUTPUT ON;
DECLARE
  user employee.username%TYPE;
  pass employee.password%TYPE;
BEGIN
  user := '&Username';
  pass := '&Password';
  loginEmployee_library(user,pass);
END;
/

--------------------------------- 19 RENT BOOK OR VIDEO FROM LIBRARY ------------------------------------


CREATE OR REPLACE PROCEDURE rentItem_library(auxCard IN NUMBER, auxItemID IN VARCHAR2, itemType IN VARCHAR2, auxDate IN DATE)
IS
  statusAux VARCHAR2(1);
  itemStatus VARCHAR2(1);
BEGIN
  SELECT status INTO statusAux FROM card WHERE cardid LIKE auxCard;
  IF statusAux LIKE 'A' THEN
    IF itemType LIKE 'book' THEN
      SELECT avalability INTO itemStatus FROM book WHERE bookid LIKE auxItemID;
      IF itemStatus LIKE 'A' THEN
        UPDATE book SET avalability = 'O' WHERE bookid LIKE auxItemID;
        INSERT INTO rent VALUES (auxCard,auxItemID,sysdate,auxDate);
        DBMS_OUTPUT.PUT_LINE('Item ' || auxItemID || ' rented');
      ELSE
        DBMS_OUTPUT.PUT_LINE('The item is already rented');
      END IF;
    ELSIF itemType LIKE 'video' THEN
      SELECT avalability INTO itemStatus FROM video WHERE videoid LIKE auxItemID;
      IF itemStatus LIKE 'A' THEN
        UPDATE video SET avalability = 'O' WHERE videoid LIKE auxItemID;
        INSERT INTO rent VALUES (auxCard,auxItemID,sysdate,auxDate);
        DBMS_OUTPUT.PUT_LINE('Item ' || auxItemID || ' rented');
      ELSE
        DBMS_OUTPUT.PUT_LINE('The item is already rented');
      END IF;
  ELSE
    DBMS_OUTPUT.PUT_LINE('The user is blocked');
  END IF;    
END IF;
END;
/
SET SERVEROUTPUT ON;
DECLARE
  auxCard NUMBER;
  auxItemID VARCHAR2(10);
  itemType VARCHAR2(20);
  auxDate DATE;
BEGIN
  auxCard := '&Card_ID';
  itemType := '&Item_Type_book_or_video';  
  auxItemID := '&ID_Item';  
  auxDate := '&Return_date';
  rentItem_library(auxCard,auxItemID,itemType,auxDate);
END;
/


------------------------------------------ 20 FINE PAYMENT----------------------------------------------


CREATE OR REPLACE PROCEDURE payFines_library(auxCard IN card.cardid%TYPE, money IN NUMBER)
IS
  finesAmount NUMBER;
  total NUMBER;
BEGIN
  SELECT fines INTO finesAmount FROM card WHERE cardid LIKE auxCard;
  
  IF finesAmount < money THEN total := money - finesAmount;
    DBMS_OUTPUT.PUT_LINE('YOU PAY ALL YOUR FINES AND YOU HAVE ' || total || ' MONEY BACK'); 
    UPDATE card SET status = 'A', fines = 0 WHERE cardid = auxCard; 
  ELSIF finesAmount = money THEN total := money - finesAmount;
    DBMS_OUTPUT.PUT_LINE('YOU PAY ALL YOUR FINES');
    UPDATE card SET status = 'A', fines = 0 WHERE cardid = auxCard;
  ELSE
    total := finesAmount - money;
    DBMS_OUTPUT.PUT_LINE('YOU WILL NEED TO PAY ' || total || ' MORE DOLLARS TO UNLOCK YOUR CARD');
    UPDATE card SET fines = total WHERE cardid = auxCard;
  END IF;
END;
/
SET SERVEROUTPUT ON;
DECLARE
  auxCard card.cardid%TYPE;
  money NUMBER;
BEGIN
  auxCard := '&Card_ID';
  money := '&Money_To_Pay';
  payFines_library(auxCard , money);
END;
/


--------------------------------------- 21 TRIGGER MODIFING LIBRARY AFTER FINES  -----------------------


CREATE OR REPLACE TRIGGER modifyFines_library
AFTER DELETE ON rent FOR EACH ROW
DECLARE
  auxCardID NUMBER;
  auxItemID VARCHAR2(6);
  auxBook NUMBER;
  auxVideo NUMBER;
  auxDeby NUMBER;
BEGIN  
  SELECT cardid, itemid INTO auxCardID, auxItemID FROM rent  WHERE cardid LIKE :old.cardid;
  SELECT COUNT(*) INTO auxBook FROM book WHERE bookid LIKE auxItemID;
  SELECT COUNT(*) INTO auxVideo FROM video WHERE videoid LIKE auxItemID;
  
  IF sysdate > :old.returndate THEN
    IF auxVideo > 0 THEN 
      SELECT debyCost INTO auxDeby FROM video WHERE videoid LIKE auxItemID;
    ELSIF auxBook > 0 THEN
      SELECT debyCost INTO auxDeby FROM book WHERE bookid LIKE auxItemID;
    END IF;
    UPDATE card SET status = 'B', fines = (fines + auxDeby)
    WHERE cardid LIKE auxCardID;
  ELSE
    DBMS_OUTPUT.PUT_LINE('The item has been return before deadline');
  END IF;
END;
/


----------------------------------------------- 22 HANDLE RETURNS ---------------------------------------


CREATE OR REPLACE PROCEDURE handleReturns_library(auxItemID IN VARCHAR2)
IS
  auxRented NUMBER;
  auxBook NUMBER;
  auxVideo NUMBER;
BEGIN
  SELECT COUNT(*) INTO auxRented FROM rent WHERE itemid LIKE auxItemID;
  SELECT COUNT(*) INTO auxBook FROM book WHERE bookid LIKE auxItemID;
  SELECT COUNT(*) INTO auxVideo FROM video WHERE videoid LIKE auxItemID;
  
  IF auxRented > 0 THEN
    DELETE FROM rent WHERE itemid = auxItemID;
    IF auxBook > 0 THEN
      UPDATE book SET avalability = 'A' WHERE bookid LIKE auxItemID;
      DBMS_OUTPUT.PUT_LINE('The book ' || auxItemID || ' is now avaible.');
    ELSIF auxVideo > 0 THEN
      UPDATE video SET avalability = 'A' WHERE videoid LIKE auxItemID;
      DBMS_OUTPUT.PUT_LINE('The video ' || auxItemID || ' is now avaible.');
    END IF;
  ELSE
    DBMS_OUTPUT.PUT_LINE('This item is not rented at the moment');
  END IF;
  EXCEPTION WHEN no_data_found THEN 
  DBMS_OUTPUT.PUT_LINE('Item ID incorrect');    
END;
/
SET SERVEROUTPUT ON;
DECLARE
  auxItemID VARCHAR2(10);
BEGIN
  auxItemID := '&ItemID_to_return';
  handleReturns_library(auxItemID);
END;
/


-------------------------------------------------------------------------------------------------------



























