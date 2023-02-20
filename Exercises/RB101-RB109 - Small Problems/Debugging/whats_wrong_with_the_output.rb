arr = ["9", "8", "7", "10", "11"]
p (arr.sort do |x, y|
    y.to_i <=> x.to_i
  end)

# Expected output: ["11", "10", "9", "8", "7"] 
# Actual output: ["10", "11", "7", "8", "9"] 

# The output is wrong because the block is evaluated for p instead of for #sort.
# This can be fixed by putting the arr.sort and its block in parentheses or by
# assigning it to a variable then printing.
