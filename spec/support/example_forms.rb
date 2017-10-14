# frozen_string_literal: true

class EmptyForm < RailsFormObject::Base; end

class NoValidationsForm < RailsFormObject::Base
  as :person
  attributes :empty, :number, :string
end

class WithValidationsForm < RailsFormObject::Base
  attributes :empty, :number, :string

  validates :number, :string, presence: true
  validates :number, numericality: true
end
