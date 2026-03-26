USE Ex5;
INSERT INTO Client (DNI, Nom, Cognoms, Adreça, Població, Usuari, Contrasenya, NumeroVehicles)
VALUES 
('87654321B', 'Maria', 'Martinez', 'Carrer Nou, 2', 'Inca', 'mariamartinez', 'password456', 1),
('11223344C', 'Pere', 'López', 'Avinguda Principal, 3', 'Manacor', 'perelopez', 'password789', 3);


INSERT INTO Email (Email, ClientDNI)
VALUES 
('joan.garcia2@example.com', '12345678A'),
('maria.martinez@example.com', '87654321B'),
('pere.lopez@example.com', '11223344C');

INSERT INTO Telefon (Telefon, ClientDNI)
VALUES 
('600654321', '12345678A'),
('700123456', '87654321B'),
('800123456', '11223344C');

INSERT INTO Vehicle (Matricula, Tipus, Marca, ClientDNI)
VALUES 
('5678DEF', 'furgoneta', 'Ford', '12345678A'),
('9101GHI', 'motocicleta', 'Honda', '87654321B'),
('1121JKL', 'ciclomotor', 'Yamaha', '11223344C'),
('3141MNO', 'quad', 'Polaris', '11223344C'),
('5161PQR', 'turisme', 'BMW', '11223344C');

INSERT INTO Cita (DataHora, MatriculaVehicle, ClientDNI)
VALUES 
('2024-01-16 11:00:00', '5678DEF', '12345678A'),
('2024-01-17 12:00:00', '9101GHI', '87654321B'),
('2024-01-18 13:00:00', '1121JKL', '11223344C'),
('2024-01-19 14:00:00', '3141MNO', '11223344C'),
('2024-01-20 15:00:00', '5161PQR', '11223344C');

Select * From Cita;
Select * From Client;
Select * From Email;
Select * From Telefon;
Select * From Vehicle;
