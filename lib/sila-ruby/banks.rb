# ================================================
# SILA-RUBY ======================================
# ================================================
module SilaRuby

  # ==============================================
  # BANKS ========================================
  # ==============================================
  class Banks

    # --------------------------------------------
    # INCLUDES -----------------------------------
    # --------------------------------------------
    include ApiHelpers

    # --------------------------------------------
    # LINK-ACCOUNT -------------------------------
    # --------------------------------------------
    # Uses a provided Plaid public token to link a bank account to a verified entity
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

      post_signed('link_account', header, message, params, user_key)
    end

    # --------------------------------------------
    # GET-ACCOUNTS -------------------------------
    # --------------------------------------------
    # Gets basic bank account names linked to user handle
    def self.get_accounts(handle, user_key)
      header = { user_handle: handle }
      message = 'get_accounts_msg'
      post_signed('get_accounts', header, message, nil, user_key)
    end

  end
end
