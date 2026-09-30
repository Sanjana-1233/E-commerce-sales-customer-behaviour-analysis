SELECT
    COUNT(DISTINCT CASE
        WHEN InvoiceNo LIKE 'C%' THEN InvoiceNo
    END) AS CancellationOrders,

    COUNT(CASE
        WHEN InvoiceNo LIKE 'C%' THEN 1
    END) AS CancellationRows,

    SUM(CASE
        WHEN InvoiceNo LIKE 'C%' THEN ABS(Quantity)
        ELSE 0
    END) AS CancelledUnits,

    ROUND(
        SUM(CASE
            WHEN InvoiceNo LIKE 'C%' THEN ABS(Quantity * UnitPrice)
            ELSE 0
        END),
        2
    ) AS CancelledValue
FROM dbo.OnlineRetail_Raw;