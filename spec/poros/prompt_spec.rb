require 'rails_helper'

RSpec.describe Prompt, type: :poro do
  describe '#initialize' do
    before :each do
      info = {
        eng_verb: "to deal with",
        grammar_points: [{ grammar_point: "geniş zaman (-ir/-er)",
                           eng_grammar_point: "simple present tense" }, { grammar_point: "şimdiki zaman (-iyor)", eng_grammar_point: "present/present continuous tense" }],
        id: nil,
        image_alt_text: "a black and white bird with a red beak",
        image_url: "https://images.unsplash.com/photo-1682420420091-ca2afcdf6956?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NDgxNjR8MHwxfHJhbmRvbXx8fHx8fHx8fDE2ODQ1MjQ5MjN8&ixlib=rb-4.0.3&q=80&w=1080",
        language: "Turkish",
        user_id: 55,
        verb: "(le/la) uğraşmak"
      }
      @prompt = Prompt.new(info)
    end

    it 'exists' do
      expect(@prompt).to be_a Prompt
    end

    it 'has attributes' do
      expect(@prompt.verb).to eq("(le/la) uğraşmak")
      expect(@prompt.eng_verb).to eq("to deal with")
      expect(@prompt.image_url).to eq("https://images.unsplash.com/photo-1682420420091-ca2afcdf6956?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NDgxNjR8MHwxfHJhbmRvbXx8fHx8fHx8fDE2ODQ1MjQ5MjN8&ixlib=rb-4.0.3&q=80&w=1080")
      expect(@prompt.image_alt_text).to eq("a black and white bird with a red beak")
      expect(@prompt.language).to eq("Turkish")
      expect(@prompt.user_id).to eq(55)
      expect(@prompt.grammar_points).to be_a Array
      expect(@prompt.grammar_points.first).to be_a Hash
      expect(@prompt.grammar_points.first[:grammar_point]).to eq("geniş zaman (-ir/-er)")
    end
  end
end
