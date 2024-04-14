# Preview all emails at http://localhost:3000/rails/mailers/assessment
require 'faker'
class AssessmentMailerPreview < ActionMailer::Preview
  def send_instrument_to_evaluatee
    evaluatee = FactoryBot.create(:evaluatee)

    AccountMailer.with(evaluatee:).send_instrument_to_evaluatee
  end
end
