# ================================================
# DEEP-SYMBOLIZE =================================
# ================================================
module DeepSymbolizable

  # ----------------------------------------------
  # DEEP-SYMBOLIZE -------------------------------
  # ----------------------------------------------
  def deep_symbolize(&block)
    method = self.class.to_s.downcase.to_sym
    syms = DeepSymbolizable::Symbolizers
    syms.respond_to?(method) ? syms.send(method, self, &block) : self
  end

  # ----------------------------------------------
  # SYMBOLIZERS ----------------------------------
  # ----------------------------------------------
  # Used to symbolize hashes
  module Symbolizers
    module_function

    # --------------------------------------------
    # HASH ---------------------------------------
    # --------------------------------------------
    # The primary method - symbolizes keys of the given hash, preprocessing them with a block if one was given, and recursively going into all nested enumerables
    def hash(hash, &block)
      hash.each_with_object({}) do |(key, value), result|
        # Recursively deep-symbolize subhashes
        value = _recurse_(value, &block)
        # Pre-process the key with a block if it was given
        key = yield key if block_given?
        # Symbolize the key string if it responds to to_sym
        sym_key = begin
                    key.to_sym
                  rescue StandardError
                    key
                  end
        # Write it back into the result and return the updated hash
        result[sym_key] = value
      end
    end

    # --------------------------------------------
    # ARRAY --------------------------------------
    # --------------------------------------------
    # Walking over arrays and symbolizing all nested elements
    def array(ary, &block)
      ary.map { |v| _recurse_(v, &block) }
    end

    # --------------------------------------------
    # RECURSE ------------------------------------
    # --------------------------------------------
    # Handling recursion - any Enumerable elements (except String) is being extended with the module, and then symbolized
    def _recurse_(value, &block)
      if value.is_a?(Enumerable) && !value.is_a?(String)
        # Support for a use case without extended core Hash
        unless value.class.include?(DeepSymbolizable)
          value.extend DeepSymbolizable
        end
        value = value.deep_symbolize(&block)
      end
      value
    end
  end
end
