=begin
#DocuSign REST API

#The DocuSign REST API provides you with a powerful, convenient, and simple Web services API for interacting with DocuSign.

OpenAPI spec version: v2.1
Contact: devcenter@docusign.com
Generated by: https://github.com/swagger-api/swagger-codegen.git

=end

require 'date'

module DocuSign_eSign
  # Result set for the Envelopes: listStatusChanges method
  class EnvelopesInformation
    # 
    attr_accessor :continuation_token

    # The last position in the result set. 
    attr_accessor :end_position

    # 
    attr_accessor :envelopes

    # 
    attr_accessor :envelope_transaction_statuses

    # 
    attr_accessor :folders

    # 
    attr_accessor :last_queried_date_time

    # The URI to the next chunk of records based on the search request. If the endPosition is the entire results of the search, this is null. 
    attr_accessor :next_uri

    # The postal code for the billing address.
    attr_accessor :previous_uri

    # The number of results returned in this response. 
    attr_accessor :result_set_size

    # Starting position of the current result set.
    attr_accessor :start_position

    # The total number of items available in the result set. This will always be greater than or equal to the value of the property returning the results in the in the response.
    attr_accessor :total_set_size

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'continuation_token' => :'continuationToken',
        :'end_position' => :'endPosition',
        :'envelopes' => :'envelopes',
        :'envelope_transaction_statuses' => :'envelopeTransactionStatuses',
        :'folders' => :'folders',
        :'last_queried_date_time' => :'lastQueriedDateTime',
        :'next_uri' => :'nextUri',
        :'previous_uri' => :'previousUri',
        :'result_set_size' => :'resultSetSize',
        :'start_position' => :'startPosition',
        :'total_set_size' => :'totalSetSize'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'continuation_token' => :'String',
        :'end_position' => :'String',
        :'envelopes' => :'Array<Envelope>',
        :'envelope_transaction_statuses' => :'Array<EnvelopeTransactionStatus>',
        :'folders' => :'Array<Folder>',
        :'last_queried_date_time' => :'String',
        :'next_uri' => :'String',
        :'previous_uri' => :'String',
        :'result_set_size' => :'String',
        :'start_position' => :'String',
        :'total_set_size' => :'String'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'continuationToken')
        self.continuation_token = attributes[:'continuationToken']
      end

      if attributes.has_key?(:'endPosition')
        self.end_position = attributes[:'endPosition']
      end

      if attributes.has_key?(:'envelopes')
        if (value = attributes[:'envelopes']).is_a?(Array)
          self.envelopes = value
        end
      end

      if attributes.has_key?(:'envelopeTransactionStatuses')
        if (value = attributes[:'envelopeTransactionStatuses']).is_a?(Array)
          self.envelope_transaction_statuses = value
        end
      end

      if attributes.has_key?(:'folders')
        if (value = attributes[:'folders']).is_a?(Array)
          self.folders = value
        end
      end

      if attributes.has_key?(:'lastQueriedDateTime')
        self.last_queried_date_time = attributes[:'lastQueriedDateTime']
      end

      if attributes.has_key?(:'nextUri')
        self.next_uri = attributes[:'nextUri']
      end

      if attributes.has_key?(:'previousUri')
        self.previous_uri = attributes[:'previousUri']
      end

      if attributes.has_key?(:'resultSetSize')
        self.result_set_size = attributes[:'resultSetSize']
      end

      if attributes.has_key?(:'startPosition')
        self.start_position = attributes[:'startPosition']
      end

      if attributes.has_key?(:'totalSetSize')
        self.total_set_size = attributes[:'totalSetSize']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          continuation_token == o.continuation_token &&
          end_position == o.end_position &&
          envelopes == o.envelopes &&
          envelope_transaction_statuses == o.envelope_transaction_statuses &&
          folders == o.folders &&
          last_queried_date_time == o.last_queried_date_time &&
          next_uri == o.next_uri &&
          previous_uri == o.previous_uri &&
          result_set_size == o.result_set_size &&
          start_position == o.start_position &&
          total_set_size == o.total_set_size
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [continuation_token, end_position, envelopes, envelope_transaction_statuses, folders, last_queried_date_time, next_uri, previous_uri, result_set_size, start_position, total_set_size].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.swagger_types.each_pair do |key, type|
        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :BOOLEAN
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        temp_model = DocuSign_eSign.const_get(type).new
        temp_model.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        next if value.nil?
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end
end
