-- minmax_scale(val) - Scale the values of a column based on the column's global min and max value.
CREATE FUNCTION minmax_scale(
    val FLOAT8
)
RETURN (FLOAT8)
AS
DECLARE
min_val FLOAT8 NOT NULL;
max_val FLOAT8 NOT NULL;
BEGIN
    SELECT :min_val=min(val);
    SELECT :max_val=max(val);
    RETURN IF(min_val = max_val, 0, -- Handle min=max to avoid dividing by zero
                (val - min_val) / (max_val - min_val));
END;\g