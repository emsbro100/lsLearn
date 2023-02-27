=begin
Write a method that takes a time using minutes before or after midnight and
returns the time of day in 24 hour format (hh:mm). Your method should work with
any integer input.

input: integer
output: string

explicit rules:
- may not use ruby's Date and Time classes
- should work with any integer, negative or positive, or zero
- should return a string in the format "hh:mm"

data structure:
- input is an integer
- output is a string

algorithm:
- given input 'midnight_delta'
- if absolute value is greater than minutes in a day then substract that to get
  it down to within a day.
- if positive, leave as is
- if negative, subtract from total minutes in a day
- calculate using minutes to hours/mins conversion. can be done 
  with divmod
- return 'hh:mm' stringified
=end

def time_of_day(midnight_delta)
  midnight_delta = 1440 + midnight_delta
  while midnight_delta >= 1440 || midnight_delta < 0
    if midnight_delta.abs == midnight_delta
      midnight_delta -= 1440
    else
      midnight_delta += 1440
    end
  end

  hhmm = midnight_delta.divmod(60)
  hhmm[0] = hhmm[0].to_s.size > 1 ? hhmm[0].to_s : "0#{hhmm[0]}"
  hhmm[1] = hhmm[1].to_s.size > 1 ? hhmm[1].to_s : "0#{hhmm[1]}"

  "#{hhmm[0]}:#{hhmm[1]}"
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"
