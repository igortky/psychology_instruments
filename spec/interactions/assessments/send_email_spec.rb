require 'rails_helper'

RSpec.describe Assessments::SendEmail do
  subject(:run) { described_class.run(evaluatee:) }
  let(:evaluatee) { create(:evaluatee) }

  it 'sends AssessmentMailer' do
    perform_enqueued_jobs do
      expect { run }.to change { ActionMailer::Base.deliveries.size }.by(1)
    end
  end
end
