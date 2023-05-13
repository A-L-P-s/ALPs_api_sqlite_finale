class CreateGrammarPoints < ActiveRecord::Migration[7.0]
  def change
    create_table :grammar_points do |t|
      t.string :language
      t.string :grammar_point
      t.string :eng_grammar_point

      t.timestamps
    end
  end
end
