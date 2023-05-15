class Challenge < ApplicationRecord
  belongs_to :user
  has_many :sentences
end
