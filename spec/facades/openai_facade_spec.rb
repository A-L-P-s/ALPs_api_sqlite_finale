require "rails_helper"

RSpec.describe OpenaiFacade, :vcr do
  describe "class methods" do
    before(:each) do
      @turkish_user = User.create(id: 55, name: "Deniz", preferred_lang: "Turkish")

      @tr_challenge1 = Challenge.create(id: 50, user_id: 55, language: "Turkish", verb: "(e/a) gitmek", eng_verb: "to go", image_url: "https://images.unsplash.com/photo-1500835556837-99ac94a94552?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80", image_alt_text: "Plane flying")
      @tr_sentence1 = Sentence.create(id: 10, challenge_id: 50, grammar_point: "gelecek zaman (-ecek)", eng_grammar_point: "future tense", user_sent: "Yarın annem beni havalimanına bırakmak için araba kullanacak.", ai_sent: "Yarın annem beni havalimanına bırakmak için araba kullanacak.")
      @tr_sentence2 = Sentence.create(id: 11, challenge_id: 50, grammar_point: "olumsuz geçmiş zaman (-me/-ma + di/-tı)", eng_grammar_point: "negative past tense", user_sent: "Dün havalimana gittik ama arkadaşım uçak gelmedi.", ai_sent: "Dün havalimanına gittik, ancak arkadaşımızın uçağı gelmedi.")
    end

    it "can :srub_response" do
      scrubbed_ai_data = OpenaiFacade.scrub_response(@tr_challenge1)
      expect(scrubbed_ai_data).to be_a(Hash)
      expect(scrubbed_ai_data.keys).to eq([:correction1, :explanation1, :correction2, :explanation2])
    end

    xit "can :check_challenge_with_ai" do
    end

    xit "can :update_sentences" do
    end
  end
end