SELECT NomEmpresa_Dat.rif as rifEmpresa,
       razonSocial,
       NomTrabajador01_Dat.tipoNomina as codNomina,
       NomTiposNomina_Dat.nombreNomina as nombreNomina,
       concat_ws(" ",nombre1,nombre2,apellido1,apellido2) as nombreTrab,
       CASE NomConcepto_Dat.asignacion
            WHEN "S" THEN NomConcepto_Dat.codConcepto
       END as codConceptoAsig,
       CASE NomConcepto_Dat.asignacion
            WHEN "S" THEN NomConcepto_Dat.descripcion
       END as descripcionAsig,
       Sum(
       CASE NomConcepto_Dat.asignacion
            WHEN "S" THEN NomConceptoHist_Dat.total
       END ) as sumAsig,
       CASE NomConcepto_Dat.asignacion
            WHEN "N" THEN NomConcepto_Dat.codConcepto
       END as codConceptoDeduc,
       CASE NomConcepto_Dat.asignacion
            WHEN "N" THEN NomConcepto_Dat.descripcion
       END as descripcionDeduc,
       Sum(
       CASE NomConcepto_Dat.asignacion
            WHEN "N" THEN NomConceptoHist_Dat.total
       END ) as sumDeduc
FROM   NomEmpresa_Dat, NomTiposNomina_Dat, NomTrabajador01_Dat, NomConceptoHist_Dat, NomConcepto_Dat
WHERE  NomEmpresa_Dat.rif = "J-41309179-8"
AND    NomTiposNomina_Dat.rifEmpresa = NomEmpresa_Dat.rif
AND    NomTrabajador01_Dat.rifEmpresa = NomEmpresa_Dat.rif
AND    NomConceptoHist_Dat.rifEmpresa = NomEmpresa_Dat.rif
AND    NomConcepto_Dat.rifEmpresa = NomEmpresa_Dat.rif
AND    NomTrabajador01_Dat.tipoNomina = NomTiposNomina_Dat.codNomina
AND    NomConceptoHist_Dat.codNomina = NomTrabajador01_Dat.tipoNomina
AND    NomConcepto_Dat.codNomina = NomTrabajador01_Dat.tipoNomina
AND    NomConceptoHist_Dat.nroTrabajador = NomTrabajador01_Dat.nroTrabajador
AND    NomConceptoHist_Dat.codConcepto = NomConcepto_Dat.codConcepto
AND    NomConceptoHist_Dat.codNomina = 1
AND    NomConceptoHist_Dat.fechaNomina ="2020-09-20" 
AND    NomConcepto_Dat.codConcepto >= 100
AND    NomConceptoHist_Dat.total > 0.00
GROUP  BY NomTrabajador01_Dat.tipoNomina, NomConceptoHist_Dat.nroTrabajador, NomConceptoHist_Dat.codConcepto, NomConcepto_Dat.asignacion
ORDER  BY NomTrabajador01_Dat.tipoNomina, NomConceptoHist_Dat.nroTrabajador, NomConceptoHist_Dat.codConcepto, NomConcepto_Dat.asignacion
