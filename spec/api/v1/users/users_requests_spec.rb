require "rails_helper"

RSpec.describe "Users API", type: :request do
  before :each do
    @user1 = User.create(id: 1, name: "Alexis", preferred_lang: "Spanish")
    @user2 = User.create(id: 55, name: "Deniz", preferred_lang: "Turkish")
    @user3 = User.create(id: 100, name: "Megan", preferred_lang: "English")
    @user4 = User.create(id: 453, name: "Jim", preferred_lang: "Portugeuse")
  end
  it "returns all users" do
    get "/api/v1/users"

    expect(response).to be_successful 

    parsed_data = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_data).to be_a(Hash)
    expect(parsed_data).to have_key(:data)
    expect(parsed_data[:data]).to be_an(Array)
    parsed_data[:data].each do |user|
      expect(user).to have_key(:id)
      expect(user[:id]).to be_an(String)
      expect(user).to have_key(:type)
      expect(user[:type]).to be_an(String)
      expect(user[:type]).to eq("user")
      expect(user).to have_key(:attributes)
      expect(user[:attributes]).to be_an(Hash)
      expect(user[:attributes].keys).to eq([:name, :preferred_lang, :challenges])
      expect(user[:attributes][:name]).to be_a(String)
      expect(user[:attributes][:preferred_lang]).to be_a(String)
      expect(user[:attributes][:challenges]).to be_an(Array)
    end
  end
end