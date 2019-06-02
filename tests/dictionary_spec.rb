require_relative "../dictionary.rb"
require_relative "../trie.rb"
require "test/unit"

class DictionarySpec < Test::Unit::TestCase
    describe "testing Dictionary" do
        context 'initialize' do
            it "should call load_file method" do
                file_path = "abc"
                allow_any_instance_of(Dictionary).to receive(:load_file).and_return(nil)
                expect_any_instance_of(Dictionary).to receive(:load_file).with(file_path)
                expect(Trie).to receive(:new).once

                dictionary = Dictionary.new file_path
            end
        end

        context 'load_file' do
            it 'should read the file and create add words to trie' do
                file_path = '../dictionary.txt'
                dictionary = Dictionary.new file_path
                expect(File).to receive(:foreach).once
                dictionary.load_file '../dictionary.txt'
            end
        end

        context 'word_exists?' do
            it "should return true if word exists" do
                file_path = "abc"
                trie = Trie.new
                word = 'ab'
                trie.add_word(word)
                allow_any_instance_of(Dictionary).to receive(:load_file).and_return(nil)
                allow(Trie).to receive(:new).once.and_return(trie)
                dictionary = Dictionary.new file_path
                result = dictionary.word_exists? word
                expect(result).to eq(true)
            end

            it "should return false if word doesn't exists" do
                file_path = "abc"
                trie = Trie.new
                word = 'ab'
                trie.add_word(word)
                allow_any_instance_of(Dictionary).to receive(:load_file).and_return(nil)
                allow(Trie).to receive(:new).once.and_return(trie)
                dictionary = Dictionary.new file_path
                result = dictionary.word_exists? 'asadf'
                expect(result).to eq(false)
            end
        end

        context 'pattern_exists?' do
            it "should return true if pattern exists" do
                file_path = "abc"
                trie = Trie.new
                word = 'abcd'
                trie.add_word(word)
                allow_any_instance_of(Dictionary).to receive(:load_file).and_return(nil)
                allow(Trie).to receive(:new).once.and_return(trie)
                dictionary = Dictionary.new file_path
                result = dictionary.pattern_exists? 'ab'
                expect(result).to eq(true)
            end

            it "should return false if pattern doesn't exists" do
                file_path = "abc"
                trie = Trie.new
                word = 'ab'
                trie.add_word(word)
                allow_any_instance_of(Dictionary).to receive(:load_file).and_return(nil)
                allow(Trie).to receive(:new).once.and_return(trie)
                dictionary = Dictionary.new file_path
                result = dictionary.pattern_exists? 'asadf'
                expect(result).to eq(false)
            end
        end
    end
end
