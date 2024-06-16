import wollok.game.*
import componentes.*
import teclado.*
import timer.*
import titulo.*
import tablero.*

//se encarga de manejar el estado del juego
object juego{
	// Variable que almacena los datos de la partida actual para volver a jugar
	var partidaActual = null
	
	// Variable booleana que indica si inició la partida, por default es falsa
	// var inicioLaPartida = false
	
	/**
	// Selecciona la dificultad de la nueva partida, 1 para fácil, 2 para difícil
	method seleccionarDificultad(){
		keyboard.num1().onPressDo({ self.generarPartidaFacil() })
		keyboard.num1().onPressDo({ self.generarPartidaDificil() })
	}
	*/
	// Genera una partida fácil, Wordle normal
	method generarPartidaFacil(){
		
		// Evita que se instancien nuevas partidas en mitad de una partida
		//if( not inicioLaPartida ){
			partidaActual = new EstadoDelJuego(esPorTiempo = false)
		//}
	}
	
	/**
	// Genera una partida difícil, Wordle con 1 minuto
	method generarPartidaDificil(){
		
		// Evita que se instancien nuevas partidas en mitad de una partida
		if( not inicioLaPartida ){
			partidaActual = new EstadoDelJuego(esPorTiempo = true)
			timer.dibujarElementos()
		}
	}
	*/
	method configuracionInicial(){
		game.cellSize(24)
		game.title("Wordle - Wollok Edition")
		game.width(30)
		game.height(28)
		game.boardGround("fondo.png")
		titulo.dibujarElementos()
		teclado.dibujarElementos()
		timer.dibujarElementos()
		self.generarPartidaFacil()
		game.start()
	}
	
		/**
	method finalizarPartidaActual(){
		if ( self.seAcaboElJuego() ){
			game.clear()
			inicioLaPartida = false
			self.configuracionInicial()
		}
	}
	*/
	// method seAcaboElJuego() = inicioLaPartida and partidaActual.seAcaboElJuego()

	method intentosRestantes() = partidaActual.intentosRestantes()
}

class EstadoDelJuego{
	
	var intentosRestantes = 4
	
	const esPorTiempo
	
	method seAcaboElJuego() = intentosRestantes == 0 or self.seAgotoElTiempo()
	
	method seAgotoElTiempo() = esPorTiempo and timer.tiempoRestante() == 0
	
	method restarIntento(){ intentosRestantes -= 1 }
	
	method intentosRestantes() = intentosRestantes
}






