require "rails_helper"

RSpec.describe OpenaiFacade, :vcr do
  describe "instance methods" do
    it "can #sort_response" do
      info = {
          :id=>"chatcmpl-7HHPVrG7enJ7v9rW6P8z5hKFXuURH",
          :object=>"chat.completion",
          :created=>1684352857,
          :model=>"gpt-3.5-turbo-0301",
          :usage=>{:prompt_tokens=>183, :completion_tokens=>159, :total_tokens=>342},
          :choices=>
          [{:message=>
              {:role=>"assistant",
              :content=>
                "{\n  sentence_1: \"Hindistan'ı ziyaret ettiği için, bir fili binmeyi bilmış.\",\n  sentence_2: \"Filleri çok şey öğrenerek, hayvanat bahçesinde işi aldım.\",\n  explanation_1: \"Changed the verb form of 'bilmek' from '-miş' to the simple present tense 'öğrenmek' with the suffix -erek to use the zarf fiili.\",\n  explanation_2: \"Corrected the sentence by changing the verb from '-miş' to 'öğrenerek' and adding '-de' suffix to 'hayvanat bahçesi' to indicate the location. Also, changed the word order slightly.\"\n}"},
            :finish_reason=>"stop",
            :index=>0
            }
          ]
        }

        expect(OpenaiFacade.sort_response(info)).to be_a(Hash)
    end
  end
end