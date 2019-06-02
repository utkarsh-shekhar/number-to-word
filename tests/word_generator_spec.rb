require_relative "../word_generator.rb"
require "test/unit"

class WordGeneratorSpec < Test::Unit::TestCase
    describe "testing WordGenerator" do
        before(:all) do
            @generator = WordGenerator.new('../dictionary.txt')
        end

        context 'generate_words' do
            it "should return [] if prefix exists but it is not a valid word" do
                result = @generator.generate_words('23', 'xxxxxxxxxxxx')

                expect(result).to eq([])
            end

            it "should return correct words when number string is a single character" do
                result = @generator.generate_words('2', 'ab')

                expect(result).to eq(['aba'])
            end

            it "should return correct words" do
                result = @generator.generate_words('2257')

                expect(result).to eq(['aals', 'bals'])
            end
        end
    end
end
