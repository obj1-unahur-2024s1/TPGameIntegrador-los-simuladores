import juego.*
import teclado.*
import wollok.game.*
import datos.*
import componentes.*
import utilidades.*

object tablero inherits Componente{
	
	// indica el intento en el que se encuentra el jugador
	var numeroDeIntentoActual = 0
	
	// La palabra a adivinar
	var palabraAAdivinar = null
	
	// indica si el jugador gano la partida
	var property gano = false
	
	
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
		if(numeroDeIntentoActual < 6 ){
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
			//pantallaPerdiste
		}else{
			//pantallaGanaste
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
		
	const property celdaEstado = new CeldaEstado(id="celdaEstado", position=position, ruta="celdasPalabra/celda")
	const celdaLetra = new CeldaLetra(id="celdaLetra", letra="vacio", position = position)
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
	
	// actualiza las celdas estado de las letras correspondientes
	method actualizarCeldasEstado(palabraCorrecta){
		
		celdasIntento.forEach({
			celda => 
			const letra = celda.letraQueRepresenta().toString()
			if( letra == palabraCorrecta.charAt(celda.ordenEnIntento() ) ){
				celda.celdaEstado().posicionCorrecta()
				teclado.teclaQueRepresentaALaLetra(letra).celdaEstado().posicionCorrecta()
			}else if( palabraCorrecta.contains( letra ) ){
				celda.celdaEstado().posicionEquivocada()
				teclado.teclaQueRepresentaALaLetra(letra).celdaEstado().posicionEquivocada()
			}else{
				celda.celdaEstado().noLaContiene()
				teclado.teclaQueRepresentaALaLetra(letra).celdaEstado().noLaContiene()
			}
		})	
	}
	
	// Avisa que la palabra escrita no es valida
	method mostrarQueLaPalabraNoEsValida(){
		game.addVisual(avisoPalabraNoValida)
		game.schedule(2000, {=> game.removeVisual(avisoPalabraNoValida)})
	}
	
	//cambia a correctas todas las celdas del intento
	method ponerTodasCorrectas(){
		celdasIntento.forEach({
			celda => celda.posicionCorrecta()
		})
	}
	
	//indica si el intento esta completo
	method estaCompleto()=	celdaIntentoActual == 5	
}

object avisoPalabraNoValida inherits Celda(position = game.at(11, 22)){
	override method image() ="avisoPalabraNoValida.png"
 	override method resetear(){}
}

