-- recall_score(y_true, y_pred, target_class) - Calculate recall (sensitivity) for classification.
CREATE FUNCTION recall_score(
    y_true INTEGER,
    y_pred INTEGER,
    target_class INTEGER
)
RETURN (FLOAT8)
AS
DECLARE
    true_positives INTEGER NOT NULL;
    false_negatives INTEGER NOT NULL;
    actual_positives INTEGER NOT NULL;
BEGIN
    SELECT :true_positives = SUM(CASE WHEN y_true = y_pred AND y_pred = target_class THEN 1 ELSE 0 END);
    SELECT :false_negatives = SUM(CASE WHEN y_true != y_pred AND y_true = target_class THEN 1 ELSE 0 END);

    :actual_positives = true_positives + false_negatives;

    -- Return recall, handling case where there are no actual positives
    RETURN IF(actual_positives = 0, 0,
              CAST(true_positives AS FLOAT8) / CAST(actual_positives AS FLOAT8));
END;\g

CREATE FUNCTION recall_score(
    y_true VARCHAR(32000),
    y_pred VARCHAR(32000),
    target_class VARCHAR(32000)
)
RETURN (FLOAT8)
AS
DECLARE
    true_positives INTEGER NOT NULL;
    false_negatives INTEGER NOT NULL;
    actual_positives INTEGER NOT NULL;
BEGIN
    SELECT :true_positives = SUM(CASE WHEN y_true = y_pred AND y_pred = target_class THEN 1 ELSE 0 END);
    SELECT :false_negatives = SUM(CASE WHEN y_true != y_pred AND y_true = target_class THEN 1 ELSE 0 END);

    :actual_positives = true_positives + false_negatives;

    -- Return recall, handling case where there are no actual positives
    RETURN IF(actual_positives = 0, 0,
              CAST(true_positives AS FLOAT8) / CAST(actual_positives AS FLOAT8));
END;\g

CREATE FUNCTION recall_score(
    y_true FLOAT8,
    y_pred FLOAT8,
    target_class FLOAT8
)
RETURN (FLOAT8)
AS
DECLARE
    true_positives INTEGER NOT NULL;
    false_negatives INTEGER NOT NULL;
    actual_positives INTEGER NOT NULL;
BEGIN
    SELECT :true_positives = SUM(CASE WHEN y_true = y_pred AND y_pred = target_class THEN 1 ELSE 0 END);
    SELECT :false_negatives = SUM(CASE WHEN y_true != y_pred AND y_true = target_class THEN 1 ELSE 0 END);

    :actual_positives = true_positives + false_negatives;

    -- Return recall, handling case where there are no actual positives
    RETURN IF(actual_positives = 0, 0,
              CAST(true_positives AS FLOAT8) / CAST(actual_positives AS FLOAT8));
END;\g
