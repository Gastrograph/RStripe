#' @rdname stripe_keys
#' @title Stripe API Key Extractors
#'
#' @description Grabs system environment variables (e.g. from ~/.Renviron) if
#' they are available.  For \code{stripe_public_key}, the environment variable must
#' be \code{stripe_public_key} and \code{stripe_secret_key} it must be
#' \code{stripe_secret_key}.  \code{stripe_secret/public_key_set} are simple
#' tests to see if the keys are set
#'
#' @return Character if the key exists, \code{NULL} otherwise.
#' @export
stripe_public_key = function() {
  key = Sys.getenv("stripe_public_key")
  if (key %in% "") {
    return(NULL)
  } else {
    return(key)
  }
}

#' @rdname stripe_keys
#' @export
stripe_secret_key = function() {
  key = Sys.getenv("stripe_secret_key")
  if (key %in% "") {
    return(NULL)
  } else {
    return(key)
  }
}

#' @rdname stripe_keys
#' @export
stripe_public_key_set = function() {
  key = stripe_public_key()
  if (is.null(key)) {
    return(FALSE)
  }
  if (key == "") {
    return(FALSE)
  }
  return(TRUE)
}


#' @rdname stripe_keys
#' @export
stripe_secret_key_set = function() {
  key = stripe_secret_key()
  if (is.null(key)) {
    return(FALSE)
  }
  if (key == "") {
    return(FALSE)
  }
  return(TRUE)
}


