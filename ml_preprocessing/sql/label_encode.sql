-- label_encode(val) - Encode labels of a column with values between 0 and n_classes-1. Labels may change between runs of the function if table was changed.
CREATE FUNCTION label_encode(
    val FLOAT8
)
RETURN (INT)
AS
DECLARE
encoded INT NOT NULL;
BEGIN
    SELECT :encoded=dense_rank() OVER (ORDER BY val) - 1;
    RETURN encoded;
END;\g

CREATE FUNCTION label_encode(
    val VARCHAR(32000)
)
RETURN (INT)
AS
DECLARE
encoded INT NOT NULL;
BEGIN
    SELECT :encoded=dense_rank() OVER (ORDER BY val) - 1;
    RETURN encoded;
END;\g