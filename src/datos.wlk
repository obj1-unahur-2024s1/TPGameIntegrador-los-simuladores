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
		// No están las letras "k", "w" ni "x"
		
		// Posiciones 0 - 9
		posicionesPalabras.put("a",0)
		posicionesPalabras.put("b",1)
		posicionesPalabras.put("c",2)
		posicionesPalabras.put("d",3)
		posicionesPalabras.put("e",4)
		posicionesPalabras.put("f",5)
		posicionesPalabras.put("g",6)
		posicionesPalabras.put("h",7)
		posicionesPalabras.put("i",8)
		posicionesPalabras.put("j",9)
		
		// Posiciones 10-19, excepto la "k" porque ninguna palabra empieza con "k" en la lista
		posicionesPalabras.put("l",10)
		posicionesPalabras.put("m",11)
		posicionesPalabras.put("n",12)
		posicionesPalabras.put("o",13)
		posicionesPalabras.put("p",14)
		posicionesPalabras.put("q",15)
		posicionesPalabras.put("r",16)
		posicionesPalabras.put("s",17)
		posicionesPalabras.put("t",18)
		posicionesPalabras.put("u",19)
		
		// Posiciones 20-22, saltando la "w" y la "x" 
		posicionesPalabras.put("v",20)
		posicionesPalabras.put("y",21)
		posicionesPalabras.put("z",22)
	}
	
	//inicializa los valores de matrizPalabras
	method inicializarMatrizPalabras(){
		
		// Palabras que comienzan con A
		
		matrizPalabras.add( ["acota", "acote", "acoto", "adoro", "adora", "adore", "acudo", "acude", "acuda", "actos", "actas", "acuso", "acusa", "abril", "aires", "ahoga", "aguda"] )
		
		// Palabras que comienzan con B
		
		matrizPalabras.add( ["belga", "bicis", "bucal", "bucea", "bufet", "burro", "burra", "busco", "busca", "bravo", "brava", "bruja", "bruto", "bruta", "broma", "brisa", "blusa", "bledo", "bulto"] )
		
		// Palabras que comienzan con C
		
		matrizPalabras.add( ["corre", "corro", "corno", "cubos", "cucha", "cunas", "cuota", "curar", "curas", "curen", "curso", "curro", "curva", "curvo"] )
		
		// Palabras que comienzan con D
		
		matrizPalabras.add(  ["diana", "dicho", "digan", "dicta", "dicto", "dicte", "dobla", "doblo", "domar", "donar", "donos", "donas", "dosis", "doler", "dolor", "dorar", "dogma", "durar", "droga", "drena", "dreno", "drene"] )
		
		// Palabras que comienzan con E
		
		matrizPalabras.add( ['echar', 'echas', 'edito', 'elevo', 'ellas', 'ellos', 'emulo', 'enoje', 'enojo', 'entre', 'estar',"error", "erizo", "eriza", "errar", "eruto", "etnia", "etapa", "estoy"] )
		
		// Palabras que comienzan con F
		
		matrizPalabras.add( ['fallo', 'falta', 'falte', 'falto', 'feria', 'fetas', 'fetos', 'fijas', 'fijos', 'filas', 'filos', 'finca', 'forma', 'frase', 'fuera', "facto", "fajos", "falso", "falsa", "fases", "fatal", "falaz"] )
		
		// Palabras que comienzan con G
		
		matrizPalabras.add( ["ganso", "giros", "gafas", "grasa", "groso", "grosa", "grito", "grita", "graba", "grabo", "grafo", "gramo", "grato", "grata", "guapa", "guapo", "guiso", "guiar", "gusto", "gusta", "guste"] )
		
		// Palabras que comienzan con H
		
		matrizPalabras.add( ["harta", "hagan", "haber", "hilar", "himno", "hojas", "hobby", "honor", "horca", "horno", "hogar", "honra", "huele", "hueco", "huevo", "humos", "hotel", "hueco", "hueca", "hueso", "hurga"] )
		
		// Palabras que comienzan con I
		
		matrizPalabras.add( ['ideas', 'india', 'infla', 'infle', 'inflo', 'islas', "ideal", "idear", "igual", "iluso", "ilusa", "input", "incas", "indio", "imita", "imito", "imite", "impar", "islam"] )
		
		// Palabras que comienzan con J
		
		matrizPalabras.add( ['jefas','jefes', 'jerga', 'julio', 'junio', 'junta', 'junte', 'junto', "jalar", "jujuy", "juega", "juego", "justa", "justo", "juzga", "juzgo"] )
		
		// Palabras que comienzan con L
		
		matrizPalabras.add( ["lleva", "lleno", "llena", "llene", "lloro", "llora", "llore", "lobby", "lobos", "lobas", "loros", "loras", "lince", "llano", "llana", "llave", "logra", "logro", "logre", "linos", "lisas", "lisos"] )
		
		// Palabras que comienzan con M
		
		matrizPalabras.add( ["malos", "misas", "misil", "mojar", "molde", "monta", "monte", "monto", "motel", "momia", "morbo", "motos", "muela", "mujer", "mudas", "mudos", "musgo", "multa", "mutar", "museo", "murga", "mutuo"] )
		
		// Palabras que comienzan con N
		
		matrizPalabras.add( ['nacer', 'nadar', 'narra', 'narro', 'nieve', 'naves', 'necio', 'notas', 'notes', 'nubes', "nadie", "norma", "necia", "necio", "nunca", "nadan", "narco", "negar", "nafta", "negra", "negro", "nenes"] )
		
		// Palabras que comienzan con O
		
		matrizPalabras.add( ['obras', 'ollas', 'ondas', 'otras', 'otros', "oasis", "ocaso", "obvio", "odian", "ojota", "obrar", "ocupa", "ociar","oliva", "opino", "optar", "opaca", "opina", "opuse", "opaco", "orcas", "oruga", "orcos", "ostia", "ostra", "oveja"] )
		
		// Palabras que comienzan con P
		
		matrizPalabras.add( ['palas', 'palos', 'parar', 'parir', 'parte', 'pasos', 'pecas', 'pedir', 'pelan', 'pelea', 'pelos', 'penas', 'peras', 'perra', 'perro', 'pesas', 'piden', 'pilas', 'pinto', 'pitar', 'pocas', 'pocos'] )
		
		// Palabras que comienzan con Q
		
		matrizPalabras.add( ['quedo', 'quema', 'queso', 'quiso', 'quita', 'quite', 'quito', "quejo", "queja", "quilo", "quemo", "queme", "queda"] )
		
		// Palabras que comienzan con R
		
		matrizPalabras.add( ['rasco', 'ratas', 'ratos', 'redes', 'reloj', 'remar', 'renos', 'renta', 'rubia', 'rubio', "rajar", "rasca", "rasco", "rapto", "rapar", "rayos", "ramas", "reato", "reata", "regla"] )
		
		// Palabras que comienzan con S
		
		matrizPalabras.add( ['saber', 'sabio', 'sabor', 'sacar', 'salir', 'sanar', 'secar', 'selva', 'seria', 'serie', 'serio', 'siete', 'sigue', 'sobre', 'sonar', 'sopas', 'sorda', 'sordo', 'subir', 'sucio', "salvo"] )
		
		// Palabras que comienzan con T
		
		matrizPalabras.add( ['tabla', 'tacos', 'tanta', 'tanto', 'tapas', 'tarde', 'tazas', 'tener', 'tenga', 'tenis', 'terca', 'terco', 'texto', 'tiene', 'tipas', 'tipos', 'tiras', 'todas', 'todos', 'tomas'] )
		
		// Palabras que comienzan con U
		
		matrizPalabras.add( ["ubico", "usado", "usada", "ulula", "ululo", "ulule", "urnas", "usase", "usara", "urgir"] )
		
		// Palabras que comienzan con V
		
		matrizPalabras.add( ['vacas', 'vagos', 'valer', 'valor', 'veces', 'velas', 'vemos', 'venas', 'venir', 'verde', 'verso', 'vigas', 'vinos', 'vista', 'vivir', 'vocal', 'volar', 'votar'] )
		
		// Palabras que comienzan con Y
		
		matrizPalabras.add( ['yendo', 'yenes', 'yogur', "yates", "yerba", "yuyos", "yerno"] )
		
		// Palabras que comienzan con Z
		
		matrizPalabras.add( ['zonas', 'zorra', 'zorro', 'zurdo', "zafir", "zurda"] )
		
	}
}

