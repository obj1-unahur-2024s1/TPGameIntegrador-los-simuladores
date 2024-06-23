import juego.*
import teclado.*
import wollok.game.*
import datos.*
import componentes.*
import utilidades.*
import pantallas.*

object tablero inherits Componente{
	
	// indica el intento en el que se encuentra el jugador
	var numeroDeIntentoActual = 0
	
	// La palabra a adivinar
	var property palabraAAdivinar = null
	
	// indica si el jugador gano la partida
	var property gano = false
	
	override method resetearElementos(){
		super()
		numeroDeIntentoActual = 0
		gano = false
		self.nuevaPalabraAAdivinar()
	}
	
	method initialize(){
		self.nuevaPalabraAAdivinar()
		self.agregarIntentosAlTablero()
	}
	
	// Devuelve el intento en el que encuentra el jugador
	method intentoActual()= elementos.get(numeroDeIntentoActual)
	
	// Crea una nueva palabra a adivinar
	method nuevaPalabraAAdivinar(){
		palabraAAdivinar = palabrasValidas.palabraAleatoria()
	}
	
	/**			METODOS PARA LAS TECLAS		 */
	
	//Agrega la letra que fue presionada al intento actual 
	method teclaPresionada(tecla){
		if(numeroDeIntentoActual < 6 and not gano){
			self.intentoActual().escribir(tecla)
			
		}
	}
	
	// Borra la ultima letra del intento actual
	method deletePresionado(){
		if(numeroDeIntentoActual < 6 ){
			self.intentoActual().borrarUltimaLetra()
		}
	}
	
	// Se encarga de validar la palabra cuando el intento esta completo y a palabra es valida, y de verificar si gano
	method enterPresionado(){
		if(numeroDeIntentoActual < 6 and self.intentoActual().estaCompleto()){
			self.intentoActual().validarIntento(palabraAAdivinar)
			self.verificarSiGano()
			if(self.intentoActual().esValido()){
				numeroDeIntentoActual = numeroDeIntentoActual + 1
			}
		}
	}
	
	//verifica si el jugador gano. si gano, muestra la pantalla de ganar, sino, la de perder
	method verificarSiGano(){
		if(not gano and numeroDeIntentoActual == 5){
			game.schedule(1000, {juego.cambiarPantalla(pantallaPerdedor)}) 
		}else if(gano){
			game.schedule(1000, {juego.cambiarPantalla(pantallaGanador)})
		}
	}

	// Agrega los intentos a la lista de elementos
	method agregarIntentosAlTablero(){
		elementos.add(new Intento(numeroIntento = 0))
		elementos.add(new Intento(numeroIntento = 1))
		elementos.add(new Intento(numeroIntento = 2))
		elementos.add(new Intento(numeroIntento = 3))
		elementos.add(new Intento(numeroIntento = 4))
		elementos.add(new Intento(numeroIntento = 5))
	}

}

class CeldaIntento inherits Celda{
		
	const property celdaEstado = new CeldaEstado(position=position, ruta="celdasPalabra/celda")
	const celdaLetra = new CeldaLetra(letra="vacio", position = position)
	const property ordenEnIntento 
	
	method letraQueRepresenta()= celdaLetra.letra()
	
	
	method actualizarLetra(letra){
		celdaLetra.letra(letra)
	}
	
	method borrarLetra(){
		celdaLetra.resetear()
	}
	
	override method dibujar(){
		celdaEstado.dibujar()
		celdaLetra.dibujar()
	}
	override method image(){}
	
	override method resetear(){
		self.borrarLetra()
		celdaEstado.resetear()
	}
		
}

class Intento{
	
	const celdasIntento = []
	const numeroIntento
	var celdaIntentoActual = 0
	var palabraQueRepresenta = ""
	var property esValido = false
	const letrasMarcadas = #{}
	
	method initialize(){
		posicionesCeldasDelTablero.posiciones().get(numeroIntento).forEach({
			posicion =>
			celdasIntento.add(new CeldaIntento(position = posicion, ordenEnIntento = celdasIntento.size()))
		})
	}
	
	method dibujar(){
		celdasIntento.forEach({
			celdaIntento => celdaIntento.dibujar()
		})
	}
	
	method resetear(){
		celdasIntento.forEach({ celda => celda.resetear()})
		celdaIntentoActual = 0
		palabraQueRepresenta = ""
		esValido = false
		letrasMarcadas.clear()
		
	}
	
	// Agregua la letra al intento
	method escribir(letra){
		if(celdaIntentoActual < 5){
			celdasIntento.get(celdaIntentoActual).actualizarLetra(letra)
			
			celdaIntentoActual = celdaIntentoActual + 1
			
			palabraQueRepresenta = palabraQueRepresenta.concat(letra)
		}
		
	}
	
