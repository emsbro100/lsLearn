def toggle_lights(n)
  lights = Array.new(n) { false }

  n.times do |itr|
    lights.each_index do |idx|
      lights[idx] = (lights[idx] ? false : true) if ((idx + 1) % (itr + 1) == 0)
    end
  end

  lights_on = []
  lights.each_with_index { |item, idx| lights_on.push(idx + 1) if item }

  lights_on
end

p toggle_lights(5)
p toggle_lights(10)
p toggle_lights(1000)
