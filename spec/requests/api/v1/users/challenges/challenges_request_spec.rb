require 'rails_helper'

RSpec.describe "Api::V1::Challenges::Challenges", type: :request do
  before(:each) do
    @user1 = User.create(id: 1, name: "Alexis", preferred_lang: "Spanish")
    @user2 = User.create(id: 55, name: "Deniz", preferred_lang: "Turkish")
    @user3 = User.create(id: 100, name: "Megan", preferred_lang: "English")

    @verb1 = Verb.create(language: "Spanish", verb: "hablar", eng_verb: "to speak")
    @verb2 = Verb.create(language: "Spanish", verb: "bailar", eng_verb: "to dance")

    @point1 = GrammarPoint.create(language: "Spanish", grammar_point: "presente", eng_grammar_point: "simple present tense")
    @point2 = GrammarPoint.create(language: "Spanish", grammar_point: "pretérito perfecto", eng_grammar_point: "present perfect tense")

    @challenge1 = @user1.challenges.create(id: 101, user_id: 1, language: "Spanish", verb: @verb1.verb, eng_verb: @verb1.eng_verb, image_url: "image", image_alt_text: "alt_text")
    @challenge2 = @user2.challenges.create(id: 102, user_id: 55, language: "Spanish", verb: @verb2.verb, eng_verb: @verb2.eng_verb, image_url: "image", image_alt_text: "alt_text")

    @sentence1 = @challenge1.sentences.create(id: 42, challenge_id: 101, grammar_point: @point1.grammar_point, eng_grammar_point: @point1.eng_grammar_point, user_sent: "Me gusta comer sushi de vez en cuando.", ai_sent: "Me gusta comer sushi de vez en cuando.")
    @sentence2 = @challenge2.sentences.create(id: 43, challenge_id: 101, grammar_point: @point2.grammar_point, eng_grammar_point: @point2.eng_grammar_point, user_sent: "Mis hijos no comer platos de fideos.", ai_sent: "Mis hijos no comerán platos de fideos.")
  end

  it 'returns one challenge' do
    get "/api/v1/users/#{@user1.id}/challenges/#{@challenge1.id}"

    expect(response).to be_successful

    parsed_data = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_data).to be_a Hash

    expect(parsed_data).to have_key(:data)
    expect(parsed_data[:data]).to be_a Hash

    expect(parsed_data[:data]).to have_key(:id)
    expect(parsed_data[:data][:id]).to be_a String

    expect(parsed_data[:data]).to have_key(:type)
    expect(parsed_data[:data][:type]).to be_a String

    expect(parsed_data[:data]).to have_key(:attributes)
    expect(parsed_data[:data][:attributes]).to be_a Hash

    expect(parsed_data[:data][:attributes]).to have_key(:id)
    expect(parsed_data[:data][:attributes][:id]).to be_an Integer

    expect(parsed_data[:data][:attributes]).to have_key(:user_id)
    expect(parsed_data[:data][:attributes][:user_id]).to be_an Integer

    expect(parsed_data[:data][:attributes]).to have_key(:language)
    expect(parsed_data[:data][:attributes][:language]).to be_a String

    expect(parsed_data[:data][:attributes]).to have_key(:verb)
    expect(parsed_data[:data][:attributes][:verb]).to be_a String

    expect(parsed_data[:data][:attributes]).to have_key(:eng_verb)
    expect(parsed_data[:data][:attributes][:eng_verb]).to be_a String

    expect(parsed_data[:data][:attributes]).to have_key(:image_url)
    expect(parsed_data[:data][:attributes][:image_url]).to be_a String

    expect(parsed_data[:data][:attributes]).to have_key(:image_alt_text)
    expect(parsed_data[:data][:attributes][:image_alt_text]).to be_a String
  end

  it 'returns any challenge by id' do
    get "/api/v1/users/#{@user2.id}/challenges/#{@challenge2.id}"

    expect(response).to be_successful

    parsed_data = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_data).to be_a Hash
  end

  it 'returns 404 if challenge does not exist' do
    get "/api/v1/users/234523/challenges/23452345456"

    expect(response.status).to eq(404)
  end
end