# --------------------------------------------------
# Discounts
# --------------------------------------------------

#' Delete a customer discount.
#'
#' Delete a discout from a customer.
#'
#' @param api_key Your Stripe API Key
#'
#' @param customer_id The identifier of the customer who
#' has the discount to be deleted.
#'
#' @return Returns a data frame deleted true if if succeeded.
#'
#' @export
#'
stripe_delete_customer_discount <- function(customer_id,
                                            api_key = NULL) {
    link <- paste0("https://api.stripe.com/v1/customers/", customer_id, "/discount")
    api_key = check_stripe_secret_key(api_key = api_key)
    .delete(api_key, link)
}

#' Delete a subscription discount.
#'
#' Delete a discount from a customer's subscription.
#'
#' @param api_key Your Stripe API Key
#'
#' @param customer_id The identifier of the customer who
#' has the discount to be deleted.
#'
#' @param subscription_id The identifier of the subscription.
#'
#' @return Returns a data frame deleted true if if succeeded.
#'
#' @export
#'
stripe_delete_subscription_discount <- function(customer_id,
                                                subscription_id,
                                                api_key = NULL) {
    link <- paste0("https://api.stripe.com/v1/customers/", customer_id,
                   "/subscriptions/", subscription_id, "/discount")
    api_key = check_stripe_secret_key(api_key = api_key)
    .delete(api_key, link)
}
