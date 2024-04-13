require 'rails_helper'

RSpec.describe 'Instruments', type: :request do
  let(:evaluatee) { create(:evaluatee) }
  before { sign_in evaluatee.psychologist }

  describe 'GET /index' do
    it 'renders a successful response' do
      get evaluatee_instruments_path(evaluatee)
      expect(response).to have_http_status(:ok)
    end
  end
end
