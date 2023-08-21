# ================================================
# SILA-RUBY->API-HELPERS =========================
# ================================================
module ApiHelpers

  # ==============================================
  # INCLUDED =====================================
  # ==============================================
  def self.included(base)
    base.extend(ClassMethods)
  end

  # ==============================================
  # HTTPHEADER ===================================
  # ==============================================
  # Sila's API doesn't allow lowercase headers
  module Net::HTTPHeader
    def capitalize(name)
      name
    end
    private :capitalize
  end

  # ==============================================
  # CLASS-METHODS ================================
  # ==============================================
  module ClassMethods

    # --------------------------------------------
    # SILA-URI -----------------------------------
    # --------------------------------------------
    def sila_uri
      SilaRuby.configuration.env == 'production' ? 'https://api.silamoney.com' : 'https://sandbox.silamoney.com'
    end

    # --------------------------------------------
    # SILA-POST-SIGNED ---------------------------
    # --------------------------------------------
    def sila_post_signed(api_group, header={}, message={}, params={}, user_key, business_key)
      # Set the post URL
      url = "#{sila_uri}/0.2/#{api_group}"
      # Create the header
      header = header.merge({reference: SecureRandom.uuid, created: Time.now.to_i, auth_handle: SilaRuby.configuration.handle, version: '0.2', crypto: 'ETH'})
      # Put together the body in JSON
      body = {
        header: header,
        message: message
      }
      unless params.nil?
        body = body.merge(params)
      end
      bodyJSON = body.to_json
      # Sign the authorization request
      auth_key = Eth::Key.new priv: SilaRuby.configuration.private_key
      auth_signature = sila_personal_sign(auth_key, bodyJSON)
      # Sign the user request
      unless user_key.nil?
        user_key = Eth::Key.new priv: user_key
        user_signature = sila_personal_sign(user_key, bodyJSON)
      end
      # Sign the business request
      unless business_key.nil?
        business_key = Eth::Key.new priv: business_key
        business_signature = sila_personal_sign(business_key, bodyJSON)
      end
      # Post to the API endpoint
      begin
        response = HTTParty.post(url, { "body": bodyJSON, "headers": { "authsignature": auth_signature, "usersignature": user_signature, "businesssignature": business_signature }})
        res_hash(response)
      rescue => e
        e.inspect
      end
    end

    # ============================================
    # PRIVATE ====================================
    # ============================================
    private

    # --------------------------------------------
    # SILA-PERSONAL-SIGNED -----------------------
    # --------------------------------------------
    def sila_personal_sign(key, message)
      key.sign(Eth::Util.keccak256(message))
    end

    # --------------------------------------------
    # RES-HASH -----------------------------------
    # --------------------------------------------
    def res_hash(res)
      data = JSON.parse(res.body)
      data.extend DeepSymbolizable
      { data: data.deep_symbolize }
    end

  end
end
