require_relative('number_generator.rb')
require_relative('word_generator.rb')

class Converter
    def initialize(min_word_size = 3, dictionary_file = 'dictionary.txt')
        @number_generator = NumberGenerator.new min_word_size
        @word_generator = WordGenerator.new dictionary_file
    end

    def words(number_string)
        combinations = @number_generator.generate_number_combinations number_string

        answer = []
        combinations.each do |combination|
            word_arrays = combination.map{|number| @word_generator.generate_words(number)}
            next if word_arrays.select{|array| array.length == 0}.length > 0

            answer += word_arrays[0].product(*word_arrays[1..-1])
        end
        answer
    end

    def formatted_words(number_string)
        combinations = words(number_string)
        combinations.map {|combination| combination.join('-')}
    end
end
