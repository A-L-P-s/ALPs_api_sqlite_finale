class GrammarPoint < ApplicationRecord
  def self.grammar_points_by(lang)
    select("grammar_points. *").where(language: lang)
  end
end
