class EvaluateesController < ApplicationController
  before_action :authenticate_psychologist!
  before_action :set_evaluatee, only: [:show]

  def index
    @evaluatees = current_psychologist.evaluatees
  end

  def show; end

  private

  def set_evaluatee
    @evaluatee = current_psychologist.evaluatees.find(params[:id])
  end
end
