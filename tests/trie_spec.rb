require_relative "../trie.rb"
require_relative "../node.rb"
require "test/unit"

class TrieSpec < Test::Unit::TestCase
    describe "testing Trie" do
        it "add_word" do
            trie = Trie.new
            first_node = Node.new
            second_node = Node.new

            word = "ab"
            allow(Node).to receive(:new).and_return(first_node, second_node)
            expect(Node).to receive(:new).twice
            trie.add_word(word)
            expect(first_node.end_of_word).to eq(false) 
            expect(second_node.end_of_word).to eq(true) 
        end


        context 'present?' do
            it "should return true if the word is present" do
                word = "ab"
                trie = Trie.new
                first_node = Node.new
                second_node = Node.new
                first_node.characters['b'] = second_node
                second_node.end_of_word = true

                trie.instance_variable_set('@start', {'a' => first_node})

                result = trie.present? word

                expect(result).to eq(true)
            end

            it "should return false if the word is present" do
                word = "ab"
                trie = Trie.new
                result = trie.present? word
                expect(result).to eq(false)
            end
        end

        context "pattern_present?" do
            it "should return true if the pattern is present" do
                word = "a"
                trie = Trie.new
                first_node = Node.new
                second_node = Node.new
                first_node.characters['b'] = second_node
                second_node.end_of_word = true

                trie.instance_variable_set('@start', {'a' => first_node})

                result = trie.pattern_present? word

                expect(result).to eq(true)
            end
        end

        context "pattern_present?" do
            it "should return true if the pattern is present" do
                word = "a"
                trie = Trie.new
                result = trie.pattern_present? word
                expect(result).to eq(false)
            end
        end
    end
end
