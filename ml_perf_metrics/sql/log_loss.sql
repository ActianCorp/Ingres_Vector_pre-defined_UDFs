-- log_loss(y_true, y_prob, target_class) - Calculate log loss with probability input for the target class.
CREATE FUNCTION log_loss(
    y_true INTEGER,
    y_prob FLOAT8,
    target_class INTEGER
)
RETURN (FLOAT8)
AS
DECLARE
    eps FLOAT8 NOT NULL;
BEGIN
    -- Epsilon
    :eps = 1e-15;

    -- Calculate average loss for the target class with epsilon clipping
    RETURN AVG(
        CASE
            WHEN y_true != target_class THEN 0
            -- Clip probabilities to [eps, 1-eps] range to avoid log(0)
            WHEN y_prob < eps THEN
                -(LOG(eps))
            WHEN y_prob > (1 - eps) THEN
                -(LOG(1 - eps))
            ELSE
                -(LOG(y_prob))
        END
    );
END;\g

CREATE FUNCTION log_loss(
    y_true VARCHAR(32000),
    y_prob FLOAT8,
    target_class VARCHAR(32000)
)
RETURN (FLOAT8)
AS
DECLARE
    eps FLOAT8 NOT NULL;
BEGIN
    -- Epsilon
    :eps = 1e-15;

    -- Calculate average loss for the target class with epsilon clipping
    RETURN AVG(
        CASE
            WHEN y_true != target_class THEN 0
            -- Clip probabilities to [eps, 1-eps] range to avoid log(0)
            WHEN y_prob < eps THEN
                -(LOG(eps))
            WHEN y_prob > (1 - eps) THEN
                -(LOG(1 - eps))
            ELSE
                -(LOG(y_prob))
        END
    );
END;\g

CREATE FUNCTION log_loss(
    y_true FLOAT8,
    y_prob FLOAT8,
    target_class FLOAT8
)
RETURN (FLOAT8)
AS
DECLARE
    eps FLOAT8 NOT NULL;
BEGIN
    -- Epsilon
    :eps = 1e-15;

    -- Calculate average loss for the target class with epsilon clipping
    RETURN AVG(
        CASE
            WHEN y_true != target_class THEN 0
            -- Clip probabilities to [eps, 1-eps] range to avoid log(0)
            WHEN y_prob < eps THEN
                -(LOG(eps))
            WHEN y_prob > (1 - eps) THEN
                -(LOG(1 - eps))
            ELSE
                -(LOG(y_prob))
        END
    );
END;\g
