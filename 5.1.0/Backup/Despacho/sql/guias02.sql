select C2_GUIA as nroGuia,  
               C2_ITEM_NO as itemNo,
               C2_CODIGO as codItem, 
               C2_TIPO as tipo, 
               C2_DESCRIPCION as descripcion, 
               C2_PESO as peso, 
               C2_UNIDADES as cantidad,
               C2_PRECIO as precio,
               ( C2_PESO*C2_UNIDADES ) as pesoGuia, 
               ( C2_PESO*C2_UNIDADES*C2_PRECIO ) as total
from   GUIAS02_DAT
order  by C2_ITEM_NO, C2_CODIGO