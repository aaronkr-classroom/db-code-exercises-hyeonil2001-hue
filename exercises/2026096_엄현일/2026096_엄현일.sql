
-- DB Final Project Skeleton
-- Student Name: 엄현일
-- Student ID: 2026096

-- 1. CREATE TABLE

CREATE TABLE class_code (
    code INT PRIMARY KEY,
    class VARCHAR(20),
    basis VARCHAR(50)
);

CREATE TABLE task_code (
    code INT PRIMARY KEY,
    task VARCHAR(50)
);

-- TODO: customer
CREATE TABLE customer (
    cus_id VARCHAR(15) PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    cell CHAR(13) NOT NULL UNIQUE,
    addr VARCHAR(100),
    c_code INT DEFAULT 3
);

-- TODO: staff
CREATE TABLE staff (
    staff_id INT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    birthday INT NOT NULL,
    tel CHAR(12),
    salary INT,
    t_code INT NOT NULL,
    hire_date CHAR(8) NOT NULL
);

-- TODO: tour
CREATE TABLE tour (
    tour_num CHAR(8) PRIMARY KEY,
    departure VARCHAR(50) NOT NULL,
    arrival VARCHAR(50) NOT NULL,
    program VARCHAR(100),
    start_dt DATE NOT NULL,
    end_dt DATE NOT NULL,
    min_num INT,
    max_num INT,
    expense INT NOT NULL,
    deposit INT,
    dept_yn CHAR(1) DEFAULT 'N',
    staff_id INT,
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);

-- TODO: reserve
CREATE TABLE reserve (
    cus_id VARCHAR(15),
    tour_num CHAR(8),
    res_date CHAR(8) DEFAULT TO_CHAR(CURRENT_DATE, 'YYYYMMDD'),
    dep_yn CHAR(1) DEFAULT 'N',
    exp_yn CHAR(1) DEFAULT 'N',
    PRIMARY KEY (cus_id, tour_num),
    FOREIGN KEY (cus_id) REFERENCES customer(cus_id),
    FOREIGN KEY (tour_num) REFERENCES tour(tour_num)
);

-- 2. INSERT DATA

-- TODO: Insert at least 5 rows into each table
INSERT INTO class_code (code, class, basis) VALUES
(1, '최우수', '누적예약 10회 이상'),
(2, '우수', '누적예약 5회 이상'),
(3, '일반', '신규 및 일반 고객');

INSERT INTO task_code (code, task) VALUES
(1, '여행상품관리'),
(2, '예약관리'),
(3, '관광버스배차관리'),
(4, '직원관리'),
(5, '고객관리');

INSERT INTO customer (cus_id, name, cell, addr, c_code) VALUES
('user01', '김철수', '010-1111-1111', '서울시 강남구', 1),
('user02', '이영희', '010-2222-2222', '부산시 해운대구', 2),
('user03', '박민수', '010-3333-3333', '대구시 수성구', 3),
('user04', '최지민', '010-4444-4444', '인천시 연수구', 3),
('user05', '정다은', '010-5555-5555', '광주시 서구', 2);

INSERT INTO staff (staff_id, name, birthday, tel, salary, t_code, hire_date) VALUES
(10001, '홍길동', 850101, '02-111-1111', 3000000, 1, '20100101'),
(10002, '김직원', 900515, '02-222-2222', 2800000, 2, '20150301'),
(10003, '이대리', 881120, '02-333-3333', 3500000, 3, '20120510'),
(10004, '박과장', 820707, '02-444-4444', 4000000, 4, '20081101'),
(10005, '최사원', 950228, '02-555-5555', 2500000, 5, '20200115');

INSERT INTO tour (tour_num, departure, arrival, program, start_dt, end_dt, min_num, max_num, expense, deposit, dept_yn, staff_id) VALUES
('T0000001', '서울', '제주도', '제주도 3박 4일 패키지', '2026-07-01', '2026-07-04', 10, 30, 500000, 50000, 'Y', 10001),
('T0000002', '부산', '강릉', '강릉 바다여행 1박 2일', '2026-08-10', '2026-08-11', 15, 45, 150000, 15000, 'N', 10001),
('T0000003', '대구', '경주', '경주 역사 탐방', '2026-09-05', '2026-09-05', 20, 40, 80000, 8000, 'Y', 10001),
('T0000004', '서울', '부산', '부산 맛집 투어 2박 3일', '2026-10-01', '2026-10-03', 10, 25, 350000, 35000, 'N', 10001),
('T0000005', '인천', '전주', '전주 한옥마을 투어', '2026-11-15', '2026-11-16', 15, 30, 120000, 12000, 'Y', 10001);

