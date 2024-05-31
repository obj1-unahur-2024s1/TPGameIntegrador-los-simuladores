import wollok.game.*

class Celda{
	const property position 
	method image()
}

class CeldaEstado inherits Celda{
	var estado = "Inicial"
	const ruta
	override method image()= ruta+estado+".png" 
	method dibujar(){
		game.addVisual(self)
	}
	
	method correcto(){
		estado = "Correcto"
	}
	
	method errado(){
		estado = "Errado"
	}
	
	method inexistente(){
		estado = "Inexistente"
	}
}
