require 'rails_helper'

RSpec.describe Sentence, type: :model do
  describe "relationships" do
    it { should belong_to :challenge }
  end
end