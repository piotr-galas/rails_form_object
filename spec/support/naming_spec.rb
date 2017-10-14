# frozen_string_literal: true

require 'spec_helper'
require 'support/example_forms'
require 'action_view/model_naming'

RSpec.describe RailsFormObject do
  include ActionView::ModelNaming

  let(:valid_params) { { empty: '', number: 1, string: 'some_string' } }

  it 'override name if form_for method' do
    form = NoValidationsForm.new(valid_params)
    expect(model_name_from_record_or_class(form).param_key).to eq 'person'
  end
end
