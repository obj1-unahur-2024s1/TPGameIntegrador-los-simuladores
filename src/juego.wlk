import wollok.game.*
import componentes.*
import teclado.*
import timer.*
import titulo.*
import tablero.*
import utilidades.*

//se encarga de manejar el estado del juego
object juego {
	// Variable que almacena los datos de la partida actual para volver a jugar
	var partidaActual = null
	
	// Variable booleana que indica si inició la partida, por default es falsa
	// var inicioLaPartida = false
	
	// Genera una partida fácil, Wordle normal
	method generarPartidaFacil(){
		
		// Evita que se instancien nuevas partidas en mitad de una partida
		//if( not inicioLaPartida ){
		partidaActual = new EstadoDelJuego(esPorTiempo = false)
		//}
	}
	
	method configuracionInicial(){
		game.cellSize(24)
		game.title("Wordle - Wollok Edition")
		game.width(30)
		game.height(28)
		game.boardGround("fondo.png")
		titulo.dibujarElementos()
		teclado.dibujarElementos()
		timer.dibujarElementos()
		keyboard.space().onPressDo({
			instrucciones.habilitar()
		})
		self.generarPartidaFacil()
		game.start()
	}
	
		
	// method seAcaboElJuego() = inicioLaPartida and partidaActual.seAcaboElJuego()

	method intentosRestantes() = partidaActual.intentosRestantes()
	
	method restarIntento(){
		partidaActual.restarIntento()
	}
	
	method verificarSiGano(estados){
		if ( partidaActual.gano(estados) ){
			console.println("Ganaste :)")
			
		}
	}
}

object instrucciones inherits Celda(position = game.at(5,3), id = "instrucciones"){
	override method image() = "instrucciones.png"
	override method resetear(){}
	
	method habilitar(){
		if(self.estaDibujado()){
			self.borrar()
		}
		else{
			self.dibujar()
		}
	}
}

class EstadoDelJuego{
	
	var intentosRestantes = 6
	
	const esPorTiempo
	
	method seAcaboElJuego() = intentosRestantes == 0 or self.seAgotoElTiempo()
	
	method seAgotoElTiempo() = esPorTiempo and timer.tiempoRestante() == 0
	
	method restarIntento(){ intentosRestantes -= 1 }
	
	method intentosRestantes() = intentosRestantes
	
	// Indica si el estado que obtuvo es el ganador
	method gano(estados) = estados == ["Correcto", "Correcto", "Correcto", "Correcto", "Correcto"]
}






