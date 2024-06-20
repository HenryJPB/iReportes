SELECT rif,cedulaID,alias,nroSSO 
FROM DESICA.NomTrabajador01_Dat
inner join DESICA.NomTrabajador00_Dat 
on DESICA.NomTrabajador01_Dat.nroTrabajador = DESICA.NomTrabajador00_Dat.nroTrabajador
order by alias