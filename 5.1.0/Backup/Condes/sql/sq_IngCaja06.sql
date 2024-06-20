select C6_NRO_CHEQUE as cheque,
               C6_BANCO as bancoDeposito, 
               C6_MONTO as monto 
from    CAJA06_DAT  
order  by C6_BANCO, C6_NRO_CHEQUE