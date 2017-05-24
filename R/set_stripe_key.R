#' @rdname set_stripe_keys
#' @title Set Stripe API Keys
#'
#' @description Sets system environment variables for
#'  \code{stripe_public_key} and \code{stripe_secret_key}
#' @param api_key The public/secret keys to be set
#' @export
set_stripe_public_key = function(api_key) {
  Sys.setenv(stripe_public_key = api_key)
}

#' @rdname set_stripe_keys
#' @export
set_stripe_secret_key = function(api_key) {
  Sys.setenv(stripe_secret_key = api_key)
}
