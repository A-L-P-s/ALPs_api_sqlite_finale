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
  end
end