require 'dotenv/load'
require 'digest/sha3'
require 'securerandom'
require 'openssl'
require 'addressable/uri'
require 'deep_symbolize'
require 'json'
require 'httparty'
require 'eth'

require 'sila-ruby/version'
require 'sila-ruby/api_helpers'
require 'sila-ruby/accounts'
require 'sila-ruby/banks'
require 'sila-ruby/transactions'

# ================================================
# SILA-RUBY ======================================
# ================================================
module SilaRuby

  # ----------------------------------------------
  # SELF -----------------------------------------
  # ----------------------------------------------
  class << self
    attr_accessor :configuration
  end

  # ----------------------------------------------
  # SETUP ----------------------------------------
  # ----------------------------------------------
  def self.setup
    @configuration ||= Configuration.new
    yield(configuration)
  end

  # ----------------------------------------------
  # CONFIGURATION --------------------------------
  # ----------------------------------------------
  class Configuration
    attr_accessor :address, :handle, :private_key

    def initialize
      @address = ''
      @handle = ''
      @pkey = ''
    end
  end

end
