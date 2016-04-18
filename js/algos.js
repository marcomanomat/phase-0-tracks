
//first we will create our function longest and set the pram to array
//then we will need to make a new var to set the longest string to
//After a for loop is created, with a conditional if statement to
//sort through the arrays, comparring lengths, and reseting our
//new var to equal the longest phrase.
//Now driver code
function longest(arr) {
	var newLong = arr[0]
	for (var i = 0; i < arr.length; i++) {
		if(arr[i].length > newLong.length) {
			newLong = arr[i]
		}
	}

	console.log(newLong)
}

longest(["long phrase", "longest phrase", "longer phrase", "JS", "JavaScript is the best!"]);
console.log("---")
console.log("---")
//First create a function pair and set the pram to 2 objects
//then take the the object of each has and let it use the value
//compare the two values to see if they match
//if yes then return true
//else false

function pair(obj, obj2) {
	"use strict";
	for(let value in obj){
		if(obj[value] == obj2[value]){
			return true
		}
	}
	return false
}

const david = {name: "David", age: 24};
const steve = {name: "Steven", age: 54};
const tamir = {name: "Tamir", age: 54};

console.log(pair(steve, tamir));
console.log(pair(steve, david));
console.log(pair(david, tamir));

console.log("---")
console.log("---")

//Use a getRandomInt function declared first to use in our function
//We need to create a empty array to store our "words" in
//We'll have to loop the number of times requested for the word
//Then make it so it randomly picks letters and length of word to create
//a word, and push that into our array
//then we need to return the result

function getRandomInt(min, max){
	return Math.floor(Math.random() * (max - min)) + min;
}

function randomLetters(num) {
	"use strict";
	var newWord = []
	var letters = "abcdefghijklmnopqrstuvwxyz"
	for (var i = 0; i < num; i++) {
		var word = "";
		var lengthWord = getRandomInt(1, 10)
		for (var d = 0; d < lengthWord; d++) {
			var currentLetter = letters[getRandomInt(0,25)]
			word = word += currentLetter
		};
		newWord.push(word)
	};
	return newWord;	
}

for (w = 0; w < 10; w++) {
	array = randomLetters(10);
	console.log(array);
	console.log(longest(array));
}