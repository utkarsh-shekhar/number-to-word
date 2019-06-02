require_relative 'trie.rb'

class Dictionary
    def initialize(file_path)
        @trie = Trie.new
        load_file(file_path)
    end

    def load_file(file_path)
        File.foreach(file_path) do |line|
            word = line[0...-1].downcase
            @trie.add_word(word)
        end
    end

    def word_exists?(word)
        @trie.present? word
    end

    def pattern_exists?(pattern)
        @trie.pattern_present? pattern
    end
end
