module Assessments
  class SendEmail < ActiveInteraction::Base
    include Rails.application.routes.url_helpers

    object :evaluatee, class: ::Evaluatee
    integer :assessment_id

    def execute
      AssessmentMailer.with(evaluatee:, assessment_id:)
                      .send_instrument_to_evaluatee
                      .deliver_later
    end
  end
end
