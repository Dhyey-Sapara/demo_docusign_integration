=begin
#DocuSign REST API

#The DocuSign REST API provides you with a powerful, convenient, and simple Web services API for interacting with DocuSign.

OpenAPI spec version: v2.1
Contact: devcenter@docusign.com
Generated by: https://github.com/swagger-api/swagger-codegen.git

=end

require 'date'

module DocuSign_eSign
  class TabMetadata
    # An optional string that is used to auto-match tabs to strings located in the documents of an envelope.
    attr_accessor :anchor

    # When set to **true**, the anchor string does not consider case when matching strings in the document. The default value is **true**.
    attr_accessor :anchor_case_sensitive

    # Specifies the alignment of anchor tabs with anchor strings. Possible values are **left** or **right**. The default value is **left**.
    attr_accessor :anchor_horizontal_alignment

    # When set to **true**, this tab is ignored if anchorString is not found in the document.
    attr_accessor :anchor_ignore_if_not_present

    # When set to **true**, the anchor string in this tab matches whole words only (strings embedded in other strings are ignored.) The default value is **true**.
    attr_accessor :anchor_match_whole_word

    # Specifies units of the X and Y offset. Units could be pixels, millimeters, centimeters, or inches.
    attr_accessor :anchor_units

    # Specifies the X axis location of the tab, in anchorUnits, relative to the anchorString.
    attr_accessor :anchor_x_offset

    # Specifies the Y axis location of the tab, in anchorUnits, relative to the anchorString.
    attr_accessor :anchor_y_offset

    # When set to **true**, the information in the tab is bold.
    attr_accessor :bold

    # 
    attr_accessor :collaborative

    # When set to **true**, the field appears normally while the recipient is adding or modifying the information in the field, but the data is not visible (the characters are hidden by asterisks) to any other signer or the sender.  When an envelope is completed the information is available to the sender through the Form Data link in the DocuSign Console.  This setting applies only to text boxes and does not affect list boxes, radio buttons, or check boxes.
    attr_accessor :conceal_value_on_document

    # The user name of the DocuSign user who created this object.
    attr_accessor :created_by_display_name

    # The userId of the DocuSign user who created this object.
    attr_accessor :created_by_user_id

    # The DocuSign generated custom tab ID for the custom tab to be applied. This can only be used when adding new tabs for a recipient. When used, the new tab inherits all the custom tab properties.
    attr_accessor :custom_tab_id

    # When set to **true**, disables the auto sizing of single line text boxes in the signing screen when the signer enters data. If disabled users will only be able enter as much data as the text box can hold. By default this is false. This property only affects single line text boxes.
    attr_accessor :disable_auto_size

    # When set to **true**, the custom tab is editable. Otherwise the custom tab cannot be modified.
    attr_accessor :editable

    # The font to be used for the tab value. Supported Fonts: Arial, Arial, ArialNarrow, Calibri, CourierNew, Garamond, Georgia, Helvetica,   LucidaConsole, Tahoma, TimesNewRoman, Trebuchet, Verdana, MSGothic, MSMincho, Default.
    attr_accessor :font

    # The font color used for the information in the tab.  Possible values are: Black, BrightBlue, BrightRed, DarkGreen, DarkRed, Gold, Green, NavyBlue, Purple, or White.
    attr_accessor :font_color

    # The font size used for the information in the tab.  Possible values are: Size7, Size8, Size9, Size10, Size11, Size12, Size14, Size16, Size18, Size20, Size22, Size24, Size26, Size28, Size36, Size48, or Size72.
    attr_accessor :font_size

    # Height of the tab in pixels.
    attr_accessor :height

    # When set to **true**, the tab is included in e-mails related to the envelope on which it exists. This applies to only specific tabs.
    attr_accessor :included_in_email

    # The original value of the tab.
    attr_accessor :initial_value

    # When set to **true**, the information in the tab is italic.
    attr_accessor :italic

    # If the tab is a list, this represents the values that are possible for the tab.
    attr_accessor :items

    # The UTC DateTime this object was last modified. This is in ISO8601 format.
    attr_accessor :last_modified

    # The User Name of the DocuSign user who last modified this object.
    attr_accessor :last_modified_by_display_name

    # The userId of the DocuSign user who last modified this object.
    attr_accessor :last_modified_by_user_id

    # Reserved for DocuSign.
    attr_accessor :locale_policy

    # When set to **true**, the signer cannot change the data of the custom tab.
    attr_accessor :locked

    # The maximum number of entry characters supported by the custom tab.
    attr_accessor :maximum_length

    # 
    attr_accessor :max_numerical_value

    # Contains the information necessary to map the tab to a field in SalesForce.
    attr_accessor :merge_field

    # 
    attr_accessor :min_numerical_value

    # 
    attr_accessor :name

    # 
    attr_accessor :numerical_value

    # 
    attr_accessor :payment_item_code

    # 
    attr_accessor :payment_item_description

    # 
    attr_accessor :payment_item_name

    # When set to **true** and shared is true, information must be entered in this field to complete the envelope. 
    attr_accessor :require_all

    # When set to **true**, the signer is required to fill out this tab
    attr_accessor :required

    # Optional element for field markup. When set to **true**, the signer is required to initial when they modify a shared field.
    attr_accessor :require_initial_on_shared_change

    # 
    attr_accessor :scale_value

    # 
    attr_accessor :selected

    # When set to **true**, this custom tab is shared.
    attr_accessor :shared

    # 
    attr_accessor :signature_provider_id

    # 
    attr_accessor :stamp_type

    # Metadata that indicates whether the `stampType` property is editable.
    attr_accessor :stamp_type_metadata

    # The label string associated with the tab.
    attr_accessor :tab_label

    # The type of this tab. Values are: Approve, CheckBox, Company, Date, DateSigned, Decline, Email, EmailAddress, EnvelopeId, FirstName, Formula, FullName, InitialHere, InitialHereOptional, LastName, List, Note, Number, Radio, SignerAttachment, SignHere, SignHereOptional, Ssn, Text, Title, Zip5, or Zip5Dash4.
    attr_accessor :type

    # When set to **true**, the information in the tab is underlined.
    attr_accessor :underline

    # The message displayed if the custom tab fails input validation (either custom of embedded).
    attr_accessor :validation_message

    # A regular expression used to validate input for the tab.
    attr_accessor :validation_pattern

    # Width of the tab in pixels.
    attr_accessor :width

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'anchor' => :'anchor',
        :'anchor_case_sensitive' => :'anchorCaseSensitive',
        :'anchor_horizontal_alignment' => :'anchorHorizontalAlignment',
        :'anchor_ignore_if_not_present' => :'anchorIgnoreIfNotPresent',
        :'anchor_match_whole_word' => :'anchorMatchWholeWord',
        :'anchor_units' => :'anchorUnits',
        :'anchor_x_offset' => :'anchorXOffset',
        :'anchor_y_offset' => :'anchorYOffset',
        :'bold' => :'bold',
        :'collaborative' => :'collaborative',
        :'conceal_value_on_document' => :'concealValueOnDocument',
        :'created_by_display_name' => :'createdByDisplayName',
        :'created_by_user_id' => :'createdByUserId',
        :'custom_tab_id' => :'customTabId',
        :'disable_auto_size' => :'disableAutoSize',
        :'editable' => :'editable',
        :'font' => :'font',
        :'font_color' => :'fontColor',
        :'font_size' => :'fontSize',
        :'height' => :'height',
        :'included_in_email' => :'includedInEmail',
        :'initial_value' => :'initialValue',
        :'italic' => :'italic',
        :'items' => :'items',
        :'last_modified' => :'lastModified',
        :'last_modified_by_display_name' => :'lastModifiedByDisplayName',
        :'last_modified_by_user_id' => :'lastModifiedByUserId',
        :'locale_policy' => :'localePolicy',
        :'locked' => :'locked',
        :'maximum_length' => :'maximumLength',
        :'max_numerical_value' => :'maxNumericalValue',
        :'merge_field' => :'mergeField',
        :'min_numerical_value' => :'minNumericalValue',
        :'name' => :'name',
        :'numerical_value' => :'numericalValue',
        :'payment_item_code' => :'paymentItemCode',
        :'payment_item_description' => :'paymentItemDescription',
        :'payment_item_name' => :'paymentItemName',
        :'require_all' => :'requireAll',
        :'required' => :'required',
        :'require_initial_on_shared_change' => :'requireInitialOnSharedChange',
        :'scale_value' => :'scaleValue',
        :'selected' => :'selected',
        :'shared' => :'shared',
        :'signature_provider_id' => :'signatureProviderId',
        :'stamp_type' => :'stampType',
        :'stamp_type_metadata' => :'stampTypeMetadata',
        :'tab_label' => :'tabLabel',
        :'type' => :'type',
        :'underline' => :'underline',
        :'validation_message' => :'validationMessage',
        :'validation_pattern' => :'validationPattern',
        :'width' => :'width'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'anchor' => :'String',
        :'anchor_case_sensitive' => :'String',
        :'anchor_horizontal_alignment' => :'String',
        :'anchor_ignore_if_not_present' => :'String',
        :'anchor_match_whole_word' => :'String',
        :'anchor_units' => :'String',
        :'anchor_x_offset' => :'String',
        :'anchor_y_offset' => :'String',
        :'bold' => :'String',
        :'collaborative' => :'String',
        :'conceal_value_on_document' => :'String',
        :'created_by_display_name' => :'String',
        :'created_by_user_id' => :'String',
        :'custom_tab_id' => :'String',
        :'disable_auto_size' => :'String',
        :'editable' => :'String',
        :'font' => :'String',
        :'font_color' => :'String',
        :'font_size' => :'String',
        :'height' => :'String',
        :'included_in_email' => :'String',
        :'initial_value' => :'String',
        :'italic' => :'String',
        :'items' => :'Array<String>',
        :'last_modified' => :'String',
        :'last_modified_by_display_name' => :'String',
        :'last_modified_by_user_id' => :'String',
        :'locale_policy' => :'LocalePolicyTab',
        :'locked' => :'String',
        :'maximum_length' => :'String',
        :'max_numerical_value' => :'String',
        :'merge_field' => :'MergeField',
        :'min_numerical_value' => :'String',
        :'name' => :'String',
        :'numerical_value' => :'String',
        :'payment_item_code' => :'String',
        :'payment_item_description' => :'String',
        :'payment_item_name' => :'String',
        :'require_all' => :'String',
        :'required' => :'String',
        :'require_initial_on_shared_change' => :'String',
        :'scale_value' => :'String',
        :'selected' => :'String',
        :'shared' => :'String',
        :'signature_provider_id' => :'String',
        :'stamp_type' => :'String',
        :'stamp_type_metadata' => :'PropertyMetadata',
        :'tab_label' => :'String',
        :'type' => :'String',
        :'underline' => :'String',
        :'validation_message' => :'String',
        :'validation_pattern' => :'String',
        :'width' => :'String'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'anchor')
        self.anchor = attributes[:'anchor']
      end

      if attributes.has_key?(:'anchorCaseSensitive')
        self.anchor_case_sensitive = attributes[:'anchorCaseSensitive']
      end

      if attributes.has_key?(:'anchorHorizontalAlignment')
        self.anchor_horizontal_alignment = attributes[:'anchorHorizontalAlignment']
      end

      if attributes.has_key?(:'anchorIgnoreIfNotPresent')
        self.anchor_ignore_if_not_present = attributes[:'anchorIgnoreIfNotPresent']
      end

      if attributes.has_key?(:'anchorMatchWholeWord')
        self.anchor_match_whole_word = attributes[:'anchorMatchWholeWord']
      end

      if attributes.has_key?(:'anchorUnits')
        self.anchor_units = attributes[:'anchorUnits']
      end

      if attributes.has_key?(:'anchorXOffset')
        self.anchor_x_offset = attributes[:'anchorXOffset']
      end

      if attributes.has_key?(:'anchorYOffset')
        self.anchor_y_offset = attributes[:'anchorYOffset']
      end

      if attributes.has_key?(:'bold')
        self.bold = attributes[:'bold']
      end

      if attributes.has_key?(:'collaborative')
        self.collaborative = attributes[:'collaborative']
      end

      if attributes.has_key?(:'concealValueOnDocument')
        self.conceal_value_on_document = attributes[:'concealValueOnDocument']
      end

      if attributes.has_key?(:'createdByDisplayName')
        self.created_by_display_name = attributes[:'createdByDisplayName']
      end

      if attributes.has_key?(:'createdByUserId')
        self.created_by_user_id = attributes[:'createdByUserId']
      end

      if attributes.has_key?(:'customTabId')
        self.custom_tab_id = attributes[:'customTabId']
      end

      if attributes.has_key?(:'disableAutoSize')
        self.disable_auto_size = attributes[:'disableAutoSize']
      end

      if attributes.has_key?(:'editable')
        self.editable = attributes[:'editable']
      end

      if attributes.has_key?(:'font')
        self.font = attributes[:'font']
      end

      if attributes.has_key?(:'fontColor')
        self.font_color = attributes[:'fontColor']
      end

      if attributes.has_key?(:'fontSize')
        self.font_size = attributes[:'fontSize']
      end

      if attributes.has_key?(:'height')
        self.height = attributes[:'height']
      end

      if attributes.has_key?(:'includedInEmail')
        self.included_in_email = attributes[:'includedInEmail']
      end

      if attributes.has_key?(:'initialValue')
        self.initial_value = attributes[:'initialValue']
      end

      if attributes.has_key?(:'italic')
        self.italic = attributes[:'italic']
      end

      if attributes.has_key?(:'items')
        if (value = attributes[:'items']).is_a?(Array)
          self.items = value
        end
      end

      if attributes.has_key?(:'lastModified')
        self.last_modified = attributes[:'lastModified']
      end

      if attributes.has_key?(:'lastModifiedByDisplayName')
        self.last_modified_by_display_name = attributes[:'lastModifiedByDisplayName']
      end

      if attributes.has_key?(:'lastModifiedByUserId')
        self.last_modified_by_user_id = attributes[:'lastModifiedByUserId']
      end

      if attributes.has_key?(:'localePolicy')
        self.locale_policy = attributes[:'localePolicy']
      end

      if attributes.has_key?(:'locked')
        self.locked = attributes[:'locked']
      end

      if attributes.has_key?(:'maximumLength')
        self.maximum_length = attributes[:'maximumLength']
      end

      if attributes.has_key?(:'maxNumericalValue')
        self.max_numerical_value = attributes[:'maxNumericalValue']
      end

      if attributes.has_key?(:'mergeField')
        self.merge_field = attributes[:'mergeField']
      end

      if attributes.has_key?(:'minNumericalValue')
        self.min_numerical_value = attributes[:'minNumericalValue']
      end

      if attributes.has_key?(:'name')
        self.name = attributes[:'name']
      end

      if attributes.has_key?(:'numericalValue')
        self.numerical_value = attributes[:'numericalValue']
      end

      if attributes.has_key?(:'paymentItemCode')
        self.payment_item_code = attributes[:'paymentItemCode']
      end

      if attributes.has_key?(:'paymentItemDescription')
        self.payment_item_description = attributes[:'paymentItemDescription']
      end

      if attributes.has_key?(:'paymentItemName')
        self.payment_item_name = attributes[:'paymentItemName']
      end

      if attributes.has_key?(:'requireAll')
        self.require_all = attributes[:'requireAll']
      end

      if attributes.has_key?(:'required')
        self.required = attributes[:'required']
      end

      if attributes.has_key?(:'requireInitialOnSharedChange')
        self.require_initial_on_shared_change = attributes[:'requireInitialOnSharedChange']
      end

      if attributes.has_key?(:'scaleValue')
        self.scale_value = attributes[:'scaleValue']
      end

      if attributes.has_key?(:'selected')
        self.selected = attributes[:'selected']
      end

      if attributes.has_key?(:'shared')
        self.shared = attributes[:'shared']
      end

      if attributes.has_key?(:'signatureProviderId')
        self.signature_provider_id = attributes[:'signatureProviderId']
      end

      if attributes.has_key?(:'stampType')
        self.stamp_type = attributes[:'stampType']
      end

      if attributes.has_key?(:'stampTypeMetadata')
        self.stamp_type_metadata = attributes[:'stampTypeMetadata']
      end

      if attributes.has_key?(:'tabLabel')
        self.tab_label = attributes[:'tabLabel']
      end

      if attributes.has_key?(:'type')
        self.type = attributes[:'type']
      end

      if attributes.has_key?(:'underline')
        self.underline = attributes[:'underline']
      end

      if attributes.has_key?(:'validationMessage')
        self.validation_message = attributes[:'validationMessage']
      end

      if attributes.has_key?(:'validationPattern')
        self.validation_pattern = attributes[:'validationPattern']
      end

      if attributes.has_key?(:'width')
        self.width = attributes[:'width']
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
          anchor == o.anchor &&
          anchor_case_sensitive == o.anchor_case_sensitive &&
          anchor_horizontal_alignment == o.anchor_horizontal_alignment &&
          anchor_ignore_if_not_present == o.anchor_ignore_if_not_present &&
          anchor_match_whole_word == o.anchor_match_whole_word &&
          anchor_units == o.anchor_units &&
          anchor_x_offset == o.anchor_x_offset &&
          anchor_y_offset == o.anchor_y_offset &&
          bold == o.bold &&
          collaborative == o.collaborative &&
          conceal_value_on_document == o.conceal_value_on_document &&
          created_by_display_name == o.created_by_display_name &&
          created_by_user_id == o.created_by_user_id &&
          custom_tab_id == o.custom_tab_id &&
          disable_auto_size == o.disable_auto_size &&
          editable == o.editable &&
          font == o.font &&
          font_color == o.font_color &&
          font_size == o.font_size &&
          height == o.height &&
          included_in_email == o.included_in_email &&
          initial_value == o.initial_value &&
          italic == o.italic &&
          items == o.items &&
          last_modified == o.last_modified &&
          last_modified_by_display_name == o.last_modified_by_display_name &&
          last_modified_by_user_id == o.last_modified_by_user_id &&
          locale_policy == o.locale_policy &&
          locked == o.locked &&
          maximum_length == o.maximum_length &&
          max_numerical_value == o.max_numerical_value &&
          merge_field == o.merge_field &&
          min_numerical_value == o.min_numerical_value &&
          name == o.name &&
          numerical_value == o.numerical_value &&
          payment_item_code == o.payment_item_code &&
          payment_item_description == o.payment_item_description &&
          payment_item_name == o.payment_item_name &&
          require_all == o.require_all &&
          required == o.required &&
          require_initial_on_shared_change == o.require_initial_on_shared_change &&
          scale_value == o.scale_value &&
          selected == o.selected &&
          shared == o.shared &&
          signature_provider_id == o.signature_provider_id &&
          stamp_type == o.stamp_type &&
          stamp_type_metadata == o.stamp_type_metadata &&
          tab_label == o.tab_label &&
          type == o.type &&
          underline == o.underline &&
          validation_message == o.validation_message &&
          validation_pattern == o.validation_pattern &&
          width == o.width
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [anchor, anchor_case_sensitive, anchor_horizontal_alignment, anchor_ignore_if_not_present, anchor_match_whole_word, anchor_units, anchor_x_offset, anchor_y_offset, bold, collaborative, conceal_value_on_document, created_by_display_name, created_by_user_id, custom_tab_id, disable_auto_size, editable, font, font_color, font_size, height, included_in_email, initial_value, italic, items, last_modified, last_modified_by_display_name, last_modified_by_user_id, locale_policy, locked, maximum_length, max_numerical_value, merge_field, min_numerical_value, name, numerical_value, payment_item_code, payment_item_description, payment_item_name, require_all, required, require_initial_on_shared_change, scale_value, selected, shared, signature_provider_id, stamp_type, stamp_type_metadata, tab_label, type, underline, validation_message, validation_pattern, width].hash
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
