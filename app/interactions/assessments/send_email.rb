module Assessments
  class SendEmail < ActiveInteraction::Base
    object :evaluatee, class: ::Evaluatee

    def execute
      AssessmentMailer.with(evaluatee:)
                      .send_instrument_to_evaluatee
                      .deliver_later
    end
  end
end
