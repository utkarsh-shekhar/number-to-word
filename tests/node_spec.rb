require_relative "../node.rb"
require "test/unit"

class NodeSpec < Test::Unit::TestCase
    describe "testing Node" do
        it "is initialized with characters" do
            node = Node.new
            expect(node.characters).to eq({})
        end
    
        it "is initialized with end_of_word" do
            node = Node.new
            expect(node.end_of_word).to eq(false)
        end
    end
end
