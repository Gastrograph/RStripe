# --------------------------------------------------
# Account
# --------------------------------------------------

#' Your Stripe Account.
#'
#' Retrieve your account.
#'
#' @param api_key Your Stripe API key
#'
#' @examples
#' \dontrun{
#' stripe_retrieve_account(api_key = "sk_test_BQokikJOvBiI2HlWgH4olfQ2")
#' }
#'
#' @return Your account information in a data frame.
#'
#' @export
#'
stripe_retrieve_account <- function(api_key = NULL) {
    link <- paste0("https://api.stripe.com/v1/account")
    api_key = check_stripe_secret_key(api_key = api_key)
    .get(api_key, link)
}
