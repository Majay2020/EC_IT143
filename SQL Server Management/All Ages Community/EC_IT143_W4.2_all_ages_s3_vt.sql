-- Step 3: Create an ad hoc SQL query
-- Purpose: Extract the median earnings for Petroleum Engineering from the all-ages dataset

SELECT Major
	, Median
FROM dbo.[all-ages]
WHERE Major = 'Petroleum Engineering';