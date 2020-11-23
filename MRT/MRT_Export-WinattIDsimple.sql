/* MRT_Export-WinattIDsimple.sql
/*
/* Creates a table with all the recovered records from transits in the WinattID format.
/* Each field is printed as a column.
*/

USE MRT 
SELECT CONCAT(
	RIGHT(T37VARCO,3), --Varco
	T37BADGE, --Badge
	T37ENTRAESCE-1, --EntraEsce(0,1)		
	CASE T37CAUSALE	-- Causale
		WHEN '' THEN '0000'
		END,
	SUBSTRING(T37DATAORA,7,2), -- Data ora (GG)
	SUBSTRING(T37DATAORA,5,2), -- Data ora (MM)
	SUBSTRING(T37DATAORA,3,2), -- Data ora (YY)
	SUBSTRING(T37DATAORA,9,2), -- Data ora (HH)
	SUBSTRING(T37DATAORA,11,2) -- Data ora (mm)
	)
 FROM T37ACCTRANSITI 
 WHERE /* Filters here */
