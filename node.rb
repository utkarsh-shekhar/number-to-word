class Node
    attr_accessor :characters
    attr_accessor :end_of_word

    def initialize()
        @characters = {}
        @end_of_word = false
    end
end
