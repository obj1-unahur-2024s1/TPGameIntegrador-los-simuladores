import wollok.game.*
import componentes.*
import teclado.*
import timer.*
import titulo.*
import tablero.*
import utilidades.*
import pantallas.*

//se encarga de manejar el estado del juego
object juego {
	
	var pantallaActual = pantallaInicio		
	
	method configuracionInicial(){
		game.cellSize(24)
		game.title("Wordle - Wollok Edition")
		game.width(30)
		game.height(28)
		game.boardGround("fondo.png")
		pantallaActual.dibujarPantalla()
		//titulo.agregarElementos()
		//teclado.agregarElementos()
		//tablero.agregarElementos()
		//timer.agregarElementos()
		self.activarInstrucciones()
		//self.generarPartidaFacil()
		game.start()
	}
	
	method activarInstrucciones(){
		keyboard.space().onPressDo({
			instrucciones.habilitar()
		})
		keyboard.num3().onPressDo({
			game.say(instrucciones,game.allVisuals().size().toString())
		})
		keyboard.num4().onPressDo({
			game.say(instrucciones,tablero.palabraAAdivinar())
		})
	}
	
	method cambiarPantalla(nuevaPantalla){
		pantallaActual.eliminar()
		pantallaActual = nuevaPantalla
		pantallaActual.dibujarPantalla()
		self.activarInstrucciones()
	}
}

object instrucciones inherits Celda(position = game.at(5,3)){
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







