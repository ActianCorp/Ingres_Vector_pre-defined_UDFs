-- precision_score(y_true, y_pred, target_class) - Compute precision is the ratio tp / (tp + fp) where tp is the number of true positives and fp the number of false positives.
CREATE FUNCTION precision_score(
    y_true INTEGER,
    y_pred INTEGER,
    target_class INTEGER
)
RETURN (FLOAT8)
AS
DECLARE
    true_positives INTEGER NOT NULL;
    false_positives INTEGER NOT NULL;
    total_positives INTEGER NOT NULL;
BEGIN
    SELECT :true_positives = SUM(CASE WHEN y_true = y_pred AND y_pred = target_class THEN 1 ELSE 0 END);
    SELECT :false_positives = SUM(CASE WHEN y_true != y_pred AND y_pred = target_class THEN 1 ELSE 0 END);

    :total_positives = true_positives + false_positives;

    -- Return precision, handling case where there are no actual positives
    RETURN IF(total_positives = 0, 0,
              CAST(true_positives AS FLOAT8) / CAST(total_positives AS FLOAT8));
END;\g

CREATE FUNCTION precision_score(
    y_true VARCHAR(32000),
    y_pred VARCHAR(32000),
    target_class VARCHAR(32000)
)
RETURN (FLOAT8)
AS
DECLARE
    true_positives INTEGER NOT NULL;
    false_positives INTEGER NOT NULL;
    total_positives INTEGER NOT NULL;
BEGIN
    SELECT :true_positives = SUM(CASE WHEN y_true = y_pred AND y_pred = target_class THEN 1 ELSE 0 END);
    SELECT :false_positives = SUM(CASE WHEN y_true != y_pred AND y_pred = target_class THEN 1 ELSE 0 END);

    :total_positives = true_positives + false_positives;

    -- Return precision, handling case where there are no actual positives
    RETURN IF(total_positives = 0, 0,
              CAST(true_positives AS FLOAT8) / CAST(total_positives AS FLOAT8));
END;\g

CREATE FUNCTION precision_score(
    y_true FLOAT8,
    y_pred FLOAT8,
    target_class FLOAT8
)
RETURN (FLOAT8)
AS
DECLARE
    true_positives INTEGER NOT NULL;
    false_positives INTEGER NOT NULL;
    total_positives INTEGER NOT NULL;
BEGIN
    SELECT :true_positives = SUM(CASE WHEN y_true = y_pred AND y_pred = target_class THEN 1 ELSE 0 END);
    SELECT :false_positives = SUM(CASE WHEN y_true != y_pred AND y_pred = target_class THEN 1 ELSE 0 END);

    :total_positives = true_positives + false_positives;

    -- Return precision, handling case where there are no actual positives
    RETURN IF(total_positives = 0, 0,
              CAST(true_positives AS FLOAT8) / CAST(total_positives AS FLOAT8));
END;\g
