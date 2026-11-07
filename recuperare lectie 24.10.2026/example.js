function barrelRoll() {
	document.body.style.transition = "transform 2s";
	document.body.style.transform = "rotate(360deg)";
}

let clicks = 0;

const counterDiv = document.getElementById("counter");
counterDiv.addEventListener("click", count);

function count() {
	clicks++;
	counterDiv.textContent = `Clicks: ${clicks} so far`; // 'Clicks ' + clicks + ' so far'

	counterDiv.style.background = "lightblue";
}
