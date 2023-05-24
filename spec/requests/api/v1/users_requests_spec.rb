require "rails_helper"

RSpec.describe "Users API", type: :request do
  describe "#index" do
    before :each do
      @user1 = User.create(id: 1, name: "Alexis", preferred_lang: "Spanish")
      @user2 = User.create(id: 55, name: "Deniz", preferred_lang: "Turkish")
      @user3 = User.create(id: 100, name: "Megan", preferred_lang: "English")
      @user4 = User.create(id: 453, name: "Jim", preferred_lang: "Portugeuse")
      @challenge_1 = Challenge.create(id: 100, user_id: 1, language: "Spanish", verb: "hablar", eng_verb: "to speak",
                                      image_url: "https://images.unsplash.com/photo-1503917988258-f87a78e3c995?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80", image_alt_text: "Paris from above")
      @challenge_2 = Challenge.create(id: 101, user_id: 1, language: "Spanish", verb: "comer", eng_verb: "to eat",
                                      image_url: "https://images.unsplash.com/photo-1602273660127-a0000560a4c1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=736&q=80", image_alt_text: "Noodles, Chicken, and Momos")
      @challenge_3 = Challenge.create(id: 102, user_id: 1, language: "Spanish", verb: "necesitar", eng_verb: "to need",
                                      image_url: "https://images.unsplash.com/photo-1682253572700-4173885b68f2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80", image_alt_text: "playing guitar")
    end

    context "when successful" do
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
          expect(user[:attributes].keys).to eq([:name, :preferred_lang])
          expect(user[:attributes][:name]).to be_a(String)
          expect(user[:attributes][:preferred_lang]).to be_a(String)
        end
      end
    end
  end

  describe "#show" do
    before :each do
      @user1 = User.create(id: 1, name: "Alexis", preferred_lang: "Spanish")
      @user2 = User.create(id: 55, name: "Deniz", preferred_lang: "Turkish")
      @user3 = User.create(id: 100, name: "Megan", preferred_lang: "English")
      @user4 = User.create(id: 453, name: "Jim", preferred_lang: "Portugeuse")
      @challenge_1 = Challenge.create(id: 100, user_id: 1, language: "Spanish", verb: "hablar", eng_verb: "to speak",
                                      image_url: "https://images.unsplash.com/photo-1503917988258-f87a78e3c995?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80", image_alt_text: "Paris from above")
      @challenge_2 = Challenge.create(id: 101, user_id: 1, language: "Spanish", verb: "comer", eng_verb: "to eat",
                                      image_url: "https://images.unsplash.com/photo-1602273660127-a0000560a4c1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=736&q=80", image_alt_text: "Noodles, Chicken, and Momos")
      @challenge_3 = Challenge.create(id: 102, user_id: 1, language: "Spanish", verb: "necesitar", eng_verb: "to need",
                                      image_url: "https://images.unsplash.com/photo-1682253572700-4173885b68f2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80", image_alt_text: "playing guitar")
    end

    context "when successful" do
      it "returns a single user" do
        get "/api/v1/users/1"

        expect(response).to be_successful

        parsed_data = JSON.parse(response.body, symbolize_names: true)

        expect(parsed_data).to be_a(Hash)
        expect(parsed_data).to have_key(:data)
        expect(parsed_data[:data]).to be_a(Hash)
        expect(parsed_data[:data].keys).to eq([:id,
                                               :type,
                                               :attributes])
        expect(parsed_data[:data][:id]).to eq(@user1.id.to_s)
        expect(parsed_data[:data][:id]).to be_a(String)
        expect(parsed_data[:data][:type]).to be_a(String)
        expect(parsed_data[:data][:attributes]).to be_a(Hash)
        expect(parsed_data[:data][:attributes].keys).to eq([:name,
                                                            :preferred_lang,
                                                            :challenges])
        expect(parsed_data[:data][:attributes][:name]).to eq(@user1.name)
        expect(parsed_data[:data][:attributes][:name]).to be_a(String)
        expect(parsed_data[:data][:attributes][:preferred_lang]).to eq(@user1.preferred_lang)
        expect(parsed_data[:data][:attributes][:preferred_lang]).to be_a(String)
        expect(parsed_data[:data][:attributes][:challenges]).to be_an(Array)
        expect(parsed_data[:data][:attributes][:challenges].length).to eq(3)

        challenge = parsed_data[:data][:attributes][:challenges][0]
        expect(challenge).to be_a(Hash)
        expect(challenge.keys).to eq([:challenge_id,
                                      :language,
                                      :verb,
                                      :eng_verb,
                                      :image_url,
                                      :image_alt_text,
                                      :created_at])
        expect(challenge[:challenge_id]).to be_an(String)
        expect(challenge[:language]).to eq(@challenge_1.language)
        expect(challenge[:language]).to be_a(String)
        expect(challenge[:verb]).to eq(@challenge_1.verb)
        expect(challenge[:verb]).to be_a(String)
        expect(challenge[:eng_verb]).to eq(@challenge_1.eng_verb)
        expect(challenge[:eng_verb]).to be_a(String)
        expect(challenge[:image_url]).to eq(@challenge_1.image_url)
        expect(challenge[:image_url]).to be_a(String)
        expect(challenge[:image_alt_text]).to eq(@challenge_1.image_alt_text)
        expect(challenge[:image_alt_text]).to be_a(String)
        expect(challenge[:created_at]).to be_a(String)
      end
    end

    context "when NOT successful" do
      it "returns a 404 status with an error response if user is not found" do
        get "/api/v1/users/1000"
        expect(response).to_not be_successful
        expect(response.status).to eq(404)

        parsed_error_data = JSON.parse(response.body, symbolize_names: true)
        expect(parsed_error_data).to be_a(Hash)
        expect(parsed_error_data).to have_key(:errors)
        expect(parsed_error_data[:errors]).to be_a(Array)
        expect(parsed_error_data[:errors][0].keys).to eq([:status,
                                                          :title,
                                                          :detail])
        expect(parsed_error_data[:errors][0][:status]).to be_a(String)
        expect(parsed_error_data[:errors][0][:status]).to eq("404")
        expect(parsed_error_data[:errors][0][:title]).to be_a(String)
        expect(parsed_error_data[:errors][0][:title]).to eq("ActiveRecord::RecordNotFound")
        expect(parsed_error_data[:errors][0][:detail]).to be_a(String)
        expect(parsed_error_data[:errors][0][:detail]).to eq("Couldn't find User with 'id'=1000")
      end
    end
  end
end
