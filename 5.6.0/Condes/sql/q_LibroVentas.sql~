select 
 ( rowNum+0) as NRO_OPER,
 FECHA_DOCUMENTO,
 RIF,
 NOMBRE,
 null as nroPlanillaExp, 
 decode( TIPO_MOV,'FAC',REFERENCIA) as nroFactura,
 decode( TIPO_MOV,'FAC',NOCONTROLFISCALFAC) as nroCtlrFiscalFac,
 decode( TIPO_MOV,'N/D',REFERENCIA) as nroNotaDebito,
 decode( TIPO_MOV,'N/C',REFERENCIA) as nroNotaCredito,
 TIPO_TRANS,
 NO_FACT_AFECTADA,
 TOTAL_FACTURA as totalVentas,
 TOTAL_FACTURA_EXP as totalVentasNoGravadas,
 --CODIGO_CLIENTE,
 --CONTRIBUYENTE,
 BASECONT,
 ALICUOTACONT,
 IVACONT,  
 BASENOCONT,
 ALICUOTANOCONT,
 IVANOCONT,
 NOCOMPROBRETIVA, 
 nvl(IVARETCOMPRADOR,0) as ivaRetComprador,  
 nvl(IVAPERCIBIDO,0) as ivaPercibido  
from TEMP_LIBRO_VENTAS_DAT
order by FECHA_DOCUMENTO, REFERENCIA 
/  
