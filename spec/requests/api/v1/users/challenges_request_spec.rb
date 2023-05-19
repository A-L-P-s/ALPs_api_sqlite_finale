require 'rails_helper'

RSpec.describe "Api::V1::Users::Challenges", :vcr, type: :request do
  describe "#new" do
    before(:each) do
      @turkish_user = User.create(id: 55, name: "Deniz", preferred_lang: "Turkish")
      @spanish_user = User.create(id: 1, name: "Alexis", preferred_lang: "Spanish")

      @tr_challenge1 = Challenge.create(id: 50, user_id: 55, language: "Turkish", verb: "(e/a) gitmek", eng_verb: "to go",
                                        image_url: "https://images.unsplash.com/photo-1500835556837-99ac94a94552?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80", image_alt_text: "Plane flying")
      @tr_sentence1 = Sentence.create(id: 10, challenge_id: 50, grammar_point: "gelecek zaman (-ecek)", eng_grammar_point: "future tense",
                                      user_sent: "Yarın annem beni havalimanına bırakmak için araba kullanacak.", ai_sent: "Yarın annem beni havalimanına bırakmak için araba kullanacak.")
      @tr_sentence2 = Sentence.create(id: 11, challenge_id: 50, grammar_point: "olumsuz geçmiş zaman (-me/-ma + di/-tı)", eng_grammar_point: "negative past tense",
                                      user_sent: "Dün havalimana gittik ama arkadaşım uçak gelmedi.", ai_sent: "Dün havalimanına gittik, ancak arkadaşımızın uçağı gelmedi.")

      @tr_challenge2 = Challenge.create(id: 51, user_id: 55, language: "Turkish", verb: "(i) bilmek", eng_verb: "to know",
                                        image_url: "https://images.unsplash.com/photo-1525616332682-f763cf05c55e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80", image_alt_text: "Ganesha")
      @tr_sentence3 = Sentence.create(id: 12, challenge_id: 51, grammar_point: "belirsiz geçmiş zaman (-miş)", eng_grammar_point: "evidential past tense",
                                      user_sent: "Hindistan'ı ziyaret ettiği için, bir fili binmeyi bilmiş.", ai_sent: "Hindistan'ı ziyaret ettiği için, bir fili binmeyi bilmiş.")
      @tr_sentence4 = Sentence.create(id: 13, challenge_id: 51, grammar_point: "zarf fiili (erek/arak)", eng_grammar_point: "adverbial participle",
                                      user_sent: "Filleri çok şey bilerek, hayvanat bahçesin işini alabildim.", ai_sent: "Filler hakkında çok şey bilerek, hayvanat bahçesinde işi alabildim.")

      @sp_challenge1 = Challenge.create(id: 100, user_id: 1, language: "Spanish", verb: "hablar", eng_verb: "to speak",
                                        image_url: "https://images.unsplash.com/photo-1503917988258-f87a78e3c995?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80", image_alt_text: "Paris from above")
      @sp_sentence1 = Sentence.create(id: 40, challenge_id: 100, grammar_point: "presente", eng_grammar_point: "simple present tense", user_sent: "Él habla español y francés con fluidez.",
                                      ai_sent: "Él habla español y francés con fluidez.")
      @sp_sentence2 = Sentence.create(id: 41, challenge_id: 100, grammar_point: "pretérito indefinido", eng_grammar_point: "simple past tense",
                                      user_sent: "Mi dos hijos estaban hablo francés al revisor de tren.", ai_sent: "Mis dos hijos estaban hablando francés al revisor del tren.")

      @turk_verb1 = Verb.create(language: "Turkish", verb: "(le/la) uğraşmak", eng_verb: "to deal with")
      @turk_verb2 = Verb.create(language: "Turkish", verb: "(e/a) gitmek", eng_verb: "to go")
      @turk_verb3 = Verb.create(language: "Turkish", verb: "(e/a) tavsiye etmek", eng_verb: "to recommend")
      @turk_gram1 = GrammarPoint.create(language: "Turkish", grammar_point: "şimdiki zaman (-iyor)", eng_grammar_point: "present/present continuous tense")
      @turk_gram2 = GrammarPoint.create(language: "Turkish", grammar_point: "şimdiki zaman resmi (-mekte)", eng_grammar_point: "formal present/present continuous tense")
      @turk_gram3 = GrammarPoint.create(language: "Turkish", grammar_point: "geniş zaman (-ir/-er)", eng_grammar_point: "simple present tense")

      @spanish_verb1 = Verb.create(language: "Spanish", verb: "hablar", eng_verb: "to speak")
      @spanish_verb2 = Verb.create(language: "Spanish", verb: "bailar", eng_verb: "to dance")
      @span_gram1 = GrammarPoint.create(language: "Spanish", grammar_point: "presente", eng_grammar_point: "simple present tense")
      @span_gram2 = GrammarPoint.create(language: "Spanish", grammar_point: "pretérito perfecto", eng_grammar_point: "present perfect tense")
    end

    describe "when succesful" do
      it "creates a new prompt form" do
        get "/api/v1/users/#{@turkish_user.id}/challenges/new"

        expect(response).to be_successful

        parsed_data = JSON.parse(response.body, symbolize_names: true)
        expect(parsed_data).to be_a(Hash)
        expect(parsed_data.keys).to eq([:data])
        expect(parsed_data[:data].keys).to eq([:id, :type, :attributes])
      end
    end
  end

  describe "create" do
    before(:each) do
      @turkish_user = User.create(id: 55, name: "Deniz", preferred_lang: "Turkish")

      @turk_verb1 = Verb.create(language: "Turkish", verb: "(le/la) uğraşmak", eng_verb: "to deal with")
      @turk_verb2 = Verb.create(language: "Turkish", verb: "(e/a) gitmek", eng_verb: "to go")

      @turk_gram1 = GrammarPoint.create(language: "Turkish", grammar_point: "şimdiki zaman (-iyor)", eng_grammar_point: "present/present continuous tense")
      @turk_gram2 = GrammarPoint.create(language: "Turkish", grammar_point: "şimdiki zaman resmi (-mekte)", eng_grammar_point: "formal present/present continuous tense")
      @turk_gram3 = GrammarPoint.create(language: "Turkish", grammar_point: "geniş zaman (-ir/-er)", eng_grammar_point: "simple present tense")
    end

    describe "when successful" do
      it "creates a new challenge and 2 sentences" do
        challenge_params = {
          "language": "Turkish",
          "verb": "(i) gitmek",
          "eng_verb": "to go",
          "image_url": "/random/unplash/image.url",
          "image_alt_text": "Plane flying over the Bosphorous",
          "sentences": [
            {
              "grammar_point": "şimdiki zaman (-iyor)",
              "eng_grammar_point": "present/present continuous tense",
              "user_sent": "Bu yaz Hopa'ya gidiyorum." # correct sentence
            },
            {
              "grammar_point": "geniş zaman (-ir/-er)",
              "eng_grammar_point": "simple present tense",
              "user_sent": "Her yillar biz Ankara'ya giderim." # incorrect sentence
            }
          ]
        }

        headers = { 'CONTENT_TYPE' => 'application/json' }
        post "/api/v1/users/#{@turkish_user.id}/challenges", headers:, params: JSON.generate(challenge_params)

        expect(response).to be_successful
        parsed_data = JSON.parse(response.body, symbolize_names: true)

        expect(parsed_data).to be_a Hash

        expect(parsed_data).to have_key(:data)
        expect(parsed_data[:data]).to be_a Hash

        expect(parsed_data[:data]).to have_key(:id)
        expect(parsed_data[:data][:id]).to be_a String

        expect(parsed_data[:data]).to have_key(:type)
        expect(parsed_data[:data][:type]).to be_a String

        expect(parsed_data[:data]).to_not have_key(:attributes)
      end
    end

    describe "when NOT successful" do
      it 'returns a 404 where user does not exist' do
        challenge_params = {
          "language": "Turkish",
          "verb": "(i) gitmek",
          "eng_verb": "to go",
          "image_url": "/random/unplash/image.url",
          "image_alt_text": "Plane flying over the Bosphorous",
          "sentences": [
            {
              "grammar_point": "şimdiki zaman (-iyor)",
              "eng_grammar_point": "present/present continuous tense",
              "user_sent": "Bu yaz Hopa'ya gidiyorum." # correct sentence
            },
            {
              "grammar_point": "geniş zaman (-ir/-er)",
              "eng_grammar_point": "simple present tense",
              "user_sent": "Her yillar biz Ankara'ya giderim." # incorrect sentence
            }
          ]
        }

        headers = { 'CONTENT_TYPE' => 'application/json' }
        post "/api/v1/users/76767676/challenges", headers:, params: JSON.generate(challenge_params)

        expect(response.status).to eq(404)

        parsed_data = JSON.parse(response.body, symbolize_names: true)

        expect(parsed_data).to be_a Hash
        expect(parsed_data).to have_key(:errors)

        expect(parsed_data[:errors]).to be_an Array
        expect(parsed_data[:errors].first).to be_a Hash

        expect(parsed_data[:errors].first).to have_key(:status)
        expect(parsed_data[:errors].first[:status]).to be_a Integer

        expect(parsed_data[:errors].first[:detail]).to be_a String
        expect(parsed_data[:errors].first[:detail]).to eq("Couldn't find User with 'id'=76767676")
      end
    end
  end

  describe "#show" do
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

      @sentence1 = @challenge1.sentences.create(id: 42, challenge_id: 101, grammar_point: @point1.grammar_point, eng_grammar_point: @point1.eng_grammar_point,
                                                user_sent: "Me gusta comer sushi de vez en cuando.", ai_sent: "Me gusta comer sushi de vez en cuando.")
      @sentence2 = @challenge2.sentences.create(id: 43, challenge_id: 101, grammar_point: @point2.grammar_point, eng_grammar_point: @point2.eng_grammar_point,
                                                user_sent: "Mis hijos no comer platos de fideos.", ai_sent: "Mis hijos no comerán platos de fideos.")
    end

    describe "when successful" do
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
    end

    describe "when NOT sccuessful" do
      it 'returns 404 if challenge does not exist' do
        get "/api/v1/users/234523/challenges/23452345456"

        expect(response.status).to eq(404)

        parsed_data = JSON.parse(response.body, symbolize_names: true)

        expect(parsed_data).to be_a Hash
        expect(parsed_data).to have_key(:errors)

        expect(parsed_data[:errors]).to be_an Array
        expect(parsed_data[:errors].first).to be_a Hash

        expect(parsed_data[:errors].first).to have_key(:status)
        expect(parsed_data[:errors].first[:status]).to be_a Integer

        expect(parsed_data[:errors].first[:detail]).to be_a String
        expect(parsed_data[:errors].first[:detail]).to eq("Couldn't find Challenge with 'id'=23452345456")
      end
    end
  end

  describe "#destroy" do
    before(:each) do
      @turkish_user = User.create(id: 55, name: "Deniz", preferred_lang: "Turkish")
      @spanish_user = User.create(id: 1, name: "Alexis", preferred_lang: "Spanish")

      @tr_challenge1 = Challenge.create(id: 50, user_id: 55, language: "Turkish", verb: "(e/a) gitmek", eng_verb: "to go",
                                        image_url: "https://images.unsplash.com/photo-1500835556837-99ac94a94552?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80", image_alt_text: "Plane flying")
      @tr_sentence1 = Sentence.create(id: 10, challenge_id: 50, grammar_point: "gelecek zaman (-ecek)", eng_grammar_point: "future tense",
                                      user_sent: "Yarın annem beni havalimanına bırakmak için araba kullanacak.", ai_sent: "Yarın annem beni havalimanına bırakmak için araba kullanacak.")
      @tr_sentence2 = Sentence.create(id: 11, challenge_id: 50, grammar_point: "olumsuz geçmiş zaman (-me/-ma + di/-tı)", eng_grammar_point: "negative past tense",
                                      user_sent: "Dün havalimana gittik ama arkadaşım uçak gelmedi.", ai_sent: "Dün havalimanına gittik, ancak arkadaşımızın uçağı gelmedi.")

      @tr_challenge2 = Challenge.create(id: 51, user_id: 55, language: "Turkish", verb: "(i) bilmek", eng_verb: "to know",
                                        image_url: "https://images.unsplash.com/photo-1525616332682-f763cf05c55e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80", image_alt_text: "Ganesha")
      @tr_sentence3 = Sentence.create(id: 12, challenge_id: 51, grammar_point: "belirsiz geçmiş zaman (-miş)", eng_grammar_point: "evidential past tense",
                                      user_sent: "Hindistan'ı ziyaret ettiği için, bir fili binmeyi bilmiş.", ai_sent: "Hindistan'ı ziyaret ettiği için, bir fili binmeyi bilmiş.")
      @tr_sentence4 = Sentence.create(id: 13, challenge_id: 51, grammar_point: "zarf fiili (erek/arak)", eng_grammar_point: "adverbial participle",
                                      user_sent: "Filleri çok şey bilerek, hayvanat bahçesin işini alabildim.", ai_sent: "Filler hakkında çok şey bilerek, hayvanat bahçesinde işi alabildim.")

      @sp_challenge1 = Challenge.create(id: 100, user_id: 1, language: "Spanish", verb: "hablar", eng_verb: "to speak",
                                        image_url: "https://images.unsplash.com/photo-1503917988258-f87a78e3c995?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80", image_alt_text: "Paris from above")
      @sp_sentence1 = Sentence.create(id: 40, challenge_id: 100, grammar_point: "presente", eng_grammar_point: "simple present tense", user_sent: "Él habla español y francés con fluidez.",
                                      ai_sent: "Él habla español y francés con fluidez.")
      @sp_sentence2 = Sentence.create(id: 41, challenge_id: 100, grammar_point: "pretérito indefinido", eng_grammar_point: "simple past tense",
                                      user_sent: "Mi dos hijos estaban hablo francés al revisor de tren.", ai_sent: "Mis dos hijos estaban hablando francés al revisor del tren.")

      @turk_verb1 = Verb.create(language: "Turkish", verb: "(le/la) uğraşmak", eng_verb: "to deal with")
      @turk_verb2 = Verb.create(language: "Turkish", verb: "(e/a) gitmek", eng_verb: "to go")
      @turk_verb3 = Verb.create(language: "Turkish", verb: "(e/a) tavsiye etmek", eng_verb: "to recommend")
      @turk_gram1 = GrammarPoint.create(language: "Turkish", grammar_point: "şimdiki zaman (-iyor)", eng_grammar_point: "present/present continuous tense")
      @turk_gram2 = GrammarPoint.create(language: "Turkish", grammar_point: "şimdiki zaman resmi (-mekte)", eng_grammar_point: "formal present/present continuous tense")
      @turk_gram3 = GrammarPoint.create(language: "Turkish", grammar_point: "geniş zaman (-ir/-er)", eng_grammar_point: "simple present tense")

      @spanish_verb1 = Verb.create(language: "Spanish", verb: "hablar", eng_verb: "to speak")
      @spanish_verb2 = Verb.create(language: "Spanish", verb: "bailar", eng_verb: "to dance")
      @span_gram1 = GrammarPoint.create(language: "Spanish", grammar_point: "presente", eng_grammar_point: "simple present tense")
      @span_gram2 = GrammarPoint.create(language: "Spanish", grammar_point: "pretérito perfecto", eng_grammar_point: "present perfect tense")
    end

    describe "when succesful" do
      it "can delete a challenge and associated sentences" do
        expect(@turkish_user.challenges.count).to eq(2)
        expect(@spanish_user.challenges.count).to eq(1)
        expect(Sentence.all.count).to eq(6)

        delete "/api/v1/users/#{@turkish_user.id}/challenges/#{@tr_challenge1.id}"

        expect(response).to be_successful
        expect(response).to have_http_status(204)
        expect(@turkish_user.challenges.count).to eq(1)
        expect(@spanish_user.challenges.count).to eq(1)
        expect(Sentence.all.count).to eq(4)
      end
    end

    describe "when NOT succesful" do
      it "cannot delete a challenge or associated sentences" do
        expect(@turkish_user.challenges.count).to eq(2)
        expect(@spanish_user.challenges.count).to eq(1)

        delete "/api/v1/users/#{@turkish_user.id}/challenges/100"

        parsed_data = JSON.parse(response.body, symbolize_names: true)
        expect(response).to have_http_status(404)
        expect(parsed_data).to be_a(Hash)
        expect(parsed_data.keys).to eq([:errors])
        expect(parsed_data[:errors]).to be_a(Array)
        expect(parsed_data[:errors][0].keys).to eq(%i[status title detail])
        expect(parsed_data[:errors][0][:detail]).to eq("Challenge cannot be deleted")
      end
    end
  end
end
