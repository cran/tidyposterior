# nocov
.onLoad <- function(libname, pkgname) {

  if (utils::packageVersion("dplyr") <= "0.8.5") {
    # register_s3_method("dplyr", "arrange", "posterior")
    # register_s3_method("dplyr", "filter", "posterior")
    # register_s3_method("dplyr", "mutate", "posterior")
    # register_s3_method("dplyr", "rename", "posterior")
    # register_s3_method("dplyr", "select", "posterior")
    # register_s3_method("dplyr", "slice", "posterior")
  } else {
    vctrs::s3_register("dplyr::dplyr_reconstruct", "posterior", method = posterior_reconstruct)
    vctrs::s3_register("dplyr::dplyr_reconstruct", "posterior_diff", method = posterior_diff_reconstruct)
  }

}

# nocov end
