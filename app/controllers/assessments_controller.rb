class AssessmentsController < ApplicationController
  before_action :authenticate_psychologist!, except: %i[start submit questions submit_answers complete]
  before_action :set_evaluatee
  before_action :set_assessment, only: %i[start submit questions submit_answers complete show]

  def new
    @assessment = @evaluatee.assessments.build
    @instruments = Instrument.all
  end

  def create
    @assessment = @evaluatee.assessments.build(assessment_params)

    if @assessment.save
      redirect_to evaluatee_path(@evaluatee)
      Assessments::SendEmail.run(evaluatee: @evaluatee, assessment_id: @assessment.id)
    else
      @instruments = Instrument.all
      render :new
    end
  end

  def start; end

  def submit
    if @evaluatee.update(evaluatee_params)
      redirect_to questions_evaluatee_assessment_path(@evaluatee, @assessment)
    else
      render :start
    end
  end

  def questions
    @questions = @assessment.questions
  end

  def submit_answers
    @assessment.update(responses: params[:choice_ids], status: :finalized)
    if @assessment.save
      redirect_to complete_evaluatee_assessment_path(@evaluatee, @assessment)
    else
      @questions = @assessment.questions
      render :questions
    end
  end

  private

  def set_assessment
    @assessment = Assessment.find(params[:id])
  end

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

  def evaluatee_params
    params.require(:evaluatee).permit(:name, :cpf, :email, :birthdate)
  end
end
