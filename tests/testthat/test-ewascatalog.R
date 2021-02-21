test_that("ewascatalog() extracts correct data from the website with simple query", {
	res <- ewascatalog("cg00029284", "cpg")
	expected_class <- "data.frame"
	expected_cols <- c("author", "consortium", "pmid", "date", "trait", "efo", "analysis",
					   "source", "outcome", "exposure", "covariates", "outcome_unit", "exposure_unit", 
					   "array", "tissue", "further_details", "n", "n_studies", "age", "sex", 
					   "ancestry", "cpg", "chrpos", "chr", "pos", "gene", "type", "beta", "se", "p", "details", 
					   "study_id")
	
	expect_equal(expected_class, class(res))
	expect_equal(expected_cols, colnames(res))
})
