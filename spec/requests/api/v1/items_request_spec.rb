require 'rails_helper'

describe 'items endpoints' do
  context 'GET /items' do
    it 'returns a list of all items' do
      create_list(:item, 3)

      get '/api/v1/items'

      items = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(items.count).to eq(3)
    end

    it 'returns a single item' do
      item = create(:item, name: 'Turkey')

      get "/api/v1/items/#{item.id}"

      item_returned = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(item_returned['name']).to eq('Turkey')
    end
  end

  context 'POST /items' do
    it 'creates a new item' do
      expect{
        post '/api/v1/items',
          params: {name: 'Turducken', price: 111111}
      }.to change{Item.count}.by(1)

      expect(response.status).to eq(201) 
    end
  end
end
