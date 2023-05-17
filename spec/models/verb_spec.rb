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

    it 'return verbs' do
      turk_verb1 = Verb.create(language: "Turkish", verb: "(le/la) uğraşmak", eng_verb: "to deal with")
      turk_verb2 = Verb.create(language: "Turkish", verb: "(e/a) gitmek", eng_verb: "to go")
      turk_verb3 = Verb.create(language: "Turkish", verb: "(e/a) tavsiye etmek", eng_verb: "to recommend")

      spanish_verb1 = Verb.create(language: "Spanish", verb: "hablar", eng_verb: "to speak")
      spanish_verb2 = Verb.create(language: "Spanish", verb: "bailar", eng_verb: "to dance")

      expect(Verb.verbs_by("Turkish")).to eq([turk_verb1, turk_verb2, turk_verb3])
    end
  end
end
