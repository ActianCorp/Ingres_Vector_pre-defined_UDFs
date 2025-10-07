-- mean_squared_error(y_true, y_pred) - Calculate regression mean squared error.
CREATE FUNCTION mean_squared_error(
    y_true FLOAT8,
    y_pred FLOAT8
)
RETURN (FLOAT8)
AS
DECLARE
    mean_squared_error FLOAT8;
BEGIN
    SELECT :mean_squared_error = AVG(POWER(y_true - y_pred, 2));
    RETURN mean_squared_error;
END;\g