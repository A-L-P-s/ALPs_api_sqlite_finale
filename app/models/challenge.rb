class Challenge < ApplicationRecord
  belongs_to :user
  has_many :sentences, dependent: :destroy

  def create_sentences(sentence_params)
    sentence_params.each do |sentence|
      sentences.create(grammar_point: sentence["grammar_point"], eng_grammar_point: sentence["eng_grammar_point"], user_sent: sentence["user_sent"])
    end
  end
end
