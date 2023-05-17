class OpenaiFacade
  attr_reader :openai

  def initialize(params)
    @openai = OpenaiService.new
  end

  def self.sort_response(response)
    manipulated_response = response[:choices].first[:message][:content]
    require 'pry'; binding.pry
  end
end