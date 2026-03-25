-- f1_score(y_true, y_pred, target_class) - Compute the F1 score, also known as balanced F-score or F-measure
CREATE FUNCTION f1_score(
    y_true INTEGER,
    y_pred INTEGER,
    target_class INTEGER
)
RETURN (FLOAT8)
AS
DECLARE
    true_positives INTEGER NOT NULL;
    false_positives INTEGER NOT NULL;
    false_negatives INTEGER NOT NULL;
    total_positives INTEGER NOT NULL;
    actual_positives INTEGER NOT NULL;
    recall FLOAT8;
    prec FLOAT8;
BEGIN
    SELECT :true_positives = SUM(CASE WHEN y_true = y_pred AND y_pred = target_class THEN 1 ELSE 0 END);
    SELECT :false_positives = SUM(CASE WHEN y_true != y_pred AND y_pred = target_class THEN 1 ELSE 0 END);
    SELECT :false_negatives = SUM(CASE WHEN y_true != y_pred AND y_true = target_class THEN 1 ELSE 0 END);

    SELECT :total_positives = true_positives + false_positives;
    SELECT :actual_positives = true_positives + false_negatives;

    SELECT :recall = IF(actual_positives = 0, NULL,
              CAST(true_positives AS FLOAT8) / CAST(actual_positives AS FLOAT8));
    SELECT :prec = IF(total_positives = 0, NULL,
              CAST(true_positives AS FLOAT8) / CAST(total_positives AS FLOAT8));

    -- Return f1_score (2 * (precision * recall) / (precision + recall))
    -- Handle cases where precision or recall is NULL or when their sum is 0
    RETURN IF(prec IS NULL OR recall IS NULL OR (prec + recall) = 0, 0,
              (2.0 * prec * recall) / (prec + recall));
END;\g

CREATE FUNCTION f1_score(
    y_true VARCHAR(32000),
    y_pred VARCHAR(32000),
    target_class VARCHAR(32000)
)
RETURN (FLOAT8)
AS
DECLARE
    true_positives INTEGER NOT NULL;
    false_positives INTEGER NOT NULL;
    false_negatives INTEGER NOT NULL;
    total_positives INTEGER NOT NULL;
    actual_positives INTEGER NOT NULL;
    recall FLOAT8;
    prec FLOAT8;
BEGIN
    SELECT :true_positives = SUM(CASE WHEN y_true = y_pred AND y_pred = target_class THEN 1 ELSE 0 END);
    SELECT :false_positives = SUM(CASE WHEN y_true != y_pred AND y_pred = target_class THEN 1 ELSE 0 END);
    SELECT :false_negatives = SUM(CASE WHEN y_true != y_pred AND y_true = target_class THEN 1 ELSE 0 END);

    SELECT :total_positives = true_positives + false_positives;
    SELECT :actual_positives = true_positives + false_negatives;

    SELECT :recall = IF(actual_positives = 0, NULL,
              CAST(true_positives AS FLOAT8) / CAST(actual_positives AS FLOAT8));
    SELECT :prec = IF(total_positives = 0, NULL,
              CAST(true_positives AS FLOAT8) / CAST(total_positives AS FLOAT8));

    -- Return f1_score (2 * (precision * recall) / (precision + recall))
    -- Handle cases where precision or recall is NULL or when their sum is 0
    RETURN IF(prec IS NULL OR recall IS NULL OR (prec + recall) = 0, 0,
              (2.0 * prec * recall) / (prec + recall));
END;\g
