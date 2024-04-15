class AssessmentMailer < ApplicationMailer
  default from: 'no-reply@editoravetor.com'
  layout 'mailer'

  def send_instrument_to_evaluatee
    @evaluatee = params[:evaluatee]
    @assessment_id = params[:assessment_id]
    @url = start_evaluatee_assessment_url(evaluatee_id: @evaluatee.id, id: @assessment_id, host: 'localhost', port: 3000)
    mail(to: @evaluatee.email, subject: 'New intrusment to answer!')
  end
end
