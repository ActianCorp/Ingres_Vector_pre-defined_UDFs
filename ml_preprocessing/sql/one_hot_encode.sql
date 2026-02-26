-- one_hot_encode(val, distinct_count) - Encode categorical features as a one-hot numeric array. To be called as VECTOR(one_hot_encode(val), <distinct_count>, INT4) where distinct_count is a literal number determined by running query SELECT COUNT(DISTINCT val)
CREATE FUNCTION one_hot_encode(val INT)
RETURN (VARCHAR(32000))
AS
DECLARE
distinct_count INT NOT NULL;
rank INT NOT NULL;
BEGIN
    SELECT :distinct_count=COUNT(DISTINCT val);
    SELECT :rank=dense_rank() OVER (ORDER BY val);
    RETURN CONCAT('[', REPEAT('0,', rank-1), '1', REPEAT(',0', distinct_count-rank), ']');
END;\g

CREATE FUNCTION one_hot_encode(val FLOAT8)
RETURN (VARCHAR(32000))
AS
DECLARE
distinct_count INT NOT NULL;
rank INT NOT NULL;
BEGIN
    SELECT :distinct_count=COUNT(DISTINCT val);
    SELECT :rank=dense_rank() OVER (ORDER BY val);
    RETURN CONCAT('[', REPEAT('0,', rank-1), '1', REPEAT(',0', distinct_count-rank), ']');
END;\g

CREATE FUNCTION one_hot_encode(val VARCHAR(32000))
RETURN (VARCHAR(32000))
AS
DECLARE
distinct_count INT NOT NULL;
rank INT NOT NULL;
BEGIN
    SELECT :distinct_count=COUNT(DISTINCT val);
    SELECT :rank=dense_rank() OVER (ORDER BY val);
    RETURN CONCAT('[', REPEAT('0,', rank-1), '1', REPEAT(',0', distinct_count-rank), ']');
END;\g
