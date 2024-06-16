import utilidades.*
import wollok.game.*

class Pantalla inherits Celda {
	
	override method image() = "pantallas/" + id + ".png"
	
	override method resetear(){}
	
	method mostrarPalabraAValidar(palabraAValidar){

		
		
	}
}

class PantallaInicio inherits Pantalla{}

	object pantallaInicio inherits Pantalla(id=self.toString(), position = game.center()){
		
	}

	


class PantallaGameOver inherits Pantalla{
	
		
	
}