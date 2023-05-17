require 'rails_helper'

RSpec.describe GrammarPoint, type: :model do
  describe 'self' do
    it 'exists' do
      grammar_point1 = GrammarPoint.create(language: "Spanish", grammar_point: "presente", eng_grammar_point: "simple present tense")

      expect(grammar_point1).to be_a GrammarPoint
      expect(grammar_point1.language).to eq("Spanish")
      expect(grammar_point1.grammar_point).to eq("presente")
      expect(grammar_point1.eng_grammar_point).to eq("simple present tense")
    end

    it 'returns grammar_points' do
      @turk_gram1 = GrammarPoint.create(language: "Turkish", grammar_point: "şimdiki zaman (-iyor)", eng_grammar_point: "present/present continuous tense")
      @turk_gram2 = GrammarPoint.create(language: "Turkish", grammar_point: "şimdiki zaman resmi (-mekte)", eng_grammar_point: "formal present/present continuous tense")
      @turk_gram3 = GrammarPoint.create(language: "Turkish", grammar_point: "geniş zaman (-ir/-er)", eng_grammar_point: "simple present tense")

      @span_gram1 = GrammarPoint.create(language: "Spanish", grammar_point: "presente", eng_grammar_point: "simple present tense")
      @span_gram2 = GrammarPoint.create(language: "Spanish", grammar_point: "pretérito perfecto", eng_grammar_point: "present perfect tense")

      expect(GrammarPoint.grammar_points_by("Turkish")).to eq([@turk_gram1, @turk_gram2, @turk_gram3])
    end

  end
end
