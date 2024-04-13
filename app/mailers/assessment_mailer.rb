class AssessmentMailer < ApplicationMailer
  default from: 'no-reply@editoravetor.com'
  layout 'mailer'

  def send_instrument_to_evaluatee
    @evaluatee = params[:evaluatee]
    mail(to: @evaluatee.email, subject: 'New intrusment to answer!')
  end
end
