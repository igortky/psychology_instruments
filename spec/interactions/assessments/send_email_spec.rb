require 'rails_helper'

RSpec.describe Assessments::SendEmail do
  subject(:run) { described_class.run(evaluatee:, assessment_id:) }
  let(:evaluatee) { create(:evaluatee) }
  let(:assessment_id) { create(:assessment, evaluatee:).id }

  it 'sends AssessmentMailer' do
    perform_enqueued_jobs do
      expect { run }.to change { ActionMailer::Base.deliveries.size }.by(1)
    end
  end
end
