-- robust_scale(val) - Scale values of a column using statistics that are robust to outliers.
CREATE FUNCTION robust_scale(
    val FLOAT8
)
RETURN (FLOAT8)
AS
DECLARE
q1 FLOAT8 NOT NULL;
median FLOAT8 NOT NULL;
q3 FLOAT8 NOT NULL;
BEGIN
    SELECT :q1=PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY val);
    SELECT :median=PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY val);
    SELECT :q3=PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY val);
    RETURN IF((q3 - q1) = 0, 0, -- Avoid dividing by zero
                (val - median) / (q3 - q1));
END;\g