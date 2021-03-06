/* MRT_Export-WinattIDsimple.sql
/* 
/* Crea una tabella con tutte le timbrature recuperate, nel formato WinattID.
/* Le timbrature vengono 'ricostruite' dalla tabella dei transiti.
*/

USE MRT 
SELECT CONCAT(
	RIGHT(T37VARCO,3), --Varco
	T37BADGE, --Badge
	T37ENTRAESCE-1, --EntraEsce(0,1)		
	CASE T37CAUSALE	-- Causale
		WHEN '' THEN '0000'
		ELSE T37CAUSALE
		END,
	SUBSTRING(T37DATAORA,7,2), -- Data ora (GG)
	SUBSTRING(T37DATAORA,5,2), -- Data ora (MM)
	SUBSTRING(T37DATAORA,3,2), -- Data ora (YY)
	SUBSTRING(T37DATAORA,9,2), -- Data ora (HH)
	SUBSTRING(T37DATAORA,11,2) -- Data ora (mm)
	)
 FROM T37ACCTRANSITI 
 WHERE /* Filters here */
