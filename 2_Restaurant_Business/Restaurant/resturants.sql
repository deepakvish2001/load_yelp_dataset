select 
	count(Distinct ro.business_id) as total_restaurant,
	Avg(r.stars) as avg_star,
	count(ro.review_count) as total_reviews
from restaurant_outlier ro
left join review r on r.business_id = ro.business_id