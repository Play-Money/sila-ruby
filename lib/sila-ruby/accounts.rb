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
    # CHECK-HANDLE -------------------------------
    # --------------------------------------------
    # Check if a specific handle is taken
    def self.check_handle(handle)
      header = { user_handle: handle }
      message = 'header_msg'
      post_signed('check_handle', header, message, nil, nil)
    end

    # --------------------------------------------
    # REGISTER -----------------------------------
    # --------------------------------------------
    # Attaches KYC and blockchain address to user handle
    def self.register(handle, params={})
      header = { user_handle: handle }
      message = 'entity_msg'

      # Example of params passed
      #
      # params = {
      #   address: {
      #     address_alias: "home",
      #     street_address_1: "1265 Lombardi Ave",
      #     city: "Green Bay",
      #     state: "WI",
      #     country: "US",
      #     postal_code: "54304"
      #   },
      #   identity: {
      #     identity_alias: "SSN",
      #     identity_value: "123452222"
      #   },
      #   contact: {
      #     contact_alias: "",
      #     phone: "503-123-4567",
      #     email: "example@silamoney.com"
      #   },
      #   crypto_entry: {
      #     crypto_alias: "Address 1",
      #     crypto_address: "0x1234567890abcdef1234567890abcdef12345678",
      #     crypto_code: "ETH"
      #   },
      #   entity: {
      #     birthdate: "1900-01-31",
      #     entity_name: "Example User",
      #     first_name: "Example",
      #     last_name: "User",
      #     relationship: "user"
      #   }
      # }

      post_signed('register', header, message, params, nil)
    end

    # --------------------------------------------
    # REQUEST-KYC --------------------------------
    # --------------------------------------------
    # Start KYC verification process on a registered user handle
    def self.request_kyc(handle, user_key)
      header = { user_handle: handle }
      message = 'header_msg'
      post_signed('request_kyc', header, message, nil, user_key)
    end

    # --------------------------------------------
    # CHECK-KYC ----------------------------------
    # --------------------------------------------
    # Whether entity attached to user handle is verified, not valid, or pending
    def self.check_kyc(handle, user_key)
      header = { user_handle: handle }
      message = 'header_msg'
      post_signed('check_kyc', header, message, nil, user_key)
    end

  end
end
