function barrelRoll() {
	document.body.style.transform = "rotate(360deg)";
}

const counter = document.getElementById("counter");
counter.addEventListener("click", count);

let clicks = 0;

function count() {
	clicks++; // clicks += 1

	counter.textContent = `Clicks:${clicks} so far`; // "Clicks:" + clicks + " so far"

	counter.style.background = "lightblue";
}
