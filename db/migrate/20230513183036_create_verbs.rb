class CreateVerbs < ActiveRecord::Migration[7.0]
  def change
    create_table :verbs do |t|
      t.string :language
      t.string :verb
      t.string :eng_verb

      t.timestamps
    end
  end
end
