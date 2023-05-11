class CreateChallenges < ActiveRecord::Migration[7.0]
  def change
    create_table :challenges do |t|
      t.references :user, null: false, foreign_key: true
      t.string :language
      t.string :verb
      t.string :eng_verb
      t.string :image_url
      t.string :image_alt_text

      t.timestamps
    end
  end
end
