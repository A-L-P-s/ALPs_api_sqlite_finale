class OpenaiFacade
  attr_reader :openai

  def initialize(params)
    @openai = OpenaiService.new
  end

  def self.sort_response(content)
    # content = response[:choices].first[:message][:content]
    x = content.delete("\n")
    JSON.parse(x, symbolize_names: true)
  end
end