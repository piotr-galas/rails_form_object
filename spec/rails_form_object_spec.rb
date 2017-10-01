# frozen_string_literal: true

require 'spec_helper'
require 'support/example_forms'

RSpec.describe RailsFormObject do
  let(:valid_params) { { empty: '', number: 1, string: 'some_string' } }
  let(:invalid_params) { { empty: '', number: 'string', string: '' } }

  context 'initialize new object' do
    it 'railse exception when attributes are not defined' do
      expect { EmptyForm.new(not_exist_param: '') }.to raise_error RailsFormObject::AttributesMustBeDefined
    end

    it 'creates valid object when no validations are provide' do
      expect(NoValidationsForm.new(valid_params).valid?).to be true
    end
  end

  context 'validations' do
    it 'run active record validations, and valid? return true  when params are valid' do
      expect(WithValidationsForm.new(valid_params).valid?).to be true
    end

    it 'run active record validations, and valid? return true  when params are valid' do
      form = WithValidationsForm.new(invalid_params)
      expect(form.valid?).to be false
      expect(form.errors.count).to eq 2
    end
  end
end
