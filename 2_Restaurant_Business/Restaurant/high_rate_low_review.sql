-- High rating but low review count Restaurant
WITH avg_review AS
(
    SELECT
        ROUND(AVG(review_count),2) as avg_reviews
    from restaurant_outlier
)
select
    r.name as Restaurant_Name,
    r.city,
    r.stars AS Rating,
    r.review_count as reviews
from restaurant_outlier r, avg_review a
WHERE r.stars >=4.5
    AND r.review_count < a.avg_reviews
ORDER BY r.stars DESC, r.review_count