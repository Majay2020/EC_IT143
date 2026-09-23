-- Step 1: Start with a simple question
-- Question: What is the overall median earnings for a Petroleum Engineering major across all working age brackets?
SELECT Major, Median 
FROM dbo.[all-ages] 
WHERE Major = 'Petroleum Engineering';