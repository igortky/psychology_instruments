class AssessmentMailer < ApplicationMailer
  default from: 'no-reply@editoravetor.com'
  layout 'mailer'

  def send_instrument_to_evaluatee
    @evaluatee = params[:evaluatee]
    @instrument_id = params[:instrument_id]
    @url = evaluatee_instrument_url(@evaluatee, id: @instrument_id, host: 'localhost', port: 3000)
    mail(to: @evaluatee.email, subject: 'New intrusment to answer!')
  end
end
