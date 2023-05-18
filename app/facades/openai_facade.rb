class OpenaiFacade
  attr_reader :openai

  def initialize(params)
    @openai = OpenaiService.new
  end

  def self.sort_response(response)
    manipulated_response = response[:choices].first[:message][:content]
    manipulated_response = manipulated_response[1..-2]
    manipulated_response = manipulated_response.split(". ")
    manipulated_response = manipulated_response.map(&:strip)
    require 'pry'; binding.pry
  end
end