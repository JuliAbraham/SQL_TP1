-- Creación de la base de datos
CREATE DATABASE hotel_management;

-- Selección de la base de datos
USE hotel_management;

-- Creación de la tabla hoteles
CREATE TABLE hotels (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  location VARCHAR(255) NOT NULL,
  contact_info VARCHAR(255)
);

-- Creación de la tabla clients
CREATE TABLE clients (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  address VARCHAR(255),
  contact_info VARCHAR(255)
);

-- Creación de la tabla rooms
CREATE TABLE rooms (
  id INT AUTO_INCREMENT PRIMARY KEY,
  hotel_id INT,
  room_number VARCHAR(50) NOT NULL,
  type VARCHAR(50),
  price DECIMAL(10, 2),
  FOREIGN KEY (hotel_id) REFERENCES hotels(id)
);

-- Creación de la tabla reservations
CREATE TABLE reservations (
  id INT AUTO_INCREMENT PRIMARY KEY,
  client_id INT,
  room_id INT,
  check_in_date DATE,
  check_out_date DATE,
  total_price DECIMAL(10, 2),
  FOREIGN KEY (client_id) REFERENCES clients(id),
  FOREIGN KEY (room_id) REFERENCES rooms(id)
);

-- Creación de la tabla services
CREATE TABLE services (
  id INT AUTO_INCREMENT PRIMARY KEY,
  hotel_id INT,
  service_name VARCHAR(255) NOT NULL,
  price DECIMAL(10, 2),
  FOREIGN KEY (hotel_id) REFERENCES hotels(id)
);

-- Creación de la tabla reservation_services
CREATE TABLE reservation_services (
  reservation_id INT,
  service_id INT,
  PRIMARY KEY (reservation_id, service_id),
  FOREIGN KEY (reservation_id) REFERENCES reservations(id),
  FOREIGN KEY (service_id) REFERENCES services(id)
);

-- Creación de la tabla hotel_services
CREATE TABLE hotel_services (
  hotel_id INT,
  service_id INT,
  PRIMARY KEY (hotel_id, service_id),
  FOREIGN KEY (hotel_id) REFERENCES hotels(id),
  FOREIGN KEY (service_id) REFERENCES services(id)
);
