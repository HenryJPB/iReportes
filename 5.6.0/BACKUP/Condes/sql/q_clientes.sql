select  CODIGO as codCliente, 
            NOMBRE_CLI_PROV as nombreCliente,
            DIRECCION1, 
            DIRECCION2, 
            DIRECCION3,  
            CEDULA as rif, 
            CONTRIBUYENTE, 
            FECHA_EMISION_RIF,
            FECHA_VENC_RIF
from    CXCD_DAT
where  TIPO_DE_CLIENTE = 'A'
and     SUBSTR(CODIGO,1,1 ) = 'C' 
order   by CODIGO, NOMBRE_CLI_PROV  