import juego.*
import teclado.*
import wollok.game.*
import datos.*
import componentes.*
import utilidades.*

object tablero inherits Componente{
	
	var numeroDeIntentoActual = 0
	
	// La palabra a adivinar
	var palabraAAdivinar = null
	
	var property gano = false
	
	method initialize(){
		self.nuevaPalabraAAdivinar()
		self.agregarIntentosAlTablero()
		
		elementos.forEach({
			e => e.inicializar()
		})
	}
	
	method intentoActual()= elementos.get(numeroDeIntentoActual)
	
	// Crea una nueva palabra a adivinar
	method nuevaPalabraAAdivinar(){
		palabraAAdivinar = palabrasValidas.palabraAleatoria()
	}
	
	/**			METODOS PARA LAS TECLAS		 */
	
	method teclaPresionada(tecla){
		if(numeroDeIntentoActual < 6 ){
			self.intentoActual().escribir(tecla)
		}
	}
	
	
	// Maneja lo que sucede cuando se aprieta la tecla de borrar
	method deletePresionado(){
		if(numeroDeIntentoActual < 6 ){
			self.intentoActual().borrarUltimaLetra()
		}
	}
	
	// Maneja lo que sucede cuando se aprieta la tecla enter
	method enterPresionado(){
		if(numeroDeIntentoActual < 6 and self.intentoActual().estaCompleto()){
			self.intentoActual().validarIntento(palabraAAdivinar)
			self.verificarSiGano()
			if(self.intentoActual().esValido()){
				numeroDeIntentoActual = numeroDeIntentoActual + 1
			}
		}
	}
	
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
	
	method inicializar(){
		posicionesCeldasDelTablero.posiciones().get(numeroIntento).forEach({
			posicion =>
			celdasIntento.add(new CeldaIntento(position = posicion, ordenEnIntento = celdasIntento.size()))
		})
	}
	
	method dibujar(){
		celdasIntento.forEach({
			celda => celda.dibujar()
		})
	}
	
	method escribir(letra){
		if(celdaIntentoActual < 5){
			celdasIntento.get(celdaIntentoActual).actualizarLetra(letra)
			
			celdaIntentoActual = celdaIntentoActual + 1
			
			palabraQueRepresenta = palabraQueRepresenta.concat(letra)
		}
		
	}
	
	method borrarUltimaLetra(){
		if(celdaIntentoActual > 0){
			celdaIntentoActual = celdaIntentoActual - 1
		}
		celdasIntento.get(celdaIntentoActual).borrarLetra()
		palabraQueRepresenta = palabraQueRepresenta.take(celdaIntentoActual)
	}
	
	method validarIntento(palabraCorrecta){
		if(not palabrasValidas.esUnaPalabraValida(palabraQueRepresenta)){
			self.mostrarQueLaPalabraNoEsValida()
		} else{
			self.verificarAciertos(palabraCorrecta)
			esValido = true
		}
	}
	
	method verificarAciertos(palabraCorrecta){
			
		if(palabraQueRepresenta == palabraCorrecta){
			self.ponerTodasCorrectas()
			tablero.gano(true)
		}else {
			self.actualizarCeldasEstado(palabraCorrecta)
		}
	}
	
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
	
	method mostrarQueLaPalabraNoEsValida(){
		game.addVisual(avisoPalabraNoValida)
		game.schedule(2000, {=> game.removeVisual(avisoPalabraNoValida)})
	}
	
	method ponerTodasCorrectas(){
		celdasIntento.forEach({
			celda => celda.posicionCorrecta()
		})
	}

	method estaCompleto()=	celdaIntentoActual == 5	
}

object avisoPalabraNoValida inherits Celda(position = game.at(11, 22)){
	override method image() ="avisoPalabraNoValida.png"
 	override method resetear(){}
}

