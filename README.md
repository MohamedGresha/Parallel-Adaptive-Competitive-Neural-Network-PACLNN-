# Parallel-Adaptive-Competitive-Neural-Network-PACLNN-
This section is introducing the way of use the parallel processing to de-velop the ACLNN algorithm. Instead of testing a number of clustering struc-tures sequentially to select the best one according to a selection criterion in the ACLNN algorithm, the new proposed PACLNN algorithm does this task in parallel using parallel processing and multi-core processors. Every clus-tering structure is tested in a thread that is run in a worker or a core in a mul-ti-core processor. These threads of execution are run in parallel i.e., concur-rently. Evaluation of the PACLNN algorithm shows that it is faster than the ACLNN algorithm with large or big data sets. Also, it uses the hardware re-sources available in modern multi-core processors better than the ACLNN algorithm.
