class AssessmentsController < ApplicationController
  before_action :authenticate_psychologist!
  before_action :set_evaluatee

  def new
    @assessment = @evaluatee.assessments.build
    @instruments = Instrument.all
  end

  def create
    @assessment = @evaluatee.assessments.build(assessment_params)

    if @assessment.save
      redirect_to evaluatee_path(@evaluatee)
      Assessments::SendEmail.run(evaluatee: @evaluatee, instrument_id: @assessment.instrument.id)
    else
      @instruments = Instrument.all
      render :new
    end
  end

  private

  def set_evaluatee
    @evaluatee = Evaluatee.find(params[:evaluatee_id])
  end

  def assessment_params
    params.require(:assessment).permit(:instrument_id)
          .merge(
            evaluatee_id: @evaluatee.id,
            psychologist_id: current_psychologist.id
          )
  end
end
