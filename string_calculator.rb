class StringCalculator
    def add(numbers)
        return 0 if numbers.empty?
        string_array = numbers.split(/[^0-9-]+/)
        integer_array = string_array.map(&:to_i)
        if integer_array.any?(&:negative?)
            negatives_array = integer_array.select{ |i| i<0 }
            raise "Negatives not allowed. #{negatives_array}."
        end
        integer_array.inject(0){|sum,x| x <= 1000? sum + x : sum }
    end
end