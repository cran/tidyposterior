library(tidyposterior)
library(rsample)
library(testthat)

# ------------------------------------------------------------------------------

set.seed(4633)
test_bt <- bootstraps(mtcars, times = 10)
test_bt$one <- rnorm(nrow(test_bt), mean = 10)
test_bt$two <- rnorm(nrow(test_bt), mean = 12)
test_bt$three <- rnorm(nrow(test_bt), mean = 14)

fit_bt <- perf_mod(test_bt, seed = 781,
                   chains = 2, iter = 100,
                   verbose = FALSE)

contr_obj <- contrast_models(fit_bt, seed = 3666)

# ------------------------------------------------------------------------------

test_that('bad args', {
  expect_error(contrast_models(fit_bt, "one", c("two", "three")))
})

test_that('basics', {
  expect_equal(nrow(contr_obj), 3* 100)
  expect_true(inherits(contr_obj, "tbl_df"))
  expect_true(inherits(contr_obj, "posterior_diff"))
  expect_equal(names(contr_obj), c("difference", "model_1", "model_2", "contrast"))
  expect_true(is.character(contr_obj$model_1))
  expect_true(is.character(contr_obj$model_2))
  expect_true(is.character(contr_obj$contrast))
  expect_true(is.numeric(contr_obj$difference))
})

# ------------------------------------------------------------------------------

test_that('reproducibility', {
  expect_equal(contrast_models(fit_bt, seed = 3666), contr_obj)
})

# ------------------------------------------------------------------------------

# TODO test for dplyr compatability

