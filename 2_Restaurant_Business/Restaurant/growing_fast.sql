-- Monthly review growing fast in top 10 city
WITH monthly_reviews AS (
    SELECT
        ro.city,
        DATE_TRUNC('month', r.date::date) AS month_review,
        COUNT(*) AS total_review
    FROM review r
    JOIN restaurant_outlier ro 
    ON ro.business_id = r.business_id
    WHERE ro.city IS NOT NULL
    GROUP BY ro.city, month_review
),
growth_calc AS
(
    SELECT
        city,
        month_review,
        total_review,

        LAG(total_review) OVER (
            PARTITION BY city 
            ORDER BY month_review
        ) AS prev_month,

        total_review 
        - LAG(total_review,1,0) OVER (
            PARTITION BY city ORDER BY month_review
        ) AS monthly_growth
    FROM monthly_reviews
    -- ORDER BY city, month_review
)
SELECT
    city,
    SUM(monthly_growth) as total_growth
FROM growth_calc
where monthly_growth IS NOT NULL
GROUP BY city
ORDER BY total_growth DESC
limit 10