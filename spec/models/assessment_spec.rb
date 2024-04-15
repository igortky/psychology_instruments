require 'rails_helper'

RSpec.describe Assessment, type: :model do
  it { should belong_to(:evaluatee) }
  it { should belong_to(:instrument) }
  it { should belong_to(:psychologist) }

  describe '#total_score' do
    let(:assessment) { create(:assessment, responses:) }
    let(:responses) do
      ['Option 1', 'Option 1', 'Option 1', 'Option 1', 'Option 2']
    end

    it 'returns the total score of the responses' do
      expect(assessment.total_score).to eq(14)
    end
  end
end
