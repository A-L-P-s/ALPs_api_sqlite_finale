require 'rails_helper'

RSpec.describe Verb, type: :model do
  describe 'self' do
    it 'exists' do
      verb1 = Verb.create(language: "Spanish", verb: "hablar", eng_verb: "to speak")

      expect(verb1).to be_a Verb
      expect(verb1.language).to eq("Spanish")
      expect(verb1.verb).to eq("hablar")
      expect(verb1.eng_verb).to eq("to speak")
    end
  end
end
