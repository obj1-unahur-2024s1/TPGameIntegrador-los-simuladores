import juego.*
import teclado.*
import wollok.game.*
import datos.*
import componentes.*
import utilidades.*

object tablero{
	
	const intentoActual = []
	
	// La palabra a adivinar
	var property palabraAAdivinar = ""
	
	method initialize(){
		self.nuevaPalabraAAdivinar()	
		self.agregarCeldasAlTablero()
	}
	
	// Crea una nueva palabra a adivinar
	method nuevaPalabraAAdivinar(){
		palabraAAdivinar = palabrasValidas.palabraAleatoria()
	}
	
	/**			METODOS PARA LAS TECLAS		 */
	
	method teclaPresionada(tecla){
		if( intentoActual.size() < 5 ){
			
			intentoActual.add(tecla)
			
			// Añade visualmente la tecla presionada al tablero
			self.mostrarLetraEnElTablero(tecla)
		}
	}
	
	
	// Maneja lo que sucede cuando se aprieta la tecla de borrar
	method deletePresionado(){
		
		// Verifica que haya una letra en la pantalla
		if( not intentoActual.isEmpty() ){
			
			// Remueve visualmente la última letra
			self.quitarUltimaLetraDelTablero()
			
			// Lo saca del intento actual
			intentoActual.remove( intentoActual.last() )  
		}
	}
	
	// Maneja lo que sucede cuando se aprieta la tecla enter
	method enterPresionado(){
		
		// Valida que tenga 5 letras y que esté en la base de datos
		//if( intentoActual.size() == 5 and palabrasValidas.esUnaPalabraValida( self.pasarAPalabra(intentoActual) ) ){
		if( intentoActual.size() == 5 ){	
			
			// Guarda los estados en una variable
			const estadosIndividualesDeCadaLetra = self.estadoIndividualDeCadaLetra( self.pasarAPalabra(intentoActual) )
						
			// Actualiza el tablero y teclado en base a eso
			self.actualizarEstadoDeCadaCeldaDelJuego( estadosIndividualesDeCadaLetra )
			
			// Delega al teclado la responsabilidad de actualizar las teclas del teclado
			teclado.actualizarCeldasCorrespondientes(intentoActual, estadosIndividualesDeCadaLetra)
			
			// Delega al juego la responsabilidad de verificar la victoria
			juego.verificarSiGano(estadosIndividualesDeCadaLetra)
			
			// Delega al juego que haya un intento menos
			juego.restarIntento()
			
			intentoActual.clear()
		}
	}
	
	method espacioPresionado(){
		instrucciones.mostrar()
	}
	
	/** METODOS PARA LOS ESTADOS */
	
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
		const cordX = posicionesCeldasDelTablero.coordenadaXAsociadaALaCeldaNro( intentoActual.size() - 1)
		
		const letraAAgregar = new CeldaLetra(letra = letra, position = game.at(cordX, cordY), id = letra)
	
		game.addVisual(letraAAgregar)
	}
	
	// Remueve visualmente la última letra del tablero
	method quitarUltimaLetraDelTablero(){
		
		// La coordenada "y" está dada por la cantidad de intentos restantes
		const cordY = posicionesCeldasDelTablero.coordenadaYAsociadaALaCeldaNro( juego.intentosRestantes() )
		
		// La coordenada "x" está dada por el número de celda, que es el tamaño del intento actual
		const cordX = posicionesCeldasDelTablero.coordenadaXAsociadaALaCeldaNro( intentoActual.size() - 1)
		
		// getObjects devuelve la celda y la tecla en las coordenadas dadas, get(1) devuelve la letra
		const celdaARemover = game.getObjectsIn( game.at( cordX, cordY ) ).get(1)
		
		game.removeVisual(celdaARemover)
		
	}
	
	// Actualiza el estado de una celda dado el número de celda, la fila en la que está (coordenadaY) y su nuevo estado
	method actualizarEstadoDeUnaCelda(numeroDeCelda, coordenadaY, nuevoEstado){
				
		// Devuelve la coordenada X que le corresponde al número de celda
		const coordenadaX = posicionesCeldasDelTablero.coordenadaXAsociadaALaCeldaNro(numeroDeCelda)
		
		// getObjects devuelve la celda y la tecla en las coordenadas dadas, get(0) devuelve la celda
		const celdaAModificar = game.getObjectsIn( game.at( coordenadaX, coordenadaY ) ).get(0)
		
		if(nuevoEstado == "Correcto"){
			celdaAModificar.posicionCorrecta()
		}
		else if( nuevoEstado == "Errado" ){
			celdaAModificar.posicionEquivocada()
		}
		else{
			celdaAModificar.noLaContiene()
		}
	}
	
	// Actualiza el estado de las celdas en base a los estados de cada letra
	method actualizarEstadoDeCadaCeldaDelJuego(estadosIndividuales){
				
		// La coordenada "y" está dada por la cantidad de intentos restantes
		const cordY = posicionesCeldasDelTablero.coordenadaYAsociadaALaCeldaNro( juego.intentosRestantes() )
		
		// Primer argumento es el número de celda, segundo la fila, tercero el estado que le corresponde
		self.actualizarEstadoDeUnaCelda(0, cordY, estadosIndividuales.get( 0 ) )
		self.actualizarEstadoDeUnaCelda(1, cordY, estadosIndividuales.get( 1 ) )
		self.actualizarEstadoDeUnaCelda(2, cordY, estadosIndividuales.get( 2 ) )
		self.actualizarEstadoDeUnaCelda(3, cordY, estadosIndividuales.get( 3 ) )
		self.actualizarEstadoDeUnaCelda(4, cordY, estadosIndividuales.get( 4 ) )
	}
	
	/**			Métodos auxiliares		 */
	
	// Sé que es reinventar la rueda, pero .toString() no funcionaba por algún motivo
	method pasarAPalabra(lista){
		var palabra = ""
		
		lista.forEach({
			letra => palabra = palabra + letra
		})
		
		return palabra
	}
}

object instrucciones{
	
	// Controla si están en pantalla
	var estanEnPantalla = false
	
	method position() = game.at(5, 3)
		
	method image() = "instrucciones.png"
	
	method mostrar(){
		
		// Las muestra si no están en pantalla
		if (not estanEnPantalla){
			
			// cambia su estado para evitar que se vuelvan a ver
			estanEnPantalla = not estanEnPantalla
			
			game.addVisual(self)
		}
		
		// Las saca si están en pantalla
		else{
			game.removeVisual(self)
			
			// cambia su estado para evitar que se vuelvan a ver
			estanEnPantalla = not estanEnPantalla
		}
	}
}