require 'rails_helper'

RSpec.describe 'Users/ChallengesController' do
  describe "#destroy" do
    before(:each) do
      @turkish_user = User.create(id: 55, name: "Deniz", preferred_lang: "Turkish")
      @spanish_user = User.create(id: 1, name: "Alexis", preferred_lang: "Spanish")

      @tr_challenge1 = Challenge.create(id: 50, user_id: 55, language: "Turkish", verb: "(e/a) gitmek", eng_verb: "to go", image_url: "https://images.unsplash.com/photo-1500835556837-99ac94a94552?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80", image_alt_text: "Plane flying")
      @tr_sentence1 = Sentence.create(id: 10, challenge_id: 50, grammar_point: "gelecek zaman (-ecek)", eng_grammar_point: "future tense", user_sent: "Yarın annem beni havalimanına bırakmak için araba kullanacak.", ai_sent: "Yarın annem beni havalimanına bırakmak için araba kullanacak.")
      @tr_sentence2 = Sentence.create(id: 11, challenge_id: 50, grammar_point: "olumsuz geçmiş zaman (-me/-ma + di/-tı)", eng_grammar_point: "negative past tense", user_sent: "Dün havalimana gittik ama arkadaşım uçak gelmedi.", ai_sent: "Dün havalimanına gittik, ancak arkadaşımızın uçağı gelmedi.")

      @tr_challenge2 = Challenge.create(id: 51, user_id: 55, language: "Turkish", verb: "(i) bilmek", eng_verb: "to know", image_url: "https://images.unsplash.com/photo-1525616332682-f763cf05c55e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80", image_alt_text: "Ganesha")
      @tr_sentence3 = Sentence.create(id: 12, challenge_id: 51, grammar_point: "belirsiz geçmiş zaman (-miş)", eng_grammar_point: "evidential past tense", user_sent: "Hindistan'ı ziyaret ettiği için, bir fili binmeyi bilmiş.", ai_sent: "Hindistan'ı ziyaret ettiği için, bir fili binmeyi bilmiş.")
      @tr_sentence4 = Sentence.create(id: 13, challenge_id: 51, grammar_point: "zarf fiili (erek/arak)", eng_grammar_point: "adverbial participle", user_sent: "Filleri çok şey bilerek, hayvanat bahçesin işini alabildim.", ai_sent: "Filler hakkında çok şey bilerek, hayvanat bahçesinde işi alabildim.")

      @sp_challenge1 = Challenge.create(id: 100, user_id: 1, language: "Spanish", verb: "hablar", eng_verb: "to speak", image_url: "https://images.unsplash.com/photo-1503917988258-f87a78e3c995?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80", image_alt_text: "Paris from above")
      @sp_sentence1 = Sentence.create(id: 40, challenge_id: 100, grammar_point: "presente", eng_grammar_point: "simple present tense", user_sent: "Él habla español y francés con fluidez.", ai_sent: "Él habla español y francés con fluidez.")
      @sp_sentence2 = Sentence.create(id: 41, challenge_id: 100, grammar_point: "pretérito indefinido", eng_grammar_point: "simple past tense", user_sent: "Mi dos hijos estaban hablo francés al revisor de tren.", ai_sent: "Mis dos hijos estaban hablando francés al revisor del tren.")
    end

    describe "when succesful" do
      it "can delete a challenge and associated sentences" do
        expect(@turkish_user.challenges.count).to eq(2)
        expect(@spanish_user.challenges.count).to eq(1)

        delete "/api/v1/users/#{@turkish_user.id}/challenges/#{@tr_challenge1.id}"

        expect(response).to be_successful
        expect(response).to have_http_status(204)
        expect(@turkish_user.challenges.count).to eq(1)
        expect(@spanish_user.challenges.count).to eq(1)
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
        expect(parsed_data.keys).to eq([:error])
        expect(parsed_data[:error]).to be_an(Hash)
        expect(parsed_data[:error].keys).to eq(%i[status title detail])
        expect(parsed_data[:error][:detail]).to eq("Challenge cannot be deleted")
      end
    end
  end
end