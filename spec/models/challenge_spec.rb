require 'rails_helper'

RSpec.describe Challenge, type: :model do
  describe "relationships" do
    it { should belong_to :user }
    it { should have_many :sentences }
  end
end