// Diccionario que mapea cada número de celda con una coordenada "x" de una letra del teclado: así, las 5 letras del tablero quedan "por encima" de las letras "x" a "n" del teclado
object posicionesCeldasDelTablero{
	
	// Asocia una coordenada "x" a cada celda de un intento
	const listaDeCoordenadasX = new Dictionary()
	
	// Asocia una coordenada "y" a cada celda de un intento
	const listaDeCoordenadasY = new Dictionary()
	
	method initialize(){
			
		self.inicializarCoordenadasX()
		
		self.inicializarCoordenadasY()
	}
	
	method inicializarCoordenadasX(){
		
		// Hace que las 6 primeras celdas del tablero queden por encima de la letra "x"
		listaDeCoordenadasX.put(0, 10)
		
		// Hace que las 6 segundas celdas del tablero queden por encima de la letra "c"
		listaDeCoordenadasX.put(1, 12)
		
		// Hace que las 6 terceras celdas del tablero queden por encima de la letra "v"
		listaDeCoordenadasX.put(2, 14)
		
		// Hace que las 6 cuartas celdas del tablero queden por encima de la letra "b"
		listaDeCoordenadasX.put(3, 16)
		
		// Hace que las 6 últimas celdas del tablero queden por encima de la letra "n"
		listaDeCoordenadasX.put(4, 18)
	}
	
	method inicializarCoordenadasY(){
		
		// Hace que el primero intento quede en la coordenada y = 20
		listaDeCoordenadasY.put(5, 20)
		
		// Hace que el segundo intento quede en la coordenada y = 18
		listaDeCoordenadasY.put(4, 18)
		
		// Hace que el tercer intento quede en la coordenada y = 16
		listaDeCoordenadasY.put(3, 16)
		
		// Hace que el cuarto intento quede en la coordenada y = 14
		listaDeCoordenadasY.put(2, 14)
		
		// Hace que el quinto intento quede en la coordenada y = 12
		listaDeCoordenadasY.put(1, 12)
		
		// Hace que el sexto intento quede en la coordenada y = 10
		listaDeCoordenadasY.put(0, 10)
	}
	
	// Getter para la coordenada "x" de la celda
	method coordenadaXAsociadaALaCeldaNro(numeroDeLetra) = listaDeCoordenadasX.get(numeroDeLetra)
	
	// Getter para la coordenada "y" de la celda
	method coordenadaYAsociadaALaCeldaNro(numeroDeIntento) = listaDeCoordenadasY.get(numeroDeIntento)
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