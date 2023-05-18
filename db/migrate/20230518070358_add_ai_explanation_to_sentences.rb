class AddAiExplanationToSentences < ActiveRecord::Migration[7.0]
  def change
    add_column :sentences, :ai_explanation, :string
  end
end
