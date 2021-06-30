# Parallel-Adaptive-Competitive-Neural-Network-PACLNN-
This section is introducing the way of use the parallel processing to develop the ACLNN algorithm. Instead of testing a number of clustering structures sequentially to select the best one according to a selection criterion in the ACLNN algorithm, the new proposed PACLNN algorithm does this task in parallel using parallel processing and multi-core processors. Every clustering structure is tested in a thread that is run in a worker or a core in a multi-core processor. These threads of execution are run in parallel i.e., concurrently. Evaluation of the PACLNN algorithm shows that it is faster than the ACLNN algorithm with large or big data sets. Also, it uses the hardware resources available in modern multi-core processors better than the ACLNN algorithm.
