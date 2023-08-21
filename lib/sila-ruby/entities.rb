# ================================================
# SILA-RUBY ======================================
# ================================================
module SilaRuby

  # ==============================================
  # ENTITIES =====================================
  # ==============================================
  class Entities

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
      sila_post_signed('check_handle', header, message, nil, nil, nil)
    end

    # --------------------------------------------
    # REGISTER -----------------------------------
    # --------------------------------------------
    # Attaches KYC and blockchain address to user handle
    def self.register(handle, params={})
      header = { user_handle: handle }
      message = 'entity_msg'

      # Example of params passed for USER
      #
      # params = {
      #   address: {
      #     address_alias: "home",
      #     street_address_1: "123 Main Street",
      #     city: "New City",
      #     state: "OR",
      #     country: "US",
      #     postal_code: "97204-1234"
      #   },
      #   identity: {
      #     identity_alias: "SSN",
      #     identity_value: "123452222"
      #   },
      #   contact: {
      #     phone: "503-123-4567",
      #     contact_alias: "",
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
      #
      #
      # Example of params passed for BUSINESS
      #
      # params = {
      #   identity: {
      #     identity_alias: "EIN",
      #     identity_value: "12-1234567"
      #   },
      #   address: {
      #     address_alias: "Office",
      #     street_address_1: "123 Candelabra Blvd.",
      #     city: "Portland",
      #     state: "OR",
      #     country: "US",
      #     postal_code: "97204"
      #   },
      #   contact: {
      #     phone: "1231231234",
      #     email: "business@businessemail.com"
      #   },
      #   entity: {
      #     type: "business",
      #     entity_name: "Your Business Customer, Inc.",
      #     business_type: "corporation",
      #     business_website: "https://www.yourbusinesscustomer.com",
      #     doing_business_as: "Your Business Customer Alias Co.",
      #     naics_code: 721
      #   },
      #   crypto_entry: {
      #     crypto_code: "ETH",
      #     crypto_address: "0x67CB...E1FB"
      #   }
      # }

      sila_post_signed('register', header, message, params, nil, nil)
    end

    # --------------------------------------------
    # ADD-REGISTRATION ---------------------------
    # --------------------------------------------
    # Add a new email, phone number, street address, or identity to a registered entity.
    def self.add_registration(handle, params={}, valid_path, user_key)
      header = { user_handle: handle }
      message = 'header_msg'

      # Valid path options
      #
      # email
      # phone
      # identity
      # address
      #
      #
      # Example of params passed
      #
      # params = {
      #   email: "test@silamoney.com"
      # }

      sila_post_signed('add/' + valid_path, header, message, params, user_key, nil)
    end

    # --------------------------------------------
    # UPDATE-REGISTRATION ------------------------
    # --------------------------------------------
    # Update an existing email, phone number, street address, identity, or entity (name, birthdate, or business data).
    def self.update_registration(handle, params={}, valid_path, user_key)
      header = { user_handle: handle }
      message = 'header_msg'

      # Valid path options
      #
      # email
      # phone
      # identity
      # address
      # entity
      #
      #
      # Example of params passed
      #
      # params = {
      #   uuid: "7f83044b-63c8-4d56-b107-d52fa7ae2d7a",
      #   email: "test@silamoney.com"
      # }

      sila_post_signed('update/' + valid_path, header, message, params, user_key, nil)
    end

    # --------------------------------------------
    # DELETE-REGISTRATION ------------------------
    # --------------------------------------------
    # Delete an existing email, phone number, street address, or identity.
    def self.delete_registration(handle, params={}, valid_path, user_key)
      header = { user_handle: handle }
      message = 'header_msg'

      # Valid path options
      #
      # email
      # phone
      # identity
      # address
      #
      #
      # Example of params passed
      #
      # params = {
      #   uuid: "7f83044b-63c8-4d56-b107-d52fa7ae2d7a"
      # }

      sila_post_signed('delete/' + valid_path, header, message, params, user_key, nil)
    end

    # --------------------------------------------
    # LINK-BUSINESS-MEMBER -----------------------
    # --------------------------------------------
    #
    def self.link_business_member(handle, params={}, user_key, business_handle, business_key)
      header = { user_handle: handle, business_handle: business_handle }
      message = 'header_msg'

      # Example of params passed
      #
      # params = {
      #   role: "controlling_officer",
      #   member_handle: "your_individual_user_handle"
      # }

      sila_post_signed('link_business_member', header, message, params, user_key, business_key)
    end

    # --------------------------------------------
    # UNLINK-BUSINESS-MEMBER ---------------------
    # --------------------------------------------
    #

    # --------------------------------------------
    # REQUEST-KYC --------------------------------
    # --------------------------------------------
    # Start KYC verification process on a registered user handle
    def self.request_kyc(handle, params={}, user_key)
      header = { user_handle: handle }
      message = 'header_msg'

      # Optional params for requesting KYC
      #
      # params = {
      #   kyc_level: "NONE"
      # }

      sila_post_signed('request_kyc', header, message, params, user_key, nil)
    end

    # --------------------------------------------
    # CHECK-KYC ----------------------------------
    # --------------------------------------------
    # Whether entity attached to user handle is verified, not valid, or pending
    def self.check_kyc(handle, user_key)
      header = { user_handle: handle }
      message = 'header_msg'
      sila_post_signed('check_kyc', header, message, nil, user_key, nil)
    end

    # --------------------------------------------
    # CERTIFY-BENEFICIAL-OWNER -------------------
    # --------------------------------------------
    #
    def self.certify_beneficial_owner(handle, params={}, user_key, business_handle, business_key)
      header = { user_handle: handle, business_handle: business_handle }
      message = 'header_msg'

      # Example of params passed
      #
      # params = {
        # member_handle: "your_beneficial_owner_member.silamoney.eth",
        # certification_token: "889288b15f686baa1f782ba6f51f3594fcfc72cb"
      # }

      sila_post_signed('certify_beneficial_owner', header, message, params, user_key, business_key)
    end

    # --------------------------------------------
    # CERTIFY-BUSINESS ---------------------------
    # --------------------------------------------
    #
    def self.certify_business(handle, user_key, business_handle, business_key)
      header = { user_handle: handle, business_handle: business_handle }
      message = 'header_msg'

      sila_post_signed('certify_business', header, message, nil, user_key, business_key)
    end

    # --------------------------------------------
    # GET-ENTITIES -------------------------------
    # --------------------------------------------
    # Return all end-user and legal entities (businesses) associated with a customer application.
    # This endpoint allows the listing of all entities registered to an application.
    def self.get_entities(params={})
      message = 'header_msg'

      # params = {
      #   entity_type: "individual"
      # }

      sila_post_signed('get_entities', {}, message, params, nil, nil)
    end

    # --------------------------------------------
    # GET-ENTITY ---------------------------------
    # --------------------------------------------
    # Gets identifying information about a registered entity.
    def self.get_entity(handle, user_key)
      header = { user_handle: handle }
      message = 'header_msg'

      sila_post_signed('get_entity', header, message, nil, user_key, nil)
    end

    # --------------------------------------------
    # DOCUMENTS ----------------------------------
    # --------------------------------------------
    #

    # --------------------------------------------
    # LIST-DOCUMENTS -----------------------------
    # --------------------------------------------
    #

    # --------------------------------------------
    # GET-DOCUMENT -------------------------------
    # --------------------------------------------
    #

    # --------------------------------------------
    # DOCUMENT-TYPES -----------------------------
    # --------------------------------------------
    #

    # --------------------------------------------
    # CHECK-PARTNER-KYC --------------------------
    # --------------------------------------------
    # Check KYC status of end-users across apps
    def self.check_partner_kyc(params={})
      message = 'header_msg'

      # Example of params passed for partner
      #
      # params = {
      #   query_app_handle: "PARTNER_COMPANY_APP",
      #   query_user_handle: "PARTNER_USER_HANDLE"
      # }

      sila_post_signed('check_partner_kyc', {}, message, params, nil, nil)
    end

  end
end
