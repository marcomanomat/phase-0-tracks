//7.1


//we need to make a reverse('hello') function. we will want to set our 
//counter to 0
//have an empty string that will hold the letters
//Then we will have to add the letters together to form the reversed string
//


function reverse(str) {
  var reversed = "";
  var i = str.length;
  while (i>0){
  	reversed += str.substring(i - 1, i);
  	i--;
  }
  return reversed;

//////DRIVER//////
}
	console.log (reverse("hello"));


if (1 == 1) {
	console.log (reverse("hello world"));
}