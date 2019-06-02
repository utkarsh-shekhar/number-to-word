class NumberGenerator
    def initialize(min_size)
        @min_size = min_size
    end

    def generate_number_combinations(number_string, prefix = [])
        return [[]] if number_string.length < @min_size
        combinations = [prefix + [number_string]]

        split_start = @min_size
        split_end = number_string.length - @min_size
        while(split_start <= split_end) do
            new_prefix = number_string[0...split_start]
            new_number_string = number_string[split_start..-1]

            combinations += generate_number_combinations(new_number_string, prefix + [new_prefix])
            split_start += 1
        end

        return combinations
    end
end
