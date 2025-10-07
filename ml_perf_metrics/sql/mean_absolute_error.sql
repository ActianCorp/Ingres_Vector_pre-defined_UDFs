-- mean_absolute_error(y_true, y_pred) - Calculate regression mean absolute error.
CREATE FUNCTION mean_absolute_error(
    y_true FLOAT8,
    y_pred FLOAT8
)
RETURN (FLOAT8)
AS
DECLARE
    mean_absolute_error FLOAT8;
BEGIN
    SELECT :mean_absolute_error = AVG(ABS(y_true - y_pred));
    RETURN mean_absolute_error;
END;\g