SELECT NomEmpresa_Dat.rif as rifEmpresa,
       razonSocial,
       NomTrabajador01_Dat.tipoNomina as codNomina,
       NomTiposNomina_Dat.nombreNomina as nombreNomina,
       NomTiposNomina_Dat.ultimaRotacion,
       NomTiposNomina_Dat.proxRotacion,
       NomConceptoHist_Dat.nroTrabajador as nroTrabajador,
       concat_ws(" ",nombre1,nombre2,apellido1,apellido2) as nombreTrab,
       CASE NomConcepto_Dat.asignacion
            WHEN "S" THEN NomConcepto_Dat.codConcepto
       END as codConceptoAsig,
       CASE NomConcepto_Dat.asignacion
            WHEN "S" THEN NomConcepto_Dat.descripcion
       END as descripcionAsig,
       CASE NomConcepto_Dat.asignacion
            WHEN "S" THEN NomConceptoHist_Dat.total
       END as totalAsig,
       CASE NomConcepto_Dat.asignacion
            WHEN "N" THEN NomConcepto_Dat.codConcepto
       END as codConceptoDeduc,
       CASE NomConcepto_Dat.asignacion
            WHEN "N" THEN NomConcepto_Dat.descripcion
       END as descripcionDeduc,
       CASE NomConcepto_Dat.asignacion
            WHEN "N" THEN NomConceptoHist_Dat.total
       END as totalDeduc,
       ( SELECT monto
         FROM   NomAsigConcepto_Dat
         WHERE  codConcepto = $P{p_aux_sueldo}
         AND    rifEmpresa = NomEmpresa_Dat.rif
         AND    codNomina  = NomTrabajador01_Dat.tipoNomina
         AND    nroTrabajador = NomTrabajador00_Dat.nroTrabajador )  as sueldo
FROM   NomEmpresa_Dat, NomTiposNomina_Dat, NomTrabajador00_Dat, NomTrabajador01_Dat, NomConceptoHist_Dat, NomConcepto_Dat
WHERE  NomEmpresa_Dat.rif like $P{p_empresa}
AND    NomTiposNomina_Dat.rifEmpresa = NomEmpresa_Dat.rif
AND    NomTrabajador00_Dat.rifEmpresa = NomEmpresa_Dat.rif
AND    NomTrabajador01_Dat.rifEmpresa = NomEmpresa_Dat.rif
AND    NomConceptoHist_Dat.rifEmpresa = NomEmpresa_Dat.rif
AND    NomConcepto_Dat.rifEmpresa = NomEmpresa_Dat.rif
AND    NomTrabajador01_Dat.tipoNomina = NomTiposNomina_Dat.codNomina
AND    NomConceptoHist_Dat.codNomina = NomTrabajador01_Dat.tipoNomina
AND    NomConcepto_Dat.codNomina = NomTrabajador01_Dat.tipoNomina
AND    NomTrabajador00_Dat.nroTrabajador BETWEEN $P{p_trabajador1} AND $P{p_trabajador2}
AND    NomTrabajador00_Dat.nroTrabajador = NomTrabajador01_Dat.nroTrabajador
AND    NomConceptoHist_Dat.nroTrabajador = NomTrabajador00_Dat.nroTrabajador
AND    NomConceptoHist_Dat.nroTrabajador = NomTrabajador01_Dat.nroTrabajador
AND    NomConceptoHist_Dat.codConcepto = NomConcepto_Dat.codConcepto
AND    NomConceptoHist_Dat.codNomina = $P{p_tipo_nomina}
AND    NomConceptoHist_Dat.fechaNomina = $P{p_fecha_nomina}
AND    NomConcepto_Dat.codConcepto >= 100
AND    NomConceptoHist_Dat.total > 0.00
ORDER  BY NomTrabajador01_Dat.tipoNomina, NomConceptoHist_Dat.nroTrabajador, NomConceptoHist_Dat.codConcepto, NomConcepto_Dat.asignacion
