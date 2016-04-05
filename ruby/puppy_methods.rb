class Puppy

  def fetch(toy)
    puts "I brought back the #{toy}!"
    toy
  end

  def speak(number)
  	number.times do puts "Woof!" end
  end

  def roll_over
  	puts "*rolls over*"
  end

  def dog_years(human_years)
  	 return 11 * human_years
  end

end

shishi = Puppy.new
shishi.fetch("squeeky ball")
shishi.speak(5)
shishi.roll_over
shishi.dog_years(7)
