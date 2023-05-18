class OpenaiService

  def self.get_response(info)
    payload = { 
      "model": "gpt-3.5-turbo",
      "messages": [
          {
              "role": "user",
              "content": "I am trying to learn #{Challenge.find(info[:id]).language}. This sentence uses the grammar #{Challenge.find(info[:id]).sentences.first.grammar_point} and the verb #{Challenge.find(info[:id]).verb}: '#{Challenge.find(info[:id]).sentences.first.user_sent}'. Correct this sentence if it's wrong and explain what you changed. This sentence uses the grammar #{Challenge.find(info[:id]).sentences.second.grammar_point} and the verb #{Challenge.find(info[:id]).verb}: '#{Challenge.find(info[:id]).sentences.second.user_sent}'. Correct this sentence if it's wrong and explain what you changed. Format the output as multiple Ruby arrays of strings. Example: [sentence_1: your response] [sentence_2: your response] [explanation_1: your response] [explanation_2: your response]"
          }
        ],
      "temperature": 0.9,
      "max_tokens": 600
    }
    response = get_url(payload)
    require 'pry'; binding.pry
    content = response[:choices].first[:message][:content]
    content = content[1..-2] # Remove the curly braces at the start and end 
    content = content.split("&") # Split the string into an array based on commas
    content = content.map(&:strip) # Remove leading and trailing whitespace from each array element
  end

  private

  def self.conn
    Faraday.new(url: 'https://api.openai.com/v1/chat/completions')
  end

  def self.get_url(payload)
    response = conn.post do |req|
      req.headers['Content-Type'] = 'application/json'
      req.headers['Authorization'] = "Bearer #{ENV['OPENAI_API_KEY']}"
      req.body = payload.to_json
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end