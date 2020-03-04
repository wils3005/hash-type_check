# frozen_string_literal: true

class Hash
  module TypeCheck
    Error = Class.new(StandardError)

    VERSION = '0.1.0'

    def type_check(**schema)
      schema.each do |key, schema_value|
        actual_value = self[key]
        actual_type = actual_value.class

        if actual_type == schema_value
          next
        elsif actual_value.is_a?(Hash) && schema_value.is_a?(Hash)
          actual_value.type_check(**schema_value)
        elsif !key?(key)
          raise(Error, "key not found: #{key.inspect}")
        else
          expected_type =
            schema_value.is_a?(Hash) ?
            schema_value.class :
            schema_value

          raise(
            Error,
            "key: #{key.inspect}, " \
            "expected: #{expected_type.inspect}, " \
            "actual: #{actual_type.inspect}"
          )
        end
      end

      nil
    end

    Hash.include(self)
  end
end
