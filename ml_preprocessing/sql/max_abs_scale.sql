-- max_abs_scale(val) - Scale values of a column by their maximum absolute value.
CREATE FUNCTION max_abs_scale(
    val FLOAT8
)
RETURN (FLOAT8)
AS
DECLARE
max_abs_val FLOAT8 NOT NULL;
BEGIN
    SELECT :max_abs_val=MAX(ABS(val));
    RETURN IF(max_abs_val = 0, 0, -- Avoid dividing by zero
                val / max_abs_val);
END;\g