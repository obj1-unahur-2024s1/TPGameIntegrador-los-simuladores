import wollok.game.*
import componentes.*
import teclado.*
import timer.*
import titulo.*


//se encarga de manejar el estado del juego
object juego{
	
	method configuracionInicial(){
		game.cellSize(24)
		game.title("Wordle - Wollok Edition")
		game.width(30)
		game.height(28)
		game.boardGround("fondo.png")
		titulo.dibujarElementos()
		teclado.dibujarElementos()
		timer.dibujarElementos()
		game.start()
	}
}






