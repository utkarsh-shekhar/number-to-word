require_relative 'dictionary.rb'

class WordGenerator
    def initialize(dictionary_file)
        @key_maps = {
            '2' => ['a', 'b', 'c'],
            '3' => ['d', 'e', 'f'],
            '4' => ['g', 'h', 'i'],
            '5' => ['j', 'k', 'l'],
            '6' => ['m', 'n', 'o'],
            '7' => ['p', 'q', 'r', 's'],
            '8' => ['t', 'u', 'v'],
            '9' => ['w', 'x', 'y', 'z']
        }
        @dictionary = Dictionary.new dictionary_file
    end

    def generate_words(number_string, prefix = '')
        if prefix.length > 0 && !@dictionary.pattern_exists?(prefix)
            return []
        end
        if number_string.length == 1
            words = []
            @key_maps[number_string].each do |char|
                word = prefix + char
                words << word if @dictionary.word_exists? word
            end
            return words.uniq
        end

        first_number = number_string[0]
        new_number_string = number_string[1..-1]
        first_characters = @key_maps[first_number]
        words = []
        first_characters.each do |char|
            words += generate_words(new_number_string, prefix + char)
        end

        words.uniq
    end
end
