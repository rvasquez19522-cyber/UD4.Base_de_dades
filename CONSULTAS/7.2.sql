SELECT 
    Tiquet.NumeroFactura,
    Tiquet.DataHoraVenda,
    Empleat.Nom AS NomEmpleat,
    Tiquet.TotalIVA
FROM 
    Tiquet
JOIN 
    Empleat ON Tiquet.EmpleatID = Empleat.EmpleatID
JOIN 
    LiniaTiquet ON Tiquet.TiquetID = LiniaTiquet.TiquetID
JOIN 
    Producte ON LiniaTiquet.CodiProducte = Producte.CodiProducte
WHERE 
    Producte.Descripcio = 'Llet 1L';