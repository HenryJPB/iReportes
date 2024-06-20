select C4_FECHA as fechaIng,
       to_char( C4_FECHA,'dd')||'     '||to_char( C4_FECHA,'MM' )||'     '||to_char( C4_FECHA,'yyyy') as txtFechaIng,
       NOMBRE_CLI_PROV||' ('||rTrim(C4_COD_CLIENTE)||')' as nombreCliProv,
       C4_COD_CLIENTE as codCliente,
       C4_NOMBRE_CLIENTE as nombreCliente,
       C4_RAZON_SOCIAL as razonSocial,
       C4_MONTO as monto,
       C4_TIPO_DOC as tipoDoc,
       C2_DESCRIPCION as descripcionDoc,
       C4_FECHA_TRANS as fechaTrans,
       to_char( C4_FECHA_TRANS,'dd')||'           '||to_char( C4_FECHA_TRANS,'MM' )||'           '||to_char( C4_FECHA_TRANS,'yyyy') as txtFechaTrans,
       C4_COD_BANCO as bancoDeposito,
       C1_COD_CONTABLE as codContable,
       C4_OBSERVACION as observacion
from   CAJA04_DAT, CXCD_DAT, BAN01_DAT, CAJA02_DAT
where  C4_COD_CLIENTE = CODIGO
and    C4_COD_BANCO = C1_COD_BANCO
and    C4_NRO_INGRESO between $P{desdeNroIng} and $P{hastaNroIng}
and    C4_TIPO_DOC = C2_TIPO_DOC