require 'dotenv/load'
require 'securerandom'
require 'openssl'
require 'addressable/uri'
require 'deep_symbolize'
require 'json'
require 'httparty'
require 'eth'

require 'sila-ruby/version'
require 'sila-ruby/api_helpers'
require 'sila-ruby/entities'
require 'sila-ruby/accounts'
require 'sila-ruby/transactions'
require 'sila-ruby/wallets'
require 'sila-ruby/utilities'

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
    attr_accessor :env, :address, :handle, :private_key

    def initialize
      @env = ''
      @address = ''
      @handle = ''
      @pkey = ''
    end
  end

end
