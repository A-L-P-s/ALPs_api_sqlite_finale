class CreateSentences < ActiveRecord::Migration[7.0]
  def change
    create_table :sentences do |t|
      t.references :challenge, null: false, foreign_key: true
      t.string :grammar_point
      t.string :eng_grammar_point
      t.string :user_sent
      t.string :ai_sent

      t.timestamps
    end
  end
end
