-- Which restaurants having highest number of review
SELECT
    name as restaurant_name,
    SUM(review_count) as total_review,
    ROUND(AVG(stars)::NUMERIC,5) as avg_rating
from restaurant_outlier
GROUP BY restaurant_name
ORDER BY total_review DESC
LIMIT 10