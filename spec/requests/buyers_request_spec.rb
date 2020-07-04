require 'rails_helper'

RSpec.describe 'Buyers', type: :request do
  context 'routes test' do
    it 'renders the signup form' do
      get '/buyers/signup'
      expect(response).to render_template(:new)
    end

    it 'renders new on failed signup' do
      post '/buyers', params: { buyer: { name: 'Clinton' } }

      expect(response).to render_template(:new)
    end

    it 'goes to home on successful signup' do
      post '/buyers', params: { buyer: { name: 'Clinton',
                                         email: 'clin@ton.com',
                                         address: 'worldwide',
                                         password: 'foobar',
                                         password_confirmation: 'foobar' } }

      expect(response).to redirect_to('/')
      follow_redirect!

      get '/buyers/1'
      expect(response).to render_template(:show)
      expect(response.body).to include('balance')
    end
  end
end
