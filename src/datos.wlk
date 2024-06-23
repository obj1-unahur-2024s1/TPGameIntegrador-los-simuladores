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
	method esUnaPalabraValida(palabraAValidar)= self.listaDePalabrasConLaMismaInicial(palabraAValidar).contains(palabraAValidar)
	
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
		
		matrizPalabras.add( ["anole", "anoto", "anulo", "anote", "anota", "anoto", "anona", "anola", "anolo", "ansia", "anoas", "anjeo", 'abeto', "abeja", 
		'actor', 'aguas', 'agudo', 'alado', 'albas', 'altar', 'antes', 'atizo', 'avala', 'ayuda', "ansas", "ansie", "anude", "anura", "anuos", "anudo", 
		"anuda", "anual", "antro", "antis", "aneja", "alojo", "aloja", "aludo", "alude", "apoye", "apoya", "apoyo", "amida", "ataja", "almas", "animo", 
		"aocar", "anear", "aneja", "anego", "anega", "andel", "andas", "andar", "aneto", "anime", "anima", "anido", "anide", "anida", "anexa", "angra", 
		"anglo", "angla", "anexo", "anexe", "anuro", "aojar", "aojad", "andad", "apilo", "apile", "apila", "apero", "apera", "apere", "apipo", "apita", 
		"apeno", "apola", "aposo", "apodo", "aposa", "apose", "apolo", "apode", "apoda", "apoco", "apnea", "apena", "apelo", "apele", "apela", "apega", 
		"apego", "apago", "apaga", "apear", "andan", "alzar", "alzan", "amado", "alpes", "altos", "altas", "amasa", "amaso", "amase", "ancla", "ancho", 
		"ancha", "ambos", "ambas", "amina", "amigo", "amiga", "asilo", "asila", "asile", "asomo", "asome", "asoma", "asnos", "asado", "ateza", "atezo", 
		"atlas", "atino", "atine", "atina", "asumo", "asuma", "asume", "astil", "atapo", "atapa", "atape", "atajo", "ataja", "ataje", "atado", "atada", 
		"ataco", "ataca", "artes", "arcos", "arcas", "arduo", "ardor", "apuro", "apure", "apura", "aptos", "aptas", "aroma", "armar", "armas", "arman", 
		"argot", "acoso", "acosa", "acose", "acabo", "acabe", "acaba", "abuso", "abuse", "abusa", "acota", "acote", "acoto", "adoro", "adora", "adore", 
		"acudo", "acude", "acuda", "actos", "actos", "actas", "acuso", "acusa", "acuse", "abril", "aires", "albur", "ahoga", "aguda"] )
		
		// Palabras que comienzan con B
		
		matrizPalabras.add( ['babas', 'bacas', 'bache', 'bajar', 'bajes', 'balas', "babea", "bailo", "baile", "baila", "bajas", "bajos", "bajar", "balde", 
		"banal", "banco", 'bicho', 'bizco', 'bocas', "bobas", 'bozal', 'buena', 'bueno', 'busca', "bocho", "boina", "bolas", "bolos", "bollo", "bolsa", 
		"bombo", "bomba", "borde", "botes", "botas", "boxea", "boxeo", "barba", "bardo", "bares", "bases", "basta", "basto", "baste", "barro", "barre", 
		"batir", "bazos", "baten", "bebas", "becas", "becar", "beben", "beber", "belga", "bicis", "bucal", "bucea", "bufet", "burro", "burra", "busco", 
		"busca", "bravo", "brava", "bruja", "bruto", "bruta", "broma", "brasa", "braza", "brisa", "blusa", "bledo", "bulto"] )
		
		// Palabras que comienzan con C
		
		matrizPalabras.add( ['cabra', 'cajas', 'calar', 'calas', 'calca', 'calla', 'calle', 'calma', 'camba', 'campo', 'canas', 'canto', 'capto', 'caras', 
		'carro', 'carta', 'casas', 'casos', 'catar', 'cejas', 'cenas', 'cepas', 'cerca', 'cerco', 'cerda', 'cerdo', 'cesta', 'cesto', 'chile', 'china', 
		'chino', 'ciego', 'cinco', 'cines', 'citas', 'clara', 'claro', 'clase', 'clavo', 'cocer', 'colas', 'colon', 'comer', 'coral', 'corea', 'corro', 
		'corta', 'corte', 'corto', 'cosas', 'coser', 'costa', 'costo', 'credo', 'cruda', 'crudo', 'culta', 'culto', 'curar', "cabal", "caber", "cacho", 
		"cacao", "cabro", "cable", "caigo", "caiga", "caler", "callo", "calmo", "calme", "calza", "calzo", "calvo", "calva", "camas", "campo", "canal", 
		"canje", "canta", "cante", "capaz", "capas", "capos", "capto", "capta", "capte", "cargo", "caros", "carga", "carta", "casas", "casta", "casto", 
		"cavar", "coche", "coima", "cojos", "cojas", "comas", "comes", "copas", "cobra", "cobro", "cobre", "color", "copio", "copia", "copie", "comer", 
		"coreo", "corra", "corre", "corro", "corno", "cubos", "cucha", "cunas", "cuota", "curar", "curas", "curen", "curso", "curro", "curva", "curvo"] )
		
		// Palabras que comienzan con D
		
		matrizPalabras.add(  ['dadas', 'dados', 'dagas', 'datos', 'deber', 'decir', 'dedos', 'dejar', 'dejes', 'denso', 'dices', 'divas', 'divos', 'doble', 
		'dotes', 'dunas', 'duras', 'dures', 'duros', "daban", "damas", "dardo", "danza", "dance", "datos", "dedos", "densa", "desde", "deben", "dejas", 
		"decae", "dejad", "diana", "dicho", "digan", "dicta", "dicto", "dicte", "dobla", "doblo", "doces", "domar", "donen", "donar", "donos", "donas", 
		"dosis", "doler", "dolor", "dorar", "dogma", "durar", "droga", "drena", "dreno", "drene"] )
		
		// Palabras que comienzan con E
		
		matrizPalabras.add( ['echar', 'echas', 'edito', 'elevo', 'ellas', 'ellos', 'emulo', 'enoje', 'enojo', 'entre', 'estar',"error", "erizo", "eriza", 
		"errar", "eruto", "etano", "etilo", "etnia", "etapa", "estoy", "estad", "edema", "edito", "edita", "edite", "educo", "educa", 
		"eludo", "elude", "eluda", "elige", "eleva", "eleve", "evada", "evado", "evade", "evito", "evite", "evita", "evoco", "evoca", 
		"ebrio", "ebria", "enana", "enano", "enema", "entra", "entro", "entes", "emana", "emule", "emula", "emano", "emane"	] )
		
		// Palabras que comienzan con F
		
		matrizPalabras.add( ['fallo', 'falta', 'falte', 'falto', 'feria', 'fetas', 'fetos', 'fijas', 'fijos', 'filas', 'filos', 'finca', 'forma', 
		'frase', 'fuera', "facto", "fajos", "falso", "falsa", "fases", "fatal", "falaz", "farsa", "feces", "fecha", "feroz", "feraz", "fecal", 
		"fijar", "fiaca", "firmo", "firma", "firme", "fobia", "fondo", "forme", "formo", "fotos", "forja", "forjo", "focas", "fusil", "fuese", 
		"furto", "fumas", "fumar", "fumen", "fuere", "fugaz", "fumes", "frito", "frita", "frega", "frego", "fruto", "flaco", "flaca", "flema", 
		"flete", "flora", "fluir", "fluya", "fluye", "fluyo", "flama", "flujo", "floja", "fideo", "fiado"])
		
		// Palabras que comienzan con G
		
		matrizPalabras.add( ['gafas', 'galas', "galgo", 'ganas', 'ganes', 'gases', 'gasta', 'gasto', 'gesta', 'giras', 'gires', 'giros', 'gorda', 
		'gordo', 'gorra', 'gorro', 'grave', 'grita', 'grite', 'grito', 'gusta', "ganar", "ganes", "ganso", "gaste", "gansa", "gemir", 
		"genio", "genia", "gatea", "gateo", "gatee", "globo", "gozar", "giras", "giros", "gires", "goteo", "gotea", "gotee", "grasa", 
		"groso", "grosa", "grito", "grita", "grite", "graba", "grabe", "grabo", "grafo", "gramo", "grato", "grata", "grima", "guapa", 
		"guapo", "guiso", "guiar", "gusto", "gusta", "guste"
		] )
		
		// Palabras que comienzan con H
		
		matrizPalabras.add( ['haber', 'habla', 'hacer', 'halos', 'hasta', 'heces', 'hecho', 'hielo', 'hijas', 'hijos', 'hoyos', "hacen", "hacer", 
		"hacha", "harta", "harto", "hecha", "heces", "helio", "halla", "hablo", "harte", "harta", "hagan", "hertz", "hilar", "himno",
 		"hojas", "hobby", "honor", "horca", "horno", "hogar", "honra", "huele", "hueco", "huevo", "humos", "hotel", "hueco", "hueca", 
 		"hueso", "hurga"] )
		
		// Palabras que comienzan con I
		
		matrizPalabras.add( ['ideas', 'india', 'infla', 'infle', 'inflo', 'islas', "ideal", "idear", "igual", "iluso", "ilusa", "input", "incas", 
		"indio", "imita", "imito", "imite", "impar", "islam"] )
		
		// Palabras que comienzan con J
		
		matrizPalabras.add( ["jefas",'jefes', 'jerga', 'julio', 'junio', 'junta', 'junte', 'junto', "jalar", "jacte", "jacta", "jacto", "jalas",
		"jales", "jijea", "jijeo", "jijee", "jujuy", "juega", "juego", "jugad", "justa", "justo", "juzga", "juzgo", "jurad"] )
		
		// Palabras que comienzan con L
		
		matrizPalabras.add( ['letra', 'libra', 'libre', 'locas', 'locos', "labio", "lacio", "lacia", "ladeo", "lanzo", "lanza", "lapso", "labor", "larva", 
		"laten", "latir", "labia", "ladea", "lados", "larga", "lavar", "ladee", "lames", "lazos", "lavas", "legal", "lepra", "ligar", 
		"lejos", "legua", "leves", "leche", "lecho", "lento", "lenta", "leona", "licor", "limar", "liman", "limas", "limes", "lindo", 
		"linda", "llaga", "llamo", "llama", "llame", "lleve", "llevo", "lleva", "lleno", "llena", "llene", "lloro", "llora", "llore", 
		"lobby", "lobos", "lobas", "loros", "loras", "lince", "llano", "llana", "llave", "logra", "logro", "logre", "linos", "lisas",
 		"lisos", "lupus", "lucir", "luzco", "luego", "lunar", "lujos", "lycra", "lozas", "lugar"
		] )
		
		// Palabras que comienzan con M
		
		matrizPalabras.add( ['malas', 'malos', 'marca', 'migas', 'mayor', 'media', 'menos', 'mesas', 'meten', 'meter', 'metro', 'moler', 'monte', 
		'moral', 'morir', 'mudas', 'mudos', "mafia", "magra", "magro", "mamut", "macho", "mapas", "mambo", "magia", "malta", "mamar", 
		"manto", "mando", "manda", "mande", "mango", "manga", "marco", "mares", "matar", "marzo", "medio", "medid", "mecha", "menos", 
		"mensa", "menso", "mejor", "menor", "medir", "menta", "mente", "merma", "metro", "miedo", "mesmo", "miles", "milla", "memes", 
		"mimos", "mimar", "mimes", "minar", "mines", "mixta", "morfa", "molar", "misas", "misil", "mojar", "molde", "monta", "monte", 
		"monto", "motel", "momia", "morbo", "motos", "muela", "mujer", "mudas", "mudos", "musgo", "multa", "mutar", "museo", "murga", "mutuo"] )
		
		// Palabras que comienzan con N
		
		matrizPalabras.add( ['nacer', 'nadar', 'narra', 'narro', 'natas', 'naves', 'necio', 'notas', 'notes', 'nubes', "nadie", "natal", 
		"necia", "necio", "nadad", "nadan", "narco", "negar", "nafta", "negra", "negro", "nenes", "nenas", "nicho", "ninfa", "nieve",
		 "nitro", "nivel", "nubla", "nodos", "novia", "novio", "nutra", "norma", "nublo", "nunca", "nutro"] )
		
		// Palabras que comienzan con O
		
		matrizPalabras.add( ['obras', 'ocios', 'odios', 'ollas', 'ondas', 'opera', 'otras', 'otros', 'ovulo', "oasis", "obeso", 
		"ocaso", "ochos", "ocupe", "odias", "odios", "odiad", "ojito", "obran", "obren", "obvio", "ociad", "ocios", "odian", "odien", 
		"oigan", "ojota", "obesa", "obrar", "ocian", "ocupa", "ociar", "oigas", "ojear", "oliva", "onzas", "opera", "opine", "optar", 
		"ondea", "opaca", "opino", "opuse", "opaco", "opina", "orcas", "oruga", "orcos", "ostia", "ostra", "oveja", "oxido"] )
		
		// Palabras que comienzan con P
		
		matrizPalabras.add( ['palas', 'palos', 'parar', 'parir', 'parte', 'pasos', 'pecas', 'pedir', 'pelan', 'pelea', 'pelos', 
		'penas', 'peras', 'perra', 'perro', 'pesas', 'piden', 'pilas', 'pinto', 'pitar', 'pocas', 'pocos', 'poder', 'pueda', 'puede', 
		"paces", "pagan", "palma", "panco", "panel", "pagar", "pagos", "palta", "padre", "pagad", "palmo", "papel", "parad", "parca", 
		"parto", "parta", "parte", "pasad", "pardo", "prado", "pasan", "papas", "paran", "pasto", "pauto", "pavos", "pauta", "patas", 
		"pudor", "pavas", "peces", "pegos", "pegar", "pelea", "penal", "pides", "pidas", "pelar", "peles", "pelos", "peina", "perro", 
		"perra", "pesar", "perla", "pesas", "pesan", "pesen", "pibes", "pibas", "picar", "picad", "pedir", "pieza", "piano", "pinza", 
		"pillo", "piojo", "pilar", "piola", "pisar", "pisan", "pisen", "pisos", "pizza", "playa", "plaza", "pizca", "pleno", "plena", 
		"plega", "plego", "polen", "podio", "podal", "pluma", "pollo", "poeta", "podar", "polvo", "pobre", "poste", "posta", "posar", 
		"potes", "presa", "prono", "prona", "prosa", "pudre", "puede", "pulga", "pulir", "punto", "purga", "punir"] )
		
		// Palabras que comienzan con Q
		
		matrizPalabras.add( ['quedo', 'quema', 'queso', 'quiso', 'quita', 'quite', 'quito', "quejo", "queja", "quilo", "quemo", "queme", "queda"] )
		
		// Palabras que comienzan con R
		
		matrizPalabras.add( ['rasco', 'ratas', 'ratos', 'redes', 'reloj', 'remar', 'renos', 'renta', 'rubia', 'rubio', "rajar", "rasca", "rasco", 
		"rapto", "rapte", "rapta", "rapar", "rayos", "ramas", "reato", "reata", "regla", "recto", "rayas", "regar", "recio", "regia", "regio", "reina", 
		"reojo", "resma", "rayar", "resta", "resto", "reste", "retos", "retas", "retes", "ricos", "ricas", "rifar", "rigor", "rifas", "riega", "rimas", 
		"ritmo", "rizar", "robar", "rubro", "robot", "rimar", "rocas", "roete", "rojos", "rojas", "rodeo", "roces", "rolar", "rompe", "rompo", "rompa", 
		"ronca", "romas", "rosas", "rosca", "rublo", "rueda", "rugby", "rigor", "rugir", "rumbo", "rumor", "rural"] )
		
		// Palabras que comienzan con S
		
		matrizPalabras.add( ['saber', 'sabio', 'sabor', 'sacar', 'salir', 'sanar', 'secar', 'selva', 'seria', 'serie', 'serio', 'siete', 'sigue', 
		'sobar', 'sobre', 'sonar', 'sopas', 'sorda', 'sordo', 'subir', 'sucio', "salvo", "salva", "salve", "sanar", "sardo", "sarda", "sacro", "sedar", 
		"serbo", "senda", "sello", "selva", "senil", "serba", "serra", "sesga", "sesgo", "setas", "siete", "sigla", "siglo", "sexta", "sexto", "siria",
		 "sirio", "sismo", "sitio", "sirve", "sirvo", "sirva", "sobre", "sopla", "salsa", "sonsa", "sonso", "sopla", "soeza", "subir", "sordo", "sorda",
		  "sucia", "sucio", "subte", "sufra", "suizo", "sufro", "sufre", "suena", "sueno", "sueca", "sueco", "sudar", "sudor", "suyas", "suyos"] )
		
		// Palabras que comienzan con T
		
		matrizPalabras.add( ['tabla', 'tacos', 'tanta', 'tanto', 'tapas', 'tarde', 'tazas', 'tener', 'tenga', 'tenis', 'terca', 'terco', 'terso', 
		'texas', 'texto', 'tiene', 'tipas', 'tipos', 'tiras', 'todas', 'todos', 'tomas', 'tonal', 'tonos', 'tonta', 'tonto', 'toque', 'torpe', 'trata', 
		'trece', 'trote', "talco", "tanto", "tanda", "tabla", "tallo", "talla", "tango", "tarot", "tapiz", "tarde", "tapar", "tapas", "tarta", "taxis", 
		"tecla", "techo", "tejar", "tejer", "telar", "tengo", "tenga", "tenso", "tensa", "tenis", "tesar", "temer", "temes", "temas", "tigre", "tiene", 
		"tildo", "tilda", "tilde", "tibio", "tibia", "tesis", "tipas", "tipos", "tiros", "tocar", "tocas", "tocad", "toldo", "tomen", "turco", "turca",
		 "tonto", "tonta", "torpe", "tosta", "tosen", "tosco", "torre", "tosca", "trago", "trabo", "traba", "trabe", "traga", "trapo", "trepa", "trepo", 
		 "trepe", "tramo", "trama", "trigo", "tuyas", "tuyos", "tunda", "tumor", "turro", "turra", "tutor", "turno"] )
		
		// Palabras que comienzan con U
		
		matrizPalabras.add( ["ubico", "usado", "usada", "ulula", "ululo", "ulule", "urnas", "usase", "usara", "urgir"] )
		
		// Palabras que comienzan con V
		
		matrizPalabras.add( ['vacas', 'vagas', 'vagos', 'valer', 'valor', 'veces', 'vedas', 'velas', 'vemos', 'venas', 
		'venga', 'venir', 'verde', 'verso', 'viera', 'vigas', 'vinos', 'vista', 'vivir', 'vocal', 'volar', 'votar', "valer", 
		"vanos", "viaje", "vapor", "vasta", "vasto", "vagos", "vagas", "vagan", "vagad", "vacua", "vence", "venta", "venir", 
		"velas", "vendo", "video", "vicie", "verbo", "viejo", "vieja", "vigor", "visto", "vista", "viuda", "virgo", "vivaz", 
		"viudo", "voces", "vives", "vuele", "vuelo", "vocea"] )
		
		// Palabras que comienzan con Y
		
		matrizPalabras.add( ['yendo', 'yenes', 'yogur', "yates", "yerba", "yuyos", "yerno"] )
		
		// Palabras que comienzan con Z
		
		matrizPalabras.add( ['zonas', 'zorra', 'zorro', 'zurdo', "zafir", "zurda"] )
		
	}
}

