-- Monthly review growth per city

WITH monthly_reviews AS
(
    SELECT
        ro.city,
        DATE_TRUNC('month', r.date::date) AS month_review,
        COUNT(*) AS total_review
    FROM review r
    JOIN restaurant_outlier ro 
    ON ro.business_id = r.business_id
    WHERE ro.city IS NOT NULL
    GROUP BY ro.city, month_review
)
SELECT
    city,
    month_review::date,
    total_review,

    LAG(total_review,1,0) OVER (
        PARTITION BY city 
        ORDER BY month_review
    ) AS prev_month,

    total_review 
    - LAG(total_review,1,0) OVER (
        PARTITION BY city
        ORDER BY month_review
    ) AS monthly_growth
FROM monthly_reviews
-- WHERE city = 'Philadelphia'
ORDER BY city, month_review ASC
-- select
--     city,
--     SUM(monthly_growth)
-- from monthly_grow
-- GROUP BY city