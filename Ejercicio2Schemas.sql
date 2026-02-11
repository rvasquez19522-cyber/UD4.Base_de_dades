SELECT c.Data, c.Despatx, c.Diagnostic,
       p.Nom AS Nom_Pacient, p.Cognoms AS Cognoms_Pacient,
       m.Nom AS Nom_Metge, m.Cognoms AS Cognoms_Metge
FROM `excercici2.A`.Consulta c
JOIN `excercici2.A`.PACIENT p ON c.PACIENT_ID = p.ID
JOIN `excercici2.A`.Metge m ON c.Metge_ID = m.ID;
