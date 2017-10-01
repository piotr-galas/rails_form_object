# frozen_string_literal: true

require 'active_model'

module RailsFormObject
  AttributesMustBeDefined = Class.new(StandardError)
  class Base
    include ActiveModel::Model

    def self.attributes(*attr)
      attr_accessor(*attr)
      define_method(:stored_attributes) { attr }
    end

    def filtered_attributes(attributes)
      raise AttributesMustBeDefined unless respond_to? :stored_attributes
      attributes.select { |key, _value| stored_attributes.include?(key.to_sym) }
    end

    def initialize(attributes)
      super(filtered_attributes(attributes))
    end
  end
end
