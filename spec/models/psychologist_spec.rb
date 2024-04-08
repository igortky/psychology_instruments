# spec/models/psychologist_spec.rb
require 'rails_helper'

RSpec.describe Psychologist, type: :model do
  it { is_expected.to have_many(:evaluatees) }
end
