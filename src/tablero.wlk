import juego.*
import teclado.*
import wollok.game.*
import datos.*
import componentes.*
import utilidades.*

object tablero{
	
	const intentoActual = []
	
	// La palabra a adivinar
	var palabraAAdivinar = ""
	
	method initialize(){
		self.nuevaPalabraAAdivinar()	
		self.agregarCeldasAlTablero()
	}
	
	// Crea una nueva palabra a adivinar
	method nuevaPalabraAAdivinar(){
		palabraAAdivinar = palabrasValidas.palabraAleatoria()
	}
	
	/**			MÉTODOS PARA LOS ESTADOS		 */
	
	method teclaPresionada(tecla){
		if( intentoActual.size() < 5 ){
			
			intentoActual.add(tecla)
			
			// Añade visualmente la tecla presionada al tablero
			self.mostrarLetraEnElTablero(tecla)
		}
	}
	
	// Informa el estado de una letra dada
	method informarEstado(letra, posicion){
		
		// Se fija si coincide en la posición  
	    if(palabraAAdivinar.charAt(posicion) == letra){
	        return "Correcto"
	    }
	    
	    // Se fija si por lo menos la tiene
	    else if (palabraAAdivinar.contains(letra)){
	        return "Errado"
	    }
	    
	    // No la tiene
	    else{
	        return "Inexistente"
	    }
    }
	
	// Devuelve el estado de cada letra en comparación con la original. Por ejemplo, si es "cinco" y le mandás "cinco", devuelve "Correcto" 5 veces
    method estadoIndividualDeCadaLetra(unaPalabra){
    	
    	// (0..4) genera 5 números del 0 al 4
        return (0..4).map({
        	
        		// Mapea cada letra con su estado
            	posicion => self.informarEstado( unaPalabra.charAt(posicion), posicion )
        })
    }

	method actualizarEstadoDeCadaCeldaDelTablero(){
		
	}
	
	/**			MÉTODOS VISUALES		*/
	
	// Agrega visualmente las celdas al tablero, con un estado "Inicial"
	method agregarCeldasAlTablero(){
		
		self.agregarHileraDe5CeldasAlTablero(20)
		self.agregarHileraDe5CeldasAlTablero(18)
		self.agregarHileraDe5CeldasAlTablero(16)
		self.agregarHileraDe5CeldasAlTablero(14)
		self.agregarHileraDe5CeldasAlTablero(12)
		self.agregarHileraDe5CeldasAlTablero(10)
	}
	
	// Agrega una hilera de 5 celdas con estado "Inicial" horizontalmente en la coordenada "y" dada, ya que van una abajo de la otra, así que todas tienen la misma coordenada "x" inicial
	method agregarHileraDe5CeldasAlTablero(coordenadaYInicial){
		
		// (0..4) genera 5 números del 0 al 4
		(0..4).forEach({
			numero => self.agregarCeldaNro(numero, coordenadaYInicial)
		})
	}
	
	// Agrega una de las 5 celdas, respetando el número que le corresponde y la coordenada "y" de partida
	method agregarCeldaNro(numeroDeCelda, coordenadaYDePartida){
		
		// Devuelve la coordenada X que le corresponde al número de celda
		const cordX = posicionesCeldasDelTablero.coordenadaXAsociadaALaCeldaNro(numeroDeCelda)
		
		const celdaAAgregar = new CeldaEstado(ruta = "celdasPalabra/celda", position = game.at(cordX, coordenadaYDePartida), id = "celda" + cordX.toString() + coordenadaYDePartida.toString() )
		
		game.addVisual(celdaAAgregar)
	}
	
	// Añade visualmente la celda al tablero
	method mostrarLetraEnElTablero(letra){
		
		// La coordenada "y" está dada por la cantidad de intentos restantes
		const cordY = posicionesCeldasDelTablero.coordenadaYAsociadaALaCeldaNro( juego.intentosRestantes() )
		
		// La coordenada "x" está dada por el número de celda, que es el tamaño del intento actual
		const cordX = posicionesCeldasDelTablero.coordenadaXAsociadaALaCeldaNro( intentoActual.size() )
		
		const letraAAgregar = new CeldaLetra(letra = letra, position = game.at(cordX, cordY), id = letra)
	
		game.addVisual(letraAAgregar)
	}
}
