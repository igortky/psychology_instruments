require 'rails_helper'

RSpec.describe Instrument, type: :model do
  it { should have_many(:assessments) }
  it { should have_many(:evaluatees).through(:assessments) }
end
