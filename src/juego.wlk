import wollok.game.*
import componentes.*
import teclado.*
import timer.*

object juego{
	
	method configuracionInicial(){
		game.cellSize(24)
		game.title("Wordle - Wollok Edition")
		game.width(30)
		game.height(28)
		game.boardGround("fondo.png")
		teclado.dibujarElementos()  //prueba
		timer.dibujarElementos()	//prueba
		game.start()
	}
}






