#' @rdname check_stripe_keys
#' @title Set Stripe API Keys
#'
#' @description Sets system environment variables for
#'  \code{stripe_public_key} and \code{stripe_secret_key}
#' @param api_key The public/secret keys to be set
#' @export
check_stripe_secret_key = function(api_key = NULL) {
  if (is.null(api_key)) {
    if (stripe_secret_key_set()) {
      return(stripe_secret_key())
    } else {
      stop("Secret Key is not set and none were passed to the function")
    }
  } else {
    return(api_key)
  }
}

#' @rdname check_stripe_keys
#' @export
check_stripe_public_key = function(api_key = NULL) {
  if (is.null(api_key)) {
    if (stripe_public_key_set()) {
      return(stripe_public_key())
    } else {
      stop("Public Key is not set and none were passed to the function")
    }
  } else {
    return(api_key)
  }
}
