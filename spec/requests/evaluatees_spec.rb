require 'rails_helper'

RSpec.describe 'Evaluatees', type: :request do
  describe 'GET /index' do
    let(:psychologist) { create(:psychologist) }

    before { sign_in psychologist }
    it 'renders a successful response' do
      get evaluatees_url
      expect(response).to be_successful
    end
  end
end
