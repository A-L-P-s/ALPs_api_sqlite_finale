class OpenaiFacade

  def self.check_challenge_with_ai(new_challenge)
    parsed_data = scrub_response(new_challenge)
    
    # Update sentence records with AI information:
    sent_array = new_challenge.sentences
    sent_array[0].update(ai_sent: parsed_data[:correction1], ai_explanation: parsed_data[:explanation1])
    sent_array[1].update(ai_sent: parsed_data[:correction2], ai_explanation: parsed_data[:explanation2])

    # Return fully updated Challenge:
    new_challenge
  end

  def self.scrub_response(new_challenge)
    content = OpenaiService.get_response(new_challenge)
    x = content.delete("\n")
    JSON.parse(x, symbolize_names: true)
  end
end