	// Borra la ultima letra del intento
	method borrarUltimaLetra(){
		if(celdaIntentoActual > 0){
			celdaIntentoActual = celdaIntentoActual - 1
		}
		celdasIntento.get(celdaIntentoActual).borrarLetra()
		palabraQueRepresenta = palabraQueRepresenta.take(celdaIntentoActual)
	}
	
	
	// valida el intento
	method validarIntento(palabraCorrecta){
		if(not palabrasValidas.esUnaPalabraValida(palabraQueRepresenta)){
			self.mostrarQueLaPalabraNoEsValida()
		} else{
			self.verificarAciertos(palabraCorrecta)
			esValido = true
		}
	}
	
	//verifica si la palabra es la correcta, y si no es, actualiza las celdas estado de las letras correspondientes
	method verificarAciertos(palabraCorrecta){
			
		if(palabraQueRepresenta == palabraCorrecta){
			self.ponerTodasCorrectas()
			tablero.gano(true)
		}else {
			self.actualizarCeldasEstado(palabraCorrecta)
		}
	}
	
	//añade una letra al conjunto de marcadas
	method aniadirLetraMarcada(letra){
		letrasMarcadas.add(letra)
	}
	
	//indica si una letra ya fue marcada
	method esLetraMarcada(letra)= letrasMarcadas.contains(letra)
	
	// actualiza las celdas incorrectas anteriores de la misma letra que la celda correcta, para que muestren que son inexistentes
	method actualizarCeldasAnterioresIncorrectas(celdaCorrecta){
		if(self.existeCeldaRepetida(celdaCorrecta) ){
			self.celdaRepetida(celdaCorrecta).celdaEstado().noLaContiene()
		}
	}
	
	//devuelve si hay una celda repetida de la misma letra que la celda correcta
	method existeCeldaRepetida(celdaCorrecta)= celdasIntento.any({
			celda => celda.letraQueRepresenta() == celdaCorrecta.letraQueRepresenta() and 
			celda.ordenEnIntento() != celdaCorrecta.ordenEnIntento()
			})

	//devuelve una celda repetida de la misma letra que la celda correcta
	method celdaRepetida(celdaCorrecta) = celdasIntento.find({
			celda => celda.letraQueRepresenta() == celdaCorrecta.letraQueRepresenta() and 
			celda.ordenEnIntento() != celdaCorrecta.ordenEnIntento() 
			})
	
	// actualiza las celdas estado de las letras correspondientes
	method actualizarCeldasEstado(palabraCorrecta){
		
		celdasIntento.forEach({
			celda => 
			const letra = celda.letraQueRepresenta().toString()
			
			// La letra esta en la posicion correcta
			if( letra == palabraCorrecta.charAt(celda.ordenEnIntento() ) ){
				self.aniadirLetraMarcada(letra)
				self.actualizarCeldasAnterioresIncorrectas(celda)
				celda.celdaEstado().posicionCorrecta()
				teclado.teclaQueRepresentaALaLetra(letra).celdaEstado().posicionCorrecta()
			}
			
			// La letra esta en la posicion incorrecta
			else if( palabraCorrecta.contains( letra ) and not self.esLetraMarcada(letra) ){
				self.aniadirLetraMarcada(letra)
				celda.celdaEstado().posicionEquivocada()
				teclado.teclaQueRepresentaALaLetra(letra).celdaEstado().posicionEquivocada()
			}
			
			//	La palabra a adivinar no contiene la letra
			else{
				celda.celdaEstado().noLaContiene()
				if(not self.esLetraMarcada(letra)){
					teclado.teclaQueRepresentaALaLetra(letra).celdaEstado().noLaContiene()
				}
			}
		})	
	}
	
	// Avisa que la palabra escrita no es valida
	method mostrarQueLaPalabraNoEsValida(){
		avisoPalabraNoValida.avisar()
	}
	
	//cambia a correctas todas las celdas del intento
	method ponerTodasCorrectas(){
		celdasIntento.forEach({
			celda => celda.celdaEstado().posicionCorrecta()
		})
	}
	
	//indica si el intento esta completo
	method estaCompleto()=	celdaIntentoActual == 5	
}

object avisoPalabraNoValida inherits Celda(position = game.at(11, 22)){
	override method image() ="avisoPalabraNoValida.png"
 	override method resetear(){}
 	
 	method avisar(){
 		self.dibujar()
		game.schedule(2000, {=>self.borrar()})
 	}
}

