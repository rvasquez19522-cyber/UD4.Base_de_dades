Use Ex6;
SELECT 
    Passatger.Nom AS "Nom del Passatger",
    Reserva.NumeroVol AS "Número de Vol",
    Reserva.ImportTotal AS "Import Total",
    (Reserva.ImportTotal * 0.90) AS "Import amb Descompte"
FROM 
    Reserva	
JOIN 
    Passatger ON Reserva.PassatgerDNI = Passatger.DNI_Passaport;