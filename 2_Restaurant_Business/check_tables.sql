SELECT table_name 
FROM information_schema.tables
WHERE table_schema='public';

select column_name, data_type
from information_schema.columns
where table_name = 'business'

select column_name, data_type
from information_schema.columns
where table_name = 'checkin'

select column_name, data_type
from information_schema.columns
where table_name = 'review'

select column_name, data_type
from information_schema.columns
where table_name = 'tip'

select column_name, data_type
from information_schema.columns
where table_name = 'users'