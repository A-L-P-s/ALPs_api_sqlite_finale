class Prompt
  attr_reader :id, :user_id, :language, :verb, :eng_verb, :image_url, :image_alt_text, :grammar_points

  def initialize(info)
    @id = nil
    @user_id = info[:user_id]
    @language = info[:language]
    @verb = info[:verb]
    @eng_verb = info[:eng_verb]
    @image_url = info[:image_url]
    @image_alt_text = info[:image_alt_text]
    @grammar_points = info[:grammar_points]
  end
end
