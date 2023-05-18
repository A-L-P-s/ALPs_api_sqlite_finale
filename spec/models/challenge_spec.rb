require 'rails_helper'

RSpec.describe Challenge, type: :model do
  describe "relationships" do
    it { should belong_to :user }
    it { should have_many :sentences }
  end

  describe "instance methods" do
    before(:each) do
      @turkish_user = User.create(id: 55, name: "Deniz", preferred_lang: "Turkish")
      @tr_challenge1 = Challenge.create(id: 50, user_id: 55, language: "Turkish", verb: "(e/a) gitmek", eng_verb: "to go", image_url: "https://images.unsplash.com/photo-1500835556837-99ac94a94552?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80", image_alt_text: "Plane flying")
    end

    it "#create_sentences" do
      sentence_params = [{"grammar_point"=>"şimdiki zaman (-iyor)", "eng_grammar_point"=>"present/present continuous tense", "user_sent"=>"Bu yaz Hopa'ya gidiyorum."},
      {"grammar_point"=>"geniş zaman (-ir/-er)", "eng_grammar_point"=>"simple present tense", "user_sent"=>"Her yillar biz Ankara'ya giderim."}]
      
      expect(@tr_challenge1.sentences.size).to eq(0)

      @tr_challenge1.create_sentences(sentence_params)

      expect(@tr_challenge1.sentences.size).to eq(2)

      expect(@tr_challenge1.sentences[0].grammar_point).to eq("şimdiki zaman (-iyor)")
      expect(@tr_challenge1.sentences[0].eng_grammar_point).to eq("present/present continuous tense")
      expect(@tr_challenge1.sentences[0].user_sent).to eq("Bu yaz Hopa'ya gidiyorum.")
    end
  end
end
