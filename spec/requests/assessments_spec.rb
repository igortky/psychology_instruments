require 'rails_helper'

RSpec.describe "Assessments", type: :request do
  let(:evaluatee) { create(:evaluatee) }
  before { sign_in evaluatee.psychologist }
  describe "GET /index" do
    pending "add some examples (or delete) #{__FILE__}"
  end
  describe "GET /new" do
    it "returns http success" do
      get new_evaluatee_assessment_path(evaluatee)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
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
end
