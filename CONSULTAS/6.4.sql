Use Ex6;

SELECT 
    Reserva.ReservaID,
    Passatger.Nom,
    Passatger.Cognoms,
    Reserva.NumeroVol,
    Reserva.ImportTotal
FROM 
    Reserva
JOIN 
    Passatger ON Reserva.PassatgerDNI = Passatger.DNI_Passaport
JOIN 
    Vol ON Reserva.NumeroVol = Vol.NumeroVol
WHERE 
    Vol.DataSortida = '2022-05-06';