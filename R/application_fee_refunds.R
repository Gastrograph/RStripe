# --------------------------------------------------
# Application Fee Refunds
# --------------------------------------------------

#' Create a refund for an Application Fee.
#'
#' Create a refund for an application fee.
#'
#' @param api_key Your Stripe API Key
#'
#' @param application_fee_id The id for the Application Fee
#' you want to refund
#'
#' @param args An optional list which can contain an amount to refund
#' \describe{
#'    \item{amount}{\emph{optional} default is entire fee}
#'    \item{metadata}{\emph{optional} A list which can contain anything
#'    to further describe.}
#' }
#'
#' @examples \dontrun{stripe_create_application_fee_refund(
#' api_key = "sk_test_BQokikJOvBiI2HlWgH4olfQ2",
#' "fee_4cbC9iLv8PdUnk")}
#'
#' @examples \dontrun{stripe_create_application_fee_refund(
#' api_key = "sk_test_BQokikJOvBiI2HlWgH4olfQ2", "fee_4cbC9iLv8PdUnk",
#' list(amount=100))}
#'
#' @examples \dontrun{stripe_create_application_fee_refund(
#' api_key = "sk_test_BQokikJOvBiI2HlWgH4olfQ2", "fee_4cbC9iLv8PdUnk",
#' list(metadata=list(reason="Accidental charge")))}
#'
#' @return A data frame with refund information
#'
#' @export
#'
stripe_create_application_fee_refund <- function(application_fee_id,
                                                 args = NULL,
                                                 api_key = NULL) {
  link <- paste0("https://api.stripe.com/v1/application_fees/",
                 application_fee_id,
                 "/refunds")
  api_key = check_stripe_secret_key(api_key = api_key)
  .post(api_key, link, args)
}

#' Retrieve an existing refund for an Application Fee.
#'
#' Retrieve the information of a refund.
#'
#' @param api_key Your Stripe API Key
#'
#' @param application_fee_id The id for the Application Fee
#' you want to refund
#'
#' @param refund_id The id for the Refund
#' you want to retrieve
#'
#' @return A data frame with refund information
#'
#' @export
#'
stripe_retrieve_application_fee_refund <- function(
  application_fee_id, refund_id, api_key = NULL) {
  link <- paste0(
    "https://api.stripe.com/v1/application_fees/",
    application_fee_id,
    "/refunds/",
    refund_id
  )
  api_key = check_stripe_secret_key(api_key = api_key)
  .get(api_key, link)
}

#' Update a refund for an Application Fee.
#'
#' Update all the information of a refund of an application fee.
#'
#' @param api_key Your Stripe API Key
#'
#' @param application_fee_id The id for the Application Fee
#' you want to refund
#'
#' @param refund_id The id for the Refund
#' you want to update
#'
#' @param args An optional list which can contain:
#' \describe{
#'    \item{metadata}{\emph{optional} A list which can contain
#'    anything to further describe.}
#' }
#'
#' @examples \dontrun{stripe_create_application_fee_refund(
#' api_key = "sk_test_BQokikJOvBiI2HlWgH4olfQ2", "fee_4cbC9iLv8PdUnk",
#' list(metadata=list(reason="Accidental charge")))}
#'
#' @return A data frame with application fee refund object if succeeded
#'
#' @export
#'
stripe_update_application_fee_refund <- function(application_fee_id,
                                                 refund_id,
                                                 args,
                                                 api_key = NULL) {
  args <- .metadata(args)
  link <- paste0(
    "https://api.stripe.com/v1/application_fees/",
    application_fee_id,
    "/refunds/",
    refund_id
  )
  api_key = check_stripe_secret_key(api_key = api_key)
  .post(api_key, link, args)
}

#' List all refunds for an Application Fee.
#'
#' List all refunds associated with a specific application fee.
#'
#' @param api_key Your Stripe API Key
#'
#' @param application_fee_id The id for the Application Fee
#' you want to refund
#'
#' @param args An optional list which can contain
#' \describe{
#'    \item{ending_before}{\emph{optional:} An object id which
#'    will show objects before}
#'    \item{limit}{\emph{optional:} A number 1 to 100 to limit
#'    the items.  Default is 10}
#'    \item{starting_after}{\emph{optional:} An object id which
#'    will show objects starting here}
#' }
#'
#' @examples \dontrun{
#' stripe_list_application_fee_refunds(
#' api_key = "sk_test_BQokikJOvBiI2HlWgH4olfQ2",
#' "fee_4cbC9iLv8PdUnk",
#' list(limit=3))
#' } #returns 3 refunds
#'
#' @return A data frame with application fee refund object if succeeded
#'
#' @export
#'
stripe_list_application_fee_refunds <- function(
  application_fee_id,
  args = NULL,
  api_key = NULL) {
  args <- .convert_to_url(args)
  link <- paste0(
    "https://api.stripe.com/v1/application_fees/",
    application_fee_id,
    "/refunds",
    args
  )
  api_key = check_stripe_secret_key(api_key = api_key)
  .get(api_key, link)
}
