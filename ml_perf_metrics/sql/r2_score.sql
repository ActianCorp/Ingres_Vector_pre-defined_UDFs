-- r2_score(y_true, y_pred) - Calculate regression R^2 (coefficient of determination) score.
CREATE FUNCTION r2_score(
    y_true FLOAT8,
    y_pred FLOAT8
)
RETURN (FLOAT8)
AS
DECLARE
    y_mean FLOAT8 NOT NULL;
    ss_res FLOAT8 NOT NULL;
    ss_tot FLOAT8 NOT NULL;
BEGIN
    SELECT :y_mean = AVG(y_true);

    -- Sum of squares of residuals
    SELECT :ss_res = SUM(POWER(y_true - y_pred, 2));

    -- Total sum of squares
    SELECT :ss_tot = SUM(POWER(y_true - y_mean, 2));

    -- R2 score
    -- Handle edge case where SS_tot is 0 (all y_true values are the same)
    RETURN CASE
        WHEN ss_tot = 0 AND ss_res = 0 THEN 1.0 -- Perfect prediction
        WHEN ss_tot = 0 AND ss_res != 0 THEN 0.0
        ELSE 1.0 - (ss_res / ss_tot) -- Standard R2 formula
    END;
END;\g
