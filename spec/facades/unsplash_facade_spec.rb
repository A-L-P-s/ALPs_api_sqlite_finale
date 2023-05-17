require 'rails_helper'

RSpec.describe UnsplashFacade, :vcr do
  describe "instance methods" do
    before do
      @deniz = User.create(id: 55, name: "Deniz", preferred_lang: "Turkish")

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
     
      @unsplash_facade = UnsplashFacade.new(user_id: @deniz.id)
    end

    it 'exists' do
      expect(@unsplash_facade).to be_an(UnsplashFacade)
    end

    it 'returns a random image and text' do
      expect(@unsplash_facade.random_image_and_text).to be_a(Hash)
      expect(@unsplash_facade.random_image_and_text.keys).to eq([:url, :alt_description])
    end

    it 'returns a array of hash of foreign and english grammar points' do
      expected = [
        {
          grammar_point: "şimdiki zaman (-iyor)",
          eng_grammar_point: "present/present continuous tense"
        },
        {
          grammar_point: "şimdiki zaman resmi (-mekte)",
          eng_grammar_point: "formal present/present continuous tense"
        }
      ]
      expect(@unsplash_facade.grammar_points_hash([@turk_gram1, @turk_gram2])).to eq(expected)
    end

    it 'returns a prompt info' do
      expect(@unsplash_facade.prompt_data).to be_a(Prompt)
      expect(@unsplash_facade.prompt_data.id).to eq(nil)
      expect(@unsplash_facade.prompt_data.grammar_points).to be_an(Array)
    end
  end
end