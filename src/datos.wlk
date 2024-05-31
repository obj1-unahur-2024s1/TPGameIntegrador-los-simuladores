import wollok.game.*
object abecedario {
	const property lista = new Dictionary()
	
	
	method inicializar(){
		lista.put("q",game.at(5,6))
		lista.put("w",game.at(7,6))
		lista.put("e",game.at(9,6))
		lista.put("r",game.at(11,6))
		lista.put("t",game.at(13,6))
		lista.put("y",game.at(15,6))
		lista.put("u",game.at(17,6))
		lista.put("i",game.at(19,6))
		lista.put("o",game.at(21,6))
		lista.put("p",game.at(23,6))
		
		lista.put("a",game.at(6,4))
		lista.put("s",game.at(8,4))
		lista.put("d",game.at(10,4))
		lista.put("f",game.at(12,4))
		lista.put("g",game.at(14,4))
		lista.put("h",game.at(16,4))
		lista.put("j",game.at(18,4))
		lista.put("k",game.at(20,4))
		lista.put("l",game.at(22,4))
		
		//lista.put("delete",game.at(5,2))
		lista.put("z",game.at(8,2))
		lista.put("x",game.at(10,2))
		lista.put("c",game.at(12,2))
		lista.put("v",game.at(14,2))
		lista.put("b",game.at(16,2))
		lista.put("n",game.at(18,2))
		lista.put("m",game.at(20,2))
		//lista.put("enter",game.at(22,2))
	}	
	
}