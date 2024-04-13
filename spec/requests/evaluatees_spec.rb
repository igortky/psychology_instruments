require 'rails_helper'

RSpec.describe 'Evaluatees', type: :request do
  let(:psychologist) { create(:psychologist) }
  before { sign_in psychologist }

  describe 'GET /index' do
    it 'renders a successful response' do
      get evaluatees_url
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /evaluatees/new' do
    it 'renders a successful response' do
      get new_evaluatee_url
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /evaluatees' do
    subject(:request) { post evaluatees_url, params: }
    context 'with valid parameters' do
      let(:params) do
        { evaluatee: {
          name: 'Test', email: 'test@email.com', cpf: '123456789', birthdate: '1990-01-01'
        } }
      end
      it 'creates a new Evaluatee' do
        expect { request }.to change(Evaluatee, :count).by(1)
      end

      it 'redirects to the created evaluatee' do
        request
        expect(response).to redirect_to(evaluatees_url)
      end
    end

    context 'with invalid parameters' do
      let(:params) do
        { evaluatee: {
          name: 'Test', email: nil, cpf: '123456789', birthdate: '1990-01-01'
        } }
      end
      it 'does not create a new Evaluatee' do
        expect { request }.to change(Evaluatee, :count).by(0)
      end
    end
  end
end
