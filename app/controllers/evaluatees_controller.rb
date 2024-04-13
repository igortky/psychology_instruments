class EvaluateesController < ApplicationController
  before_action :authenticate_psychologist!
  before_action :evaluatee, only: [:show]

  def index
    @evaluatees = current_psychologist.evaluatees
  end

  def show; end

  def new
    @evaluatee = Evaluatee.new
  end

  def create
    @evaluatee = Evaluatee.create(permitted_params)
    if @evaluatee.persisted?
      redirect_to action: :index
    else
      render :new
    end
  end

  private

  def permitted_params
    params.require(:evaluatee).permit(
      :name, :email, :cpf, :birthdate
    ).merge(psychologist: current_psychologist)
  end

  def evaluatee
    @evaluatee = current_psychologist.evaluatees.find(params[:id])
  end
end
