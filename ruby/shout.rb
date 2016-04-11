=begin
module Shout
	def self.yell_angrily(words)
		words + "!!!" + " :("
	end
	def self.yell_happily(words)
		words + "!!!" + " :)"
	end
end
Shout.yell_angrily("AAAAAAAARG")
Shout.yell_happily("YIPEEEEEEE")
=end

module Shout
	def yell_angrily(words)
		words + "!!!" + " :("
	end

	def yell_happily(words)
		words + "!!!" + " :)"
	end
end

class Ron_Burgundy
  include Shout
end

class Wes_Mantooth
  include Shout
end
#Driver code so we can see the output of the Release
ron = Ron_Burgundy.new
puts ron.yell_happily("You stay class San Diego")

wes = Wes_Mantooth.new
puts wes.yell_angrily("I hate you, Ron Burgundy. I hate you")