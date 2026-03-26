SELECT 
    COUNT(*) AS NombreLiniesTiquet
FROM 
    LiniaTiquet
JOIN 
    Tiquet ON LiniaTiquet.TiquetID = Tiquet.TiquetID
JOIN 
    Empleat ON Tiquet.EmpleatID = Empleat.EmpleatID
WHERE 
    Empleat.Nom LIKE 'A%' AND Tiquet.DataHoraVenda < CURDATE();