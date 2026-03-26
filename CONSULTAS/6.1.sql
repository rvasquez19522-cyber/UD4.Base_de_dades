Use Ex6;
SELECT 
    Passatger.DNI_Passaport,
    Passatger.Nom,
    Passatger.Cognoms,
    Vol.NumeroVol,
    Vol.Origen,
    Vol.Desti,
    Reserva.ImportTotal
FROM 
    Reserva
JOIN 
    Passatger ON Reserva.PassatgerDNI = Passatger.DNI_Passaport
JOIN 
    Vol ON Reserva.NumeroVol = Vol.NumeroVol;