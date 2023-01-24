=begin
Calculate mortgage payments using three arguments: loan amount, APR, duration
  Needs to output three values: monthly interest rate, duration in months,
  and monthly payment
  Use the following forumula:
    m = p * (j / (1 - (1 + j)**(-n)))
    m = monthly payments
    p = loan amount
    j = monthly interest rate
    n = loan duration in months
  Return all three values, use independent method to read those and print them
=end

def prompt(message)
  puts "=> #{message}"
end

def get_num
  gets.chomp.to_f
end

# Takes three arguments, returns an array with three values
def calculate_mortgage(amount, years, apr)
  monthly_interest = apr / 12
  months = years * 12
  monthly_payment = monthly_interest / (1 - (1 + monthly_interest)**(-months))
  monthly_payment *= amount

  [months, monthly_interest, monthly_payment]
end

def print_mortgage
  prompt "Welcome to Mortgage Calculator!"
  prompt "What is the amount of the loan you would like to calculate?"
  amount = get_num
  prompt "What is the duration of this loan in years?"
  duration = get_num
  prompt "And what is the percent APR?"
  interest = get_num / 100
  mortgage_info = calculate_mortgage(amount, duration, interest)
  monthly_interest = (mortgage_info[1] * 100).round(2)
  monthly_payment = mortgage_info[2].round(2)
  prompt "Your mortgage will last #{mortgage_info[0]} months, and the monthly "\
         "interest will be #{monthly_interest}% which will result in monthly "\
         "payments of $#{monthly_payment}."
end

print_mortgage
