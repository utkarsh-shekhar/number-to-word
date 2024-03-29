# number-to-word
Given a 10 digit phone number, ouput the possible ways that phone number could be called out in words. Eg:
If the phone number is 6686787825, then this can be written as

"motortruck", "noun-struck", "motor-usual", "nouns-truck", etc.

where
```
key_maps = {
    '2' => ['a', 'b', 'c'],
    '3' => ['d', 'e', 'f'],
    '4' => ['g', 'h', 'i'],
    '5' => ['j', 'k', 'l'],
    '6' => ['m', 'n', 'o'],
    '7' => ['p', 'q', 'r', 's'],
    '8' => ['t', 'u', 'v'],
    '9' => ['w', 'x', 'y', 'z']
}
```

Assumptions: 
1 and 0 do not appear in the phone number

## Usage
```
require_relative "converter.rb"

converter = Converter.new
result = converter.formatted_words('6686787825')
```
The constructor of the Converter class takes 2 params: min_word_size and dictionary_file.

```
min_word_size: number, default: 3
dictionary_file: string, default: 'dictionary.txt'
```

## Public Methods
Converter class has two public methods:

### words(number_string): 
Returns the words making the number_string as an array of arrays. The inside arrays are made up of the actual words. Eg:
```
result = converter.words('6686787825')

Output:
result = [["motortruck"], ["mot", "opt", "puck"], ["mot", "opt", "ruck"], ["mot", "opt", "suck"], ["mot", "ort", "puck"], ["mot", "ort", "ruck"], ["mot", "ort", "suck"], ["not", "opt", "puck"], ["not", "opt", "ruck"], ["not", "opt", "suck"], ["not", "ort", "puck"], ["not", "ort", "ruck"], ["not", "ort", "suck"], ["oot", "opt", "puck"], ["oot", "opt", "ruck"], ["oot", "opt", "suck"], ["oot", "ort", "puck"], ["oot", "ort", "ruck"], ["oot", "ort", "suck"], ["mot", "opts", "taj"], ["mot", "opus", "taj"], ["mot", "orts", "taj"], ["not", "opts", "taj"], ["not", "opus", "taj"], ["not", "orts", "taj"], ["oot", "opts", "taj"], ["oot", "opus", "taj"], ["oot", "orts", "taj"], ["noun", "struck"], ["onto", "struck"], ["noun", "pup", "taj"], ["noun", "pur", "taj"], ["noun", "pus", "taj"], ["noun", "sup", "taj"], ["noun", "suq", "taj"], ["onto", "pup", "taj"], ["onto", "pur", "taj"], ["onto", "pus", "taj"], ["onto", "sup", "taj"], ["onto", "suq", "taj"], ["motor", "truck"], ["motor", "usual"], ["nouns", "truck"], ["nouns", "usual"]]
```
### formatted_words(number_string): 
Returns the words as an array of '-' separated words. Internally calls ```word()```. Eg:
```
result = converter.formatted_words('6686787825')

Output:
result = ["motortruck", "mot-opt-puck", "mot-opt-ruck", "mot-opt-suck", "mot-ort-puck", "mot-ort-ruck", "mot-ort-suck", "not-opt-puck", "not-opt-ruck", "not-opt-suck", "not-ort-puck", "not-ort-ruck", "not-ort-suck", "oot-opt-puck", "oot-opt-ruck", "oot-opt-suck", "oot-ort-puck", "oot-ort-ruck", "oot-ort-suck", "mot-opts-taj", "mot-opus-taj", "mot-orts-taj", "not-opts-taj", "not-opus-taj", "not-orts-taj", "oot-opts-taj", "oot-opus-taj", "oot-orts-taj", "noun-struck", "onto-struck", "noun-pup-taj", "noun-pur-taj", "noun-pus-taj", "noun-sup-taj", "noun-suq-taj", "onto-pup-taj", "onto-pur-taj", "onto-pus-taj", "onto-sup-taj", "onto-suq-taj", "motor-truck", "motor-usual", "nouns-truck", "nouns-usual"]
```

## Benchmarks
Since the bottle neck is the time taken to read the file and convert it into a trie, we see that the actual difference for running this for 10 numbers is only about 100ms. 

Benchmarks for a single 10 digit number(6686787825):
```
real	0m0.810s
user	0m0.764s
sys	0m0.044s
```

Benchmarks for 10, 10 digit numbers(6686787825, 2282668687, 2267898687, 7563972362, 3676578934, 5686747895, 8856372773, 5637832356, 8456453452, 7895723444)
```
real	0m0.904s
user	0m0.860s
sys	0m0.041s
```

Benchmark for just reading the file and converting it to a trie:
```
real	0m0.806s
user	0m0.755s
sys 0m0.048s
```

## Credits:
Uses the word list from [here](https://github.com/jonbcard/scrabble-bot/blob/master/src/dictionary.txt)
