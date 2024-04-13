class InstrumentsController < ApplicationController
  before_action :authenticate_psychologist!
  before_action :set_evaluatee

  def index
    @instruments = @evaluatee.instruments
  end

  private

  def set_evaluatee
    @evaluatee = Evaluatee.find(params[:evaluatee_id])
  end
end
