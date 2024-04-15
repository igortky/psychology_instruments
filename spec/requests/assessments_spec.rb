require 'rails_helper'

RSpec.describe 'Assessments', type: :request do
  let(:evaluatee) { create(:evaluatee) }

  describe 'GET /new' do
    before { sign_in evaluatee.psychologist }
    it 'returns http success' do
      get new_evaluatee_assessment_path(evaluatee)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    before { sign_in evaluatee.psychologist }
    subject(:request) { post evaluatee_assessments_path(evaluatee), params: }
    let(:instrument) { create(:instrument) }

    context 'with valid parameters' do
      let(:params) { { assessment: { instrument_id: instrument.id } } }

      it 'creates a new assessment' do
        expect { request }.to change(Assessment, :count).by(1)
      end

      it 'redirects to the evaluatee' do
        request
        expect(response).to redirect_to(evaluatee_path(evaluatee))
      end
    end

    context 'with invalid parameters' do
      let(:params) do
        { assessment: { instrument_id: nil } }
      end

      it 'does not create a new assessment' do
        expect { request }.not_to change(Assessment, :count)
      end

      it 'renders the new template' do
        request
        expect(response).to render_template(:new)
      end
    end
  end
  describe 'POST #submit' do
    subject(:request) do
      post submit_evaluatee_assessment_path(evaluatee, assessment), params: { evaluatee: attributes }
    end
    let(:psychologist) { create(:psychologist) }
    let(:evaluatee) { create(:evaluatee, psychologist:) }
    let(:assessment) { create(:assessment, evaluatee:, psychologist:) }
    let(:attributes) do
      { name: 'New Name', cpf: '12345678912', email: 'new_email@example.com', birthdate: Date.today - 20.years }
    end

    context 'with valid parameters' do
      it 'updates the evaluatee and redirects to the questions page' do
        request
        expect(evaluatee.reload.name).to eq('New Name')
        expect(response).to redirect_to(questions_evaluatee_assessment_path(evaluatee, assessment))
      end
    end

    context 'with invalid parameters' do
      let(:attributes) { { name: '', cpf: '', email: '', birthdate: '' } }
      it 'does not update the evaluatee and re-renders the start page' do
        request
        expect(evaluatee.reload.name).not_to eq('')
        expect(response).to render_template(:start)
      end
    end
  end
end
