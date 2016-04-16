var colors = ["blue", "red", "green",   "yellow"];

var names = ["Ed", "Marco", "David", "Fred"];

colors.push("black");

names.push("Sammy");

var newObject = new Object();
for (var i = 0; i < names.length; i++){
  newObject[names[i]] = colors[i];
}
console.log(newObject);

function Car(make, year, model) {
console.log("This is our new car!", this);
  this.make = make;
  this.year = year;
  this.model = model;
  
  this.rev = function() {console.log ("*purrrr*");};
  
  console.log("Car init complete");
  
}

console.log("Let's build a car...");

var anotherCar = new Car("Lexus", 2016, "IS");
console.log(anotherCar);
console.log("Our car can rev!");
anotherCar.rev();

var anotherCar = new Car("Chevy", 2002, "Silverado");
console.log(anotherCar);
console.log("Our car can rev!");
anotherCar.rev();