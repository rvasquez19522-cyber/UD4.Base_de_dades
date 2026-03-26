USe Ex6;
SELECT 
    Avio.AvioID,
    Avio.Model,
    Avio.Capacitat,
    Vol.NumeroVol,
    Vol.Origen,
    Vol.Desti,
    Vol.DataSortida,
    Vol.HoraArribada
FROM 
    Avio
JOIN 
    Vol ON Avio.AvioID = Vol.AvioID
WHERE 
    Avio.Model LIKE 'Airbus%';