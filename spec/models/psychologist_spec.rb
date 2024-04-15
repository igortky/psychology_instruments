require 'rails_helper'

RSpec.describe Psychologist, type: :model do
  subject { Psychologist.new(password: 'password', password_confirmation: 'password') }

  it { should have_many(:evaluatees) }

  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should allow_value('test@example.com').for(:email) }
  it { should_not allow_value('invalid_email').for(:email) }
end
