#5.5 Nested Data Structres
#Release 2: Design and Build a Nested Data Structure

#Animals
#Mammals, Reptiles, Insects, Amphibians


animals = {
	mammals: {
		primates: ["humans", "apes", "monkeys"],
		rodentia: ["mice", "squirrels", "hamsters"],
		artiodactyla: ["pigs", "cows", "hippos"],
	},	
	reptiles: {
		crocodilia: ["crocodiles", "caimans", "alligators"],
		squamata: ["lizards", "snakes", "worm-lizards"],
		testudines: ["turtles", "tortoises"],
	},
	insects: {
		homoptera: ["ants", "bees", "wasps"],
		lepidoptera: ["butterflies", "moths"],
		coleoptera: ["ladybugs", "mealworms", "lightning bugs"],
	},
	amphibians: {
		anura: ["frogs", "toads"],
		urodela: ["salamanders", "newts"],
		apoda: ["ichyophis", "gegenophis", "ureotyphlus"],
	}
}

#print the animals in the Rodentia family
p animals[:mammals][:rodentia]

#print the mealworm animal using index number
p animals[:insects][:coleoptera][1]

#add rats to Rodentia family, then print to check
animals[:mammals][:rodentia].push("rats")
p animals[:mammals][:rodentia]

#reverse list order in primates family, then print to check
animals[:mammals][:primates].reverse!
p animals[:mammals][:primates]

#make humans read "HUMANS", print to check
animals[:mammals][:primates][2].upcase!
p animals[:mammals][:primates]
