# ================================================
# SILA-RUBY ======================================
# ================================================
module SilaRuby

  # ==============================================
  # ACCOUNTS =====================================
  # ==============================================
  class Accounts

    # --------------------------------------------
    # INCLUDES -----------------------------------
    # --------------------------------------------
    include ApiHelpers

    # --------------------------------------------
    # LINK-ACCOUNT -------------------------------
    # --------------------------------------------
    # Uses a provided Plaid public token to link a bank account to a verified entity.
    def self.link_account(handle, params={}, user_key)
      header = { user_handle: handle }
      message = 'link_account_msg'

      # Example of params passed
      #
      # params = {
      #   public_token: "public-xxx-xxx",
      #   account_name: "Custom Account Name",
      #   selected_account_id: "optional_selected_account_id"
      # }

      sila_post_signed('link_account', header, message, params, user_key, nil)
    end

    # --------------------------------------------
    # GET-ACCOUNTS -------------------------------
    # --------------------------------------------
    # Gets basic bank account names linked to user handle.
    def self.get_accounts(handle, user_key)
      header = { user_handle: handle }
      message = 'get_accounts_msg'
      sila_post_signed('get_accounts', header, message, nil, user_key, nil)
    end

    # --------------------------------------------
    # GET-ACCOUNT-BALANCE ------------------------
    # --------------------------------------------
    # Requests bank account balance data from an end-users linked bank account.
    def self.get_account_balance(handle, params={}, user_key)
      header = { user_handle: handle }
      message = 'header_msg'

      # Example of params passed
      #
      # params = {
      #   account_name: "Custom Account Name",
      # }

      sila_post_signed('get_account_balance', header, message, params, user_key, nil)
    end

    # --------------------------------------------
    # PLAID-SAMEDAY-AUTH -------------------------
    # --------------------------------------------
    # Handle a request for a Plaid Link public_token in order to complete Plaid's Same Day Microdeposit Authentication.
    def self.plaid_sameday_auth(handle, params={}, user_key)
      header = { user_handle: handle }
      message = 'header_msg'

      # Example of params passed
      #
      # params = {
      #   account_name: "Custom Account Name",
      # }

      sila_post_signed('plaid_sameday_auth', header, message, params, user_key, nil)
    end

    # --------------------------------------------
    # UPDATE-LINK-TOKEN --------------------------
    # --------------------------------------------
    # Get a link token for an existing linked bank account.
    def self.update_link_token(handle, params={}, user_key)
      header = { user_handle: handle }
      message = 'header_msg'

      # Example of params passed
      #
      # params = {
      #   account_name: "Custom Account Name",
      # }

      sila_post_signed('plaid_update_link_token', header, message, params, user_key, nil)
    end

  end
end
