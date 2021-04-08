CREATE TABLE patient_info ( 
    patient_id varchar(10) NOT NULL, 
    sex varchar(10), 
    age int, 
    province varchar(20),
    city varchar(20),
    infection_case varchar(100),
    PRIMARY KEY (patient_id)
);

LOAD DATA LOCAL INFILE './covid/patient_info.csv'
INTO TABLE patient_info
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;


CREATE TABLE search_trend (
    date date NOT NULL,
    cold float,
    flu float,
    pneumonia float,
    coronavirus float,
    PRIMARY KEY (date)
);

LOAD DATA LOCAL INFILE './covid/search_trend.csv'
INTO TABLE search_trend
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@date_str, cold, flu, pneumonia, coronavirus)
SET date = STR_TO_DATE(@date_str, '%Y-%m-%d');


CREATE TABLE time (
    date date NOT NULL,
    test int,
    negative int,
    confirmed int,
    released int,
    deceased int,
    PRIMARY KEY (date)
);

LOAD DATA LOCAL INFILE './covid/time.csv'
INTO TABLE time
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@date_str, test, negative, confirmed, released, deceased)
SET date = STR_TO_DATE(@date_str, '%Y-%m-%d');


CREATE TABLE time_age (
    date date NOT NULL,
    age int NOT NULL,
    confirmed int,
    deceased int,
    PRIMARY KEY (date, age)
);

LOAD DATA LOCAL INFILE './covid/time_age.csv'
INTO TABLE time_age
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@date_str, age, confirmed, deceased)
SET date = STR_TO_DATE(@date, '%Y-%m-%d');


CREATE TABLE time_gender (
    date date NOT NULL,
    sex varchar(10) NOT NULL,
    comfirmed int,
    deceased int,
    PRIMARY KEY (date, sex)
);

LOAD DATA LOCAL INFILE './covid/time_gender.csv'
INTO TABLE time_gender
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@date_str, sex, confirmed, deceased)
SET date = STR_TO_DATE(@date_str, '%Y-%m-%d');

CREATE TABLE time_province (
    date date NOT NULL,
    province varchar(20) NOT NULL,
    confirmed int,
    released int,
    deceased int,
    PRIMARY KEY (date, province)
);

LOAD DATA LOCAL INFILE './covid/time_province.csv'
INTO TABLE time_province
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@date_str, province, confirmed, released, deceased)
SET date = STR_TO_DATE(@date_str, '%Y-%m-%d');


CREATE TABLE region (
    code int NOT NULL,
    province varchar(20),
    city varchar(20),
    elementary_school_count int,
    kindergarten_count int,
    university_count int,
    elderly_population_ratio float,
    elderly_alone_ratio float,
    nursing_home_count int,
    PRIMARY KEY (code)
);

LOAD DATA LOCAL INFILE './covid/region.csv'
INTO TABLE region
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;


CREATE TABLE weather (
    code int NOT NULL,
    date date,
    avg_temp float,
    most_wind_direction int,
    avg_relative_humidity float,
    PRIMARY KEY (code, date),
    FOREIGN KEY (code) REFERENCES region(code) 
);

LOAD DATA LOCAL INFILE './covid/weather.csv'
INTO TABLE weather
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(code, @date_str, avg_temp, most_wind_direction, avg_relative_humidity)
SET date = STR_TO_DATE(@date_str, '%Y-%m-%d');




