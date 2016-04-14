# Virus Predictor

# I worked on this challenge [with: Adrian S. Tran].
# We spent [] hours on this challenge.

# EXPLANATION OF require_relative
#Accesses file in the same working directory to use as reference.

require_relative 'state_data'

class VirusPredictor
#initializes each instance with state, population density, and population variables
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end
#takes the instance variables as arguments for predicted_deaths and speed_of_spread
#got rid of original arguments because they were not needed due to the scope and power of instance variables.
  def virus_effects
    predicted_deaths
    speed_of_spread
  end

  private
#calculates the number of deaths based on pop density and population
#got rid of original arguments because they were not needed due to the scope and power of instance variables.
  def predicted_deaths
    # predicted deaths is solely based on population density (DBC's original comment)
    #dec is short for decimal/float
    if @population_density >= 200
      dec = 0.4
    elsif @population_density >= 150
      dec = 0.3
    elsif @population_density >= 100
      dec = 0.2
    elsif @population_density >= 50
      dec = 0.1
    else
      dec = 0.05
    end
    number_of_deaths = (@population * dec).floor

    print "#{@state} will lose #{number_of_deaths} people in this outbreak"

  end
#gives corresponding speed for pop density 
#got rid of original arguments because they were not needed due to the scope and power of instance variables.
  def speed_of_spread #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.
    speed = 0.0

    if @population_density >= 200
      speed += 0.5
    elsif @population_density >= 150
      speed += 1
    elsif @population_density >= 100
      speed += 1.5
    elsif @population_density >= 50
      speed += 2
    else
      speed += 2.5
    end

    puts " and will spread across the state in #{speed} months.\n\n"

  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state


alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
alabama.virus_effects

jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
jersey.virus_effects

california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
california.virus_effects

alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
alaska.virus_effects

#Release 5: Implement a new feature - Create report for all 50 states
STATE_DATA.each do |key, value| 
states = VirusPredictor.new(key, value[:population_density], value[:population])
states.virus_effects
end

#=======================================================================
# Reflection Section