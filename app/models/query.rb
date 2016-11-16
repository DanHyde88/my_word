class Query < ApplicationRecord
    belongs_to :user

    def self.find_definition(query)
        %w(rubygems wordnik).each {|lib| require lib}

        Wordnik.configure do |config|
            config.api_key = '2bc43a11797607b43f40936e113939c32e5317c0cb0bc59f6'
        end

        definition =  Wordnik.word.get_definitions(query.word)
        definition_text = definition[0]['text']
    end
end
