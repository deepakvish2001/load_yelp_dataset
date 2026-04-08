-- Elite user impact on rating

SELECT
    DISTINCT ro.name,
    ro.city,
    COUNT(r.review_id) as review_count,
    COUNT(CASE WHEN elite IS NOT NULL AND elite <> '' THEN 1 END) AS elite_reviews,
    ROUND(AVG(r.stars)::NUMERIC,2) AS avg_rating
from restaurant_outlier ro
LEFT JOIN review r ON r.business_id = ro.business_id
LEFT JOIN users u ON r.user_id = u.user_id
GROUP BY ro.name, ro.city
HAVING COUNT(r.review_id) > 50
ORDER BY elite_reviews DESC