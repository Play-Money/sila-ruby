# ================================================
# SILA-RUBY ======================================
# ================================================
module SilaRuby

  # ==============================================
  # WALLETS ======================================
  # ==============================================
  class Wallets

    # --------------------------------------------
    # INCLUDES -----------------------------------
    # --------------------------------------------
    include ApiHelpers

    # --------------------------------------------
    # REGISTER-WALLET ----------------------------
    # --------------------------------------------
    # Adds another "wallet"/blockchain address to a user handle.
    # TODO: https://docs.silamoney.com/docs/register_wallet

    # --------------------------------------------
    # GET-WALLET ---------------------------------
    # --------------------------------------------
    # Gets details about the user wallet used to generate the usersignature header.
    def self.get_wallet(handle, user_key)
      header = { user_handle: handle }
      message = 'header_msg'

      sila_post_signed('get_wallet', header, message, nil, user_key, nil)
    end

    # --------------------------------------------
    # GET-WALLETS --------------------------------
    # --------------------------------------------
    # Gets array of user handle's transactions with detailed status information.
    def self.get_wallets(handle, params={}, user_key)
      header = { user_handle: handle }
      message = 'header_msg'

      # Example of params passed
      #
      # params = {
      #   search_filters: {
      #     page: 1,
      #     per_page: 20,
      #     sort_ascending: false,
      #     blockchain_network: "ETH",
      #     blockchain_address: "",
      #     nickname: ""
      #   }
      # }

      sila_post_signed('get_wallets', header, message, params, user_key, nil)
    end

    # --------------------------------------------
    # UPDATE-WALLET ------------------------------
    # --------------------------------------------
    # Updates nickname and/or default status of a wallet.
    # TODO: https://docs.silamoney.com/docs/update_wallet

    # --------------------------------------------
    # GET-SILA-BALANCE ---------------------------
    # --------------------------------------------
    # Checks token balance on a blockchain address.
    def self.get_sila_balance(params={})
      message = 'header_msg'
      # Example of params passed
      #
      # params = {
      #   address: "0x..."
      # }

      sila_post_signed('get_sila_balance', {}, message, params, nil, nil)
    end

    # --------------------------------------------
    # DELETE-WALLET ------------------------------
    # --------------------------------------------
    # Deletes a user wallet.
    # https://docs.silamoney.com/docs/delete_wallet

  end
end
