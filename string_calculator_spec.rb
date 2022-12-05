require './string_calculator.rb'

describe StringCalculator do
    calculator = StringCalculator.new
    it "returns 0 for empty string" do
        result = calculator.add("")
        expect(result).to eq(0)
    end

    it "returns the sum of two number separated by a comma" do
        result = calculator.add("1,2")
        expect(result).to eq(3)
      end

  it "returns the same number when is only one" do
    result = calculator.add("1")
    expect(result).to eq(1)
  end

  it "can hanlde an unknown amount of numbers" do
    result = calculator.add("1,2,3,4,5,6")
    expect(result).to eq(21)
    result = calculator.add("1,2,3")
    expect(result).to eq(6)
  end

  it "can hanlde new lines between numbers (instead of commas)" do
    result = calculator.add("1\n2,3")
    expect(result).to eq(6)
  end

  it "supports different delimiters" do
    result = calculator.add("//;\n1;2,3|5")
    expect(result).to eq(11)
  end

  it "will throw an exception 'negatives not allowed' if a negative number is pressent" do
    expect { calculator.add("-4")}. to raise_error.with_message(/Negatives not allowed./)
    #if there are multiple negatives, show all of them in the exception message.
    expect { calculator.add("1,-6,3,-4,5")}. to raise_error.with_message(/-6, -4/)
  end
  
  it "going to ignore numbers bigger than 1000" do
    result = calculator.add("8,2,1001")
    expect(result).to eq(10)
    result = calculator.add("1001")
    expect(result).to eq(0)
  end

  it "Allow multiple delimiters between numbers" do
    result = calculator.add("//[*][%]\n1*2%3")
    expect(result).to eq(6)
    # Also handle multiple delimiters with length longer than one char.
    result = calculator.add("//[**][%%]\n1**2%%3”")
    expect(result).to eq(6)
  end
end