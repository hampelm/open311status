require 'rails_helper'

RSpec.describe Cities::RequestsController, type: :controller do
  let(:service_request) { FactoryBot.create :service_request }

  describe '#show' do
    it 'assigns the service_request' do
      get :show, params: { city_slug: service_request.city.slug, service_request_id: service_request.service_request_id, slug: service_request.slug }
      expect(assigns(:service_request)).to eq service_request
      expect(response).to have_http_status(:ok)
    end

    it 'redirects to the canonical url' do
      get :show, params: { city_slug: service_request.city.slug, service_request_id: service_request.service_request_id, slug: 'not-the-slug' }
      expect(response).to have_http_status(:moved_permanently)
    end
  end
end
