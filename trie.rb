require_relative 'node.rb'

class Trie
    attr_accessor :start
    def initialize
        @start = {}
    end

    def add_word(word)
        characters = @start
        current_node = nil
        word.each_char do |char|
            characters[char] = Node.new if characters[char].nil?
            current_node = characters[char]
            characters = current_node.characters
        end
        current_node.end_of_word = true
    end

    def pattern_present?(pattern)
        characters = @start
        current_node = nil
        pattern.each_char do |char|
            return false if characters[char].nil?
            current_node = characters[char]
            characters = current_node.characters
        end
        
        true
    end

    def present?(word)
        characters = @start
        current_node = nil
        word.each_char do |char|
            return false if characters[char].nil?
            current_node = characters[char]
            characters = current_node.characters
        end

        current_node.end_of_word
    end
end

