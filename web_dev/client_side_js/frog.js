
console.log("Testing")

function addTextShadow(event) {
	console.log(event);
event.target.style.textShadow = "2px 2px #008000";
}


var frogMiscText = document.getElementsByTagName('p')
var frogText = frogMiscText[0]
frogText.addEventListener("mouseover", addTextShadow);
	
// 	event.target.style.textShadow = "2px 2px #008000";
// setTimeout(addTextShadow() {
// 	event.target.style.color = "";
//     }, 500);
//   }, false);
  


