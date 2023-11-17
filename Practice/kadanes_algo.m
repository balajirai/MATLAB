% kadane's algorithm
arr = [-2, 1, -3, 4, -1, 2, 1, -5, 4];
maxSum = kadanesAlgorithm(arr);
disp(['Maximum subarray sum: ', num2str(maxSum)]);

function maxSubarraySum = kadanesAlgorithm(arr)
    n = length(arr);
    maxEndingHere = arr(1);
    maxSoFar = arr(1);
    
    for i = 2:n
        maxEndingHere = max(arr(i), maxEndingHere + arr(i));
        maxSoFar = max(maxSoFar, maxEndingHere);
    end
    
    maxSubarraySum = maxSoFar;
end
