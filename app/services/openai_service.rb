class OpenaiService

  # def self.get_response(info) 
  #   payload = {
  #     "model": "gpt-3.5-turbo",
  #     "messages": [
  #       {
  #         "role": "user",
  #         "content": 
  #         "Language: #{Challenge.find(info[:id]).language}
  #          Verb: #{Challenge.find(info[:id]).verb}
  #          1_sentence: #{Challenge.find(info[:id]).sentences.first.user_sent}
  #          1_grammar_point: #{Challenge.find(info[:id]).sentences.first.grammar_point}
  #          2_sentence: #{Challenge.find(info[:id]).sentences.second.user_sent}
  #          2_grammar_point: #{Challenge.find(info[:id]).sentences.second.grammar_point}
           
  #          I am trying to learn #{Challenge.find(info[:id]).language}, and I have been given a challenge to write 2 sentences using the verb #{Challenge.find(info[:id]).verb}. I have written this sentence #{Challenge.find(info[:id]).sentences.first.user_sent} trying to use the grammar point: #{Challenge.find(info[:id]).sentences.first.grammar_point}, and I have written this sentence #{Challenge.find(info[:id]).sentences.second.user_sent} trying to use the grammar point: #{Challenge.find(info[:id]).sentences.second.grammar_point}.

  #          If a sentence is correct, please return the same sentence. If a sentence is incorrect, please return the sentence with necessary corrections to that given sentence. Make sure to keep the provided verb and grammar point in your revision.

  #          Please format the output as" 
  #       }
  #     ],
  #     "temperature": 0.9,
  #     "max_tokens": 600
  #   }
  #   get_url(payload)
  # end
 def self.get_response(info)
  payload = { 
    "model": "gpt-3.5-turbo",
    "messages": [
        {
            "role": "user",
            "content": "I am trying to learn #{Challenge.find(info[:id]).language}. This sentence uses the grammar #{Challenge.find(info[:id]).sentences.first.grammar_point} and the verb #{Challenge.find(info[:id]).verb}: '#{Challenge.find(info[:id]).sentences.first.user_sent}'. Correct this sentence if it's wrong and explain what you changed. This sentence uses the grammar #{Challenge.find(info[:id]).sentences.second.grammar_point} and the verb #{Challenge.find(info[:id]).verb}: '#{Challenge.find(info[:id]).sentences.second.user_sent}'. Correct this sentence if it's wrong and explain what you changed. Format the output as a Ruby hash. Example: { sentence_1: 'your response', sentence_2: 'your response', explanation_1: 'your response', explanation_2: 'your response' }"
        }
      ],
    "temperature": 0.9,
    "max_tokens": 600
  }
  get_url(payload)
 end

  private

  def self.conn
    Faraday.new(url: 'https://api.openai.com/v1/chat/completions')
  end

  def self.get_url(payload)
    response = conn.post do |req|
      req.headers['Content-Type'] = 'application/json'
      req.headers['Authorization'] = "Bearer #{ENV['openai_key']}"
      req.body = payload.to_json
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end