INSERT INTO reserve (cus_id, tour_num, res_date, dep_yn, exp_yn) VALUES
('user01', 'T0000001', '20260601', 'Y', 'Y'),
('user02', 'T0000001', '20260602', 'Y', 'N'),
('user03', 'T0000002', '20260605', 'Y', 'Y'),
('user04', 'T0000003', '20260610', 'N', 'N'),
('user05', 'T0000005', '20260612', 'Y', 'N');

-- 3. INDEX

-- TODO: CREATE INDEX
CREATE INDEX tour_arrival_idx ON tour (arrival ASC);

-- 4. TEST QUERIES

-- Customer Grade Search
SELECT c.name, cl.class 
FROM customer c
JOIN class_code cl ON c.c_code = cl.code
WHERE c.cus_id = 'user01';

-- Employee Task Search
SELECT s.name, t.task 
FROM staff s
JOIN task_code t ON s.t_code = t.code
WHERE s.staff_id = 10001;

-- Tour Reservation Search
SELECT c.name, r.res_date, r.dep_yn 
FROM reserve r
JOIN customer c ON r.cus_id = c.cus_id
WHERE r.tour_num = 'T0000001';

-- Assigned Driver Search
SELECT t.departure, d.name, d.cell 
FROM tour t
JOIN assign_driver ad ON t.tour_num = ad.tour_num
JOIN driver d ON ad.driver_id = d.driver_id
WHERE t.tour_num = 'T0000001';

-- INSERT example
INSERT INTO customer (cus_id, name, cell) 
VALUES ('user06', '새고객', '010-6666-6666');

-- UPDATE example
UPDATE staff 
SET salary = salary + 200000 
WHERE staff_id = 10001;

-- DELETE example
DELETE FROM reserve 
WHERE cus_id = 'user04' AND tour_num = 'T0000003';

-- 5. BONUS TABLES (Optional)

-- driver
CREATE TABLE driver (
    driver_id INT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    birthday CHAR(6) NOT NULL,
    cell CHAR(13) NOT NULL,
    pay INT DEFAULT 15000,
    cont_date CHAR(8),
    cont_term CHAR(8)
);

CREATE INDEX driver_name_idx ON driver (name ASC);

INSERT INTO driver (driver_id, name, birthday, cell, pay, cont_date, cont_term) VALUES
(20001, '김기사', '700101', '010-7777-7777', 16000, '20200101', '12'),
(20002, '박운전', '750215', '010-8888-8888', 15000, '20210301', '24'),
(20003, '이베스트', '800505', '010-9999-9999', 18000, '20190510', '36'),
(20004, '최드라이브', '720910', '010-1234-5678', 15000, '20220101', '12'),
(20005, '정안전', '781225', '010-9876-5432', 17000, '20201111', '24');

-- tour_bus
CREATE TABLE tour_bus (
    bus_id INT PRIMARY KEY,
    seat INT,
    del_year INT
);

INSERT INTO tour_bus (bus_id, seat, del_year) VALUES
(11, 45, 2018),
(12, 28, 2020),
(13, 45, 2019),
(14, 30, 2022),
(15, 45, 2021);

-- assign_driver
CREATE TABLE assign_driver (
    tour_num CHAR(8) PRIMARY KEY,
    driver_id INT,
    work_hour INT,
    FOREIGN KEY (tour_num) REFERENCES tour(tour_num),
    FOREIGN KEY (driver_id) REFERENCES driver(driver_id)
);

INSERT INTO assign_driver (tour_num, driver_id, work_hour) VALUES
('T0000001', 20001, 40),
('T0000002', 20002, 16),
('T0000003', 20003, 10),
('T0000004', 20004, 24),
('T0000005', 20005, 16);

-- assign_bus
CREATE TABLE assign_bus (
    tour_num CHAR(8) PRIMARY KEY,
    bus_id INT,
    FOREIGN KEY (tour_num) REFERENCES tour(tour_num),
    FOREIGN KEY (bus_id) REFERENCES tour_bus(bus_id)
);

INSERT INTO assign_bus (tour_num, bus_id) VALUES
('T0000001', 11),
('T0000002', 12),
('T0000003', 13),
('T0000004', 14),
('T0000005', 15);

----
TABLE class_code;
TABLE task_code;
TABLE customer;
TABLE staff;
TABLE tour;
TABLE reserve;

TABLE driver;
TABLE tour_bus;
TABLE assign_driver;
TABLE assign_bus;