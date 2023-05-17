class Verb < ApplicationRecord
  def self.verbs_by(lang)
    select("verbs. *").where(language: lang)
  end
end
