-- DATABASE: gans_local_database
-- PURPOSE: Store static and dynamic data for GANS project

-- Drop and recreate database
DROP DATABASE IF EXISTS gans_local_database;
CREATE DATABASE gans_local_database;
USE gans_local_database;

-- CITIES (STATIC)

DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
    city_id INT AUTO_INCREMENT PRIMARY KEY,
    city VARCHAR(100) NOT NULL,
    latitude DECIMAL(9,6),
    longitude DECIMAL(9,6)
);

-- Insert cities
INSERT INTO cities (city, latitude, longitude) VALUES
('Hamburg', 53.551086, 9.993682),
('Leipzig', 51.339695, 12.373075),
('Frankfurt', 50.110924, 8.682127),
('Stuttgart', 48.775846, 9.182932);
SELECT * FROM cities;

-- POPULATION (STATIC, APPENDABLE)

DROP TABLE IF EXISTS population;
CREATE TABLE population (
    population_id INT AUTO_INCREMENT PRIMARY KEY,
    city_id INT NOT NULL,
    city VARCHAR(255) NOT NULL,
    population BIGINT NULL,
    timestamp_population DATE NOT NULL,
    FOREIGN KEY (city_id) REFERENCES cities(city_id) ON DELETE CASCADE,
    UNIQUE KEY unique_city_date (city_id, timestamp_population)  -- prevent duplicates per day
);

SELECT * FROM population;

-- WEATHER (DYNAMIC, APPENDABLE)
DROP TABLE IF EXISTS weather;
CREATE TABLE weather (
    forecast_id INT AUTO_INCREMENT PRIMARY KEY,
    city_id INT NOT NULL,                          
    forecast_datetime DATETIME NOT NULL,           
    collected_datetime DATETIME NOT NULL,          
    temp_Celsius FLOAT,                            
    feels_like_Celsius FLOAT,                      
    humidity FLOAT,                                
    wind_speed_mps FLOAT,                          
    weather_desc VARCHAR(255),                     
    precipitation_probability FLOAT,               
    rain_in_last_3h FLOAT,                         
    FOREIGN KEY (city_id) REFERENCES cities(city_id) ON DELETE CASCADE,
    UNIQUE KEY unique_forecast (city_id, forecast_datetime) -- prevent duplicate forecasts
);

SELECT * FROM weather;


-- AIRPORTS (STATIC)
DROP TABLE IF EXISTS airports;
CREATE TABLE airports (
    airport_id INT AUTO_INCREMENT PRIMARY KEY,
    icao_code VARCHAR(10) NOT NULL,
    name VARCHAR(255),                             
    city_id INT NOT NULL,                          
    latitude DECIMAL(10,6),                       
    longitude DECIMAL(10,6),
    FOREIGN KEY (city_id) REFERENCES cities(city_id) ON DELETE CASCADE,
    UNIQUE KEY unique_icao (icao_code)             -- ICAO is globally unique
);

SELECT * FROM airports;

-- FLIGHTS (DYNAMIC, APPENDABLE)
DROP TABLE IF EXISTS flights;
CREATE TABLE flights (
    flight_id INT AUTO_INCREMENT PRIMARY KEY,
    arrival_airport_icao VARCHAR(4) NOT NULL,
    departure_airport_icao VARCHAR(4),
    scheduled_arrival_time DATETIME,
    flight_number VARCHAR(50),
    data_retrieved_at DATETIME,
    UNIQUE KEY unique_flight (arrival_airport_icao, flight_number, scheduled_arrival_time)
);

SELECT * FROM flights;
