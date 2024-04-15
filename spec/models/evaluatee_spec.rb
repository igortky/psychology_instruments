# spec/models/evaluatee_spec.rb
require 'rails_helper'

RSpec.describe Evaluatee, type: :model do
  it { should belong_to(:psychologist) }
  it { should have_many(:assessments) }
  it { should have_many(:instruments).through(:assessments) }

  describe 'email validations' do
    subject { Evaluatee.new(cpf: '12345678902', email: 'test1@example.com') }
    it { should validate_presence_of(:email) }
    it { should allow_value('test@example.com').for(:email) }
    it { should_not allow_value('invalid_email').for(:email) }
  end

  describe 'cpf validations' do
    subject { Evaluatee.new(cpf: '12345678903', email: 'test2@example.com') }
    it { should validate_presence_of(:cpf) }
    it { should validate_length_of(:cpf).is_equal_to(11) }
    it { should allow_value('12345678901').for(:cpf) }
    it { should_not allow_value('1234567890a').for(:cpf) }
  end
end
