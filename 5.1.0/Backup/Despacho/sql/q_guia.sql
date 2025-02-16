select C1_NCF as nroCtrlFiscal,   
       C1_GUIA as guia,
       C1_FECHA_GUIA as fechaGuia, 
       C1_CODIGO_CLIENTE as codCliente, 
       NOMBRE_CLI_PROV as nombreCliente, 
       nvl(C2_ITEM_NO,'') as itemNo, 
       C2_CODIGO as codProd, 
       C2_TIPO as tipoProd, 
       C2_DESCRIPCION as descripcion,
       C2_PESO as peso,  
       C2_UNIDADES as cantidad, 
       C2_PRECIO as precio
from   GUIAS01_DAT, CXCD_DAT, GUIAS02_DAT
where  C1_GUIA = C2_GUIA
and    C1_CODIGO_CLIENTE = CODIGO
order  by C2_ITEM_NO, C2_CODIGO, C2_TIPO

