-- standard_scale_samp(val) - Standardize values of a column by removing the mean and scaling to unit variance using the sample form of the standard deviation.
CREATE FUNCTION standard_scale_samp(
    val FLOAT8
)
RETURN (FLOAT8)
AS
DECLARE
mean FLOAT8 NOT NULL;
std_dev FLOAT8 NOT NULL;
BEGIN
    SELECT :mean=AVG(val);
    SELECT :std_dev=STDDEV_SAMP(val);
    RETURN IF(std_dev = 0, 0, -- Avoid dividing by zero
                (val - mean) / std_dev);
END;\g