class Puppy

  def initialize
  	puts "Initializing new puppy instance..."
  end

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

  def sleep_whole_day
  	puts "*sleeps whole day* and loves every second of it!"
  end

end


shishi = Puppy.new
shishi.fetch("squeeky ball")
shishi.speak(5)
shishi.roll_over
shishi.dog_years(7)
shishi.sleep_whole_day


class Kitten

  def initialize
  end

  def ignore
  	puts "*ignores you with ease*"
  end

  def speaks
  	puts "meeoow" 
  end
  
end

fifty = [many = Kitten.new]*50

fifty.each do many.ignore end
fifty.each do many.speaks end






