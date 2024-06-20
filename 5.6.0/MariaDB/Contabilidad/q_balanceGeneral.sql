SELECT indiceFormato,
       codigoCuenta, descripcion,
       saldoAnterior, totalDebitos,
       totalCreditos, ( saldoAnterior + totalDebitos - totalCreditos ) as saldoActual
FROM   ContabaDat a, ContabdDat, ContabbDat b
WHERE  a.codigo = "01"
AND    codigoCuenta = b.codigo
AND    periodo      = "2021-01"
AND    SubString( codigoCuenta,1,1 ) IN ("1","2","9")
AND    Length( codigoCuenta ) <= 5
AND    0.00 != ( saldoAnterior + totalDebitos - totalCreditos )
ORDER  BY codigoCuenta

