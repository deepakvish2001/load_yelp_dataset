-- Most competitive category.
SELECT
   TRIM(unnest(string_to_array(categories, ','))) as category, --Categories is in Test format (Restaurant,Food,Bar,Medical)
    COUNT(*) as total_business
from business
WHERE categories IS NOT NULL
GROUP BY category
ORDER BY total_business DESC
LIMIT 10