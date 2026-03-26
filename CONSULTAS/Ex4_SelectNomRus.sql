use Ex4;
SELECT count(*) from Polisa,Client where Client.idClient=Polisa.Client_idClient and Client.Nom like "Russel";