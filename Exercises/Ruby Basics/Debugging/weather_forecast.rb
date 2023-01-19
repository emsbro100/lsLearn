def predict_weather
  sunshine = [true, false].sample

  if sunshine
    puts "Today's weather will be sunny!"
  else
    puts "Today's weather will be cloudy!"
  end
end

predict_weather

# The program doesn't work because both of the values in the array are 
# strings instead of booleans, which always evaluate to true.