function recurso() {
	var arreglo = new Array();
	
	arreglo[1] = "aplausos.wav";
	arreglo[2] = "BaDumTss.mp3";
	arreglo[3] = "doink_doink.mp3";
	arreglo[4] = "wrong.wav";
	//arreglo[5] = "claxon2.mp3";
	//arreglo[6] = "resorte.mp3";
	//arreglo[7] = "tiger.mp3";
	
	var numRand = Math.floor((Math.random()*4)+1);
	
	console.log("dime el numero random "+numRand);
	console.log("dime el recurso "+arreglo[numRand]);
	
	var recursoRandom;
	recursoRandom = arreglo[numRand];
	
	return recursoRandom;
}