require "rails_helper"

RSpec.describe OpenaiService, :vcr do
  before :each do 
    @user = User.create(id: 55, name: "Deniz", preferred_lang: "Turkish")
    @challenge = Challenge.create(id: 51, user_id: 55, language: "Turkish", verb: "(i) bilmek", eng_verb: "to know",
                image_url: "https://images.unsplash.com/photo-1525616332682-f763cf05c55e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80", image_alt_text: "Ganesha")
    @sentence1 = @challenge.sentences.create(id: 12, challenge_id: 51, grammar_point: "belirsiz geçmiş zaman (-miş)", eng_grammar_point: "evidential past tense",
                user_sent: "Hindistan'ı ziyaret ettiği için, bir fili binmeyi bilmiş.")
    @sentence2 = @challenge.sentences.create(id: 13, challenge_id: 51, grammar_point: "zarf fiili (erek/arak)", eng_grammar_point: "adverbial participle",
                user_sent: "Filleri çok şey bilerek, hayvanat bahçesin işini alabildim.")
  end

  describe "class methods" do
    it "can #get_response from the OpenAI API" do
      response = OpenaiService.get_response(@challenge)

      expect(response).to be_a(String)
    end
  end
end