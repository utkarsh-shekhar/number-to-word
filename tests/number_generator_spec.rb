require_relative "../number_generator.rb"
require "test/unit"

class NumberGeneratorSpec < Test::Unit::TestCase
    describe "testing NumberGenerator" do
        context 'generate_number_combinations' do
            it "should return [[]] if number string length < min size" do
                generator = NumberGenerator.new(3)
                result = generator.generate_number_combinations('12')

                expect(result).to eq([[]])
            end

            it "should return combinations if number string length > min size" do
                generator = NumberGenerator.new(3)
                result = generator.generate_number_combinations('1234567')

                expected = [
                    ['1234567'],
                    ['123', '4567'],
                    ['1234', '567']
                ]
                expect(result).to eq(expected)
            end

            it "should return combinations if number string length > min size" do
                generator = NumberGenerator.new(3)
                result = generator.generate_number_combinations('123456')

                expected = [
                    ['123456'],
                    ['123', '456']
                ]
                expect(result).to eq(expected)
            end
        end
    end
end