// Diccionario que mapea cada número de celda con una coordenada "x" de una letra del teclado: así, las 5 letras del tablero quedan "por encima" de las letras "x" a "n" del teclado
object posicionesCeldasDelTablero{
	
	const property posiciones = new Dictionary()
	
	method initialize(){
			
		posiciones.put(0, [game.at(10,20),game.at(12,20),game.at(14,20),game.at(16,20),game.at(18,20)] )
		posiciones.put(1, [game.at(10,18),game.at(12,18),game.at(14,18),game.at(16,18),game.at(18,18)] )
		posiciones.put(2, [game.at(10,16),game.at(12,16),game.at(14,16),game.at(16,16),game.at(18,16)] )
		posiciones.put(3, [game.at(10,14),game.at(12,14),game.at(14,14),game.at(16,14),game.at(18,14)] )
		posiciones.put(4, [game.at(10,12),game.at(12,12),game.at(14,12),game.at(16,12),game.at(18,12)] )
		posiciones.put(5, [game.at(10,10),game.at(12,10),game.at(14,10),game.at(16,10),game.at(18,10)] )
			
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
		
		lista.put("Delete",game.at(5,2))
		lista.put("z",game.at(8,2))
		lista.put("x",game.at(10,2))
		lista.put("c",game.at(12,2))
		lista.put("v",game.at(14,2))
		lista.put("b",game.at(16,2))
		lista.put("n",game.at(18,2))
		lista.put("m",game.at(20,2))
		lista.put("Enter",game.at(23,2))
	}	
	
}