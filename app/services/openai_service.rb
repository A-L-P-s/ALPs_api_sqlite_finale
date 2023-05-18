class OpenaiService

  def self.get_response(info)
    payload = { 
      "model": "gpt-3.5-turbo",
      "messages": [
          {
              "role": "user",
              "content": "I am trying to learn #{Challenge.find(info[:id]).language}. This sentence uses the grammar #{Challenge.find(info[:id]).sentences.first.grammar_point} and the verb #{Challenge.find(info[:id]).verb}: '#{Challenge.find(info[:id]).sentences.first.user_sent}'. Correct this sentence if it's wrong and explain what you changed. This sentence uses the grammar #{Challenge.find(info[:id]).sentences.second.grammar_point} and the verb #{Challenge.find(info[:id]).verb}: '#{Challenge.find(info[:id]).sentences.second.user_sent}'. Correct this sentence if it's wrong and explain what you changed. Format the output in JSON with parameters correction1, explanation1, correction2, explanation2."
          }
        ],
      "temperature": 0.7,
      "max_tokens": 600
    }
    response = get_url(payload)
    content = response[:choices].first[:message][:content]
  end

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