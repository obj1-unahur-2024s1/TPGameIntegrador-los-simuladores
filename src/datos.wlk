import wollok.game.*

// se encarga de tener todas las palabras validas y la validacion de palabras
object palabrasValidas{
	
	//contiene las palabras validas en listas segun su inicial, para una busqueda mas rapida
	const matrizPalabras = []
	//contiene los indices de las listas de palabras que empiezan con la letra correspondiente
	const posicionesPalabras = new Dictionary() 
	
	method initialize(){
		self.inicializarPosicionesPalabras()
		self.inicializarMatrizPalabras()
	}
	
	//devuelve una palabra al azar
	method palabraAleatoria()= matrizPalabras.anyOne().anyOne()
	
	// devuelve el indice de la lista de palabras que empiezan con la misma letra que palabra
	method indiceDelaInicialDeLaPalabra(palabra)= posicionesPalabras.get( palabra.charAt(0) )
	
	
	//devuelve la lista de palabras que empiezan con la misma letra que palabraAValidar
	method listaDePalabrasConLaMismaInicial(palabraAValidar)= matrizPalabras.get(self.indiceDelaInicialDeLaPalabra(palabraAValidar) )
	
	//devuelve true si palabraAValidar existe en la base de datos
	method validarPalabra(palabraAValidar)= self.listaDePalabrasConLaMismaInicial(palabraAValidar).contains(palabraAValidar)
	
	//inicializa los valores de posicionesPalabras
	method inicializarPosicionesPalabras(){
		posicionesPalabras.put("q",16)
		posicionesPalabras.put("w",22)
		posicionesPalabras.put("e",4)
		posicionesPalabras.put("r",17)
		posicionesPalabras.put("t",19)
		posicionesPalabras.put("y",24)
		posicionesPalabras.put("u",20)
		posicionesPalabras.put("i",8)
		posicionesPalabras.put("o",14)
		posicionesPalabras.put("p",15)
		posicionesPalabras.put("a",0)
		posicionesPalabras.put("s",18)
		posicionesPalabras.put("d",3)
		posicionesPalabras.put("f",5)
		posicionesPalabras.put("g",6)
		posicionesPalabras.put("h",7)
		posicionesPalabras.put("j",9)
		posicionesPalabras.put("k",10)
		posicionesPalabras.put("l",11)
		posicionesPalabras.put("z",25)
		posicionesPalabras.put("x",23)
		posicionesPalabras.put("c",2)
		posicionesPalabras.put("v",21)
		posicionesPalabras.put("b",1)
		posicionesPalabras.put("n",13)
		posicionesPalabras.put("m",12)
	}
	
	//inicializa los valores de matrizPalabras
	method inicializarMatrizPalabras(){
		//aca hay que poner las listas de las palabras
	}
}

// contiene las posiciones de las teclas en el teclado segun que letra represente
object posicionesTeclas {
	const property lista = new Dictionary()
	
	method initialize(){
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