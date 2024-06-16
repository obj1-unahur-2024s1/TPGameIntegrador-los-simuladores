import wollok.game.*
import juego.*

object menu{
	method initialize(){
		self.mostrarInstrucciones()
		keyboard.num1().onPressDo({ juego })
	}
}

object instrucciones{
	
}