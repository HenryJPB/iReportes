select C4_NRO_INGRESO as nroIng,
                C4_FECHA as fechaIng,
                C4_COD_CLIENTE as codCliente,
                C4_NOMBRE_CLIENTE as nombreCliente,
                C4_RAZON_SOCIAL as razonSocial,
                C4_TIPO_DOC as tipoDoc,
                '<<Documentos>>' as docuementos,
                C4_TIPO_TRANS as tipoTrans,
                C4_FECHA_TRANS as fechaTrans,
                C4_COD_BANCO as bancoDeposito,
                C4_NRO_PLANILLA as nroPlanilla,
                '<<Cheques>>' as cheques,
                C4_STATUS_REV as statusRev,
                C4_STATUS_CONTABLE  as statusCont,
                C4_OBSERVACION as observacion
from   CAJA04_DAT
where  C4_NRO_INGRESO between $P{nroIngreso1} and $P{nroIngreso2}
and    C4_FECHA between $P{fecha1} and $P{fecha2}
order   by C4_NRO_INGRESO, C4_FECHA