-- Replace the two placeholder expressions below.
-- Show duration in minutes and classify trips using a threshold of your choice.
SELECT pickup_time,
       dropoff_time,
       trip_distance_miles,
       ROUND(EXTRACT(EPOCH FROM (dropoff_time - pickup_time)) / 60, 2) AS duration_minutes,
       CASE
	   	    WHEN pickup_time IS NULL OR dropoff_time IS NULL THEN 'unknown'
            WHEN pickup_time < dropoff_time IS NULL THEN 'invalid'
            WHEN ROUND(EXTRACT(EPOCH FROM (dropoff_time - pickup_time)) / 60, 2) < 10 THEN 'short'
			ELSE 'long'
	   END AS trip_category
FROM public.taxi_trip_sample
WHERE source_month = DATE '2024-01-01'
ORDER BY pickup_time, dropoff_time, trip_distance_miles
LIMIT 10;
