class OpenaiFacade
  attr_reader :openai

  def initialize(params)
    @openai = OpenaiService.new
  end

  # def self.sort_response(content)
  #   # content = response[:choices].first[:message][:content]
  #   x = content.delete("\n")
  #   JSON.parse(x, symbolize_names: true)
  # end

  def self.check_challenge_with_ai(new_challenge)
    # Clean response data:
    content = OpenaiService.get_response(new_challenge)
    content.delete("\n")
    parsed_data = JSON.parse(content, symbolize_names: true)

    # Update sentence records with AI information:
    sent_array = new_challenge.sentences
    sent_array[0].update(ai_sent: parsed_data[:correction1], ai_explanation: parsed_data[:explanation1])
    sent_array[1].update(ai_sent: parsed_data[:correction2], ai_explanation: parsed_data[:explanation2])
  
    # Return fully updated Challenge:
    new_challenge
  end
end