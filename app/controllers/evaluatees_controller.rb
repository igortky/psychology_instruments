class EvaluateesController < ApplicationController
  before_action :authenticate_psychologist!
  before_action :evaluatee, only: [:show]

  def index
    @evaluatees = current_psychologist.evaluatees
  end

  def show; end

  def new
    Evaluatee.new
  end

  def create
    Evaluatee.create!(permitted_params)
  end

  private

  def permitted_params
    params.require(:evaluatee).permit(
      :first_name, :last_name, :email, :cpf, :birthdate
    ).merge(psychologist: current_psychologist)
  end

  def evaluatee
    @evaluatee = current_psychologist.evaluatees.find(params[:id])
  end
end
