require_relative "../converter.rb"
require "test/unit"

class ConverterSpec < Test::Unit::TestCase
    describe "testing ConverterGenerator" do
        before(:all) do
            @converter = Converter.new(3, '../dictionary.txt')
        end

        context 'words' do
            it "should return all possible words" do
                result = @converter.words('6686787825')

                expected = [["motortruck"], ["mot", "opt", "puck"], ["mot", "opt", "ruck"], ["mot", "opt", "suck"], ["mot", "ort", "puck"], ["mot", "ort", "ruck"], ["mot", "ort", "suck"], ["not", "opt", "puck"], ["not", "opt", "ruck"], ["not", "opt", "suck"], ["not", "ort", "puck"], ["not", "ort", "ruck"], ["not", "ort", "suck"], ["oot", "opt", "puck"], ["oot", "opt", "ruck"], ["oot", "opt", "suck"], ["oot", "ort", "puck"], ["oot", "ort", "ruck"], ["oot", "ort", "suck"], ["mot", "opts", "taj"], ["mot", "opus", "taj"], ["mot", "orts", "taj"], ["not", "opts", "taj"], ["not", "opus", "taj"], ["not", "orts", "taj"], ["oot", "opts", "taj"], ["oot", "opus", "taj"], ["oot", "orts", "taj"], ["noun", "struck"], ["onto", "struck"], ["noun", "pup", "taj"], ["noun", "pur", "taj"], ["noun", "pus", "taj"], ["noun", "sup", "taj"], ["noun", "suq", "taj"], ["onto", "pup", "taj"], ["onto", "pur", "taj"], ["onto", "pus", "taj"], ["onto", "sup", "taj"], ["onto", "suq", "taj"], ["motor", "truck"], ["motor", "usual"], ["nouns", "truck"], ["nouns", "usual"]]
                expect(result).to eq(expected)
            end
        end

        context 'formatted_words' do
            it "should return all possible words" do
                result = @converter.formatted_words('6686787825')

                expected = ["motortruck", "mot-opt-puck", "mot-opt-ruck", "mot-opt-suck", "mot-ort-puck", "mot-ort-ruck", "mot-ort-suck", "not-opt-puck", "not-opt-ruck", "not-opt-suck", "not-ort-puck", "not-ort-ruck", "not-ort-suck", "oot-opt-puck", "oot-opt-ruck", "oot-opt-suck", "oot-ort-puck", "oot-ort-ruck", "oot-ort-suck", "mot-opts-taj", "mot-opus-taj", "mot-orts-taj", "not-opts-taj", "not-opus-taj", "not-orts-taj", "oot-opts-taj", "oot-opus-taj", "oot-orts-taj", "noun-struck", "onto-struck", "noun-pup-taj", "noun-pur-taj", "noun-pus-taj", "noun-sup-taj", "noun-suq-taj", "onto-pup-taj", "onto-pur-taj", "onto-pus-taj", "onto-sup-taj", "onto-suq-taj", "motor-truck", "motor-usual", "nouns-truck", "nouns-usual"]
                expect(result).to eq(expected)
            end
        end
    end
end
