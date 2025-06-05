-- binarize(val, threshold) - Binarize data (set feature values to 0 or 1) according to a threshold.
CREATE FUNCTION binarize(
    val FLOAT8,
    threshold FLOAT8 NOT NULL
)
RETURN (INT)
AS
BEGIN
    RETURN NVL2(val, IF(val > threshold, 1, 0), NULL);
END;\g