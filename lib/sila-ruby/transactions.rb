# ================================================
# SILA-RUBY ======================================
# ================================================
module SilaRuby

  # ==============================================
  # TRANSACTIONS =================================
  # ==============================================
  class Transactions

    # --------------------------------------------
    # INCLUDES -----------------------------------
    # --------------------------------------------
    include ApiHelpers

    # --------------------------------------------
    # ISSUE-SILA ---------------------------------
    # --------------------------------------------
    # Debits a specified account and issues tokens to the address belonging to the requested handle
    def self.issue_sila(handle, params={}, user_key)
      header = { user_handle: handle }
      message = 'issue_msg'

      # Example of params passed
      #
      # params = {
      #   amount: 1000,
      #   account_name: "default"
      # }

      post_signed('issue_sila', header, message, params, user_key)
    end

    # --------------------------------------------
    # TRANSFER-SILA ------------------------------
    # --------------------------------------------
    # Starts a transfer of the requested amount of SILA to the requested destination handle
    def self.transfer_sila(handle, params={}, user_key)
      header = { user_handle: handle }
      message = 'transfer_msg'

      # Example of params passed
      #
      # params = {
      #   amount: 1000,
      #   destination: "user2.silamoney.eth"
      # }

      post_signed('transfer_sila', header, message, params, user_key)
    end

    # --------------------------------------------
    # REDEEM-SILA --------------------------------
    # --------------------------------------------
    # Burns given amount of SILA at the handle's blockchain address and credits their named bank account in the equivalent monetary amount
    def self.redeem_sila(handle, params={}, user_key)
      header = { user_handle: handle }
      message = 'redeem_msg'

      # Example of params passed
      #
      # params = {
      #   amount: 1000,
      #   account_name: "default"
      # }

      post_signed('redeem_sila', header, message, params, user_key)
    end

    # --------------------------------------------
    # GET-TRANSACTIONS ---------------------------
    # --------------------------------------------
    # Gets array of user handle's transactions with detailed status information
    def self.get_transactions(handle, params={}, user_key)
      header = { user_handle: handle }
      message = 'get_transactions_msg'

      # Example of params passed
      #
      # params = {
      #   search_filters: {
      #     transaction_id: "some UUID string assigned by Sila",
      #     reference_id: "the reference string sent in the header object when transaction request was made",
      #     show_timelines: true,
      #     sort_ascending: false,
      #     max_sila_amount: 1300,
      #     min_sila_amount: 1000,
      #     statuses: ["pending", "successful", "failed", "complete"],
      #     start_epoch: 1234567860,
      #     end_epoch: 1234567891,
      #     page: 1,
      #     per_page: 20,
      #     transaction_types: ["issue", "redeem", "transfer"]
      #   }
      # }

      post_signed('get_transactions', header, message, params, user_key)
    end

  end